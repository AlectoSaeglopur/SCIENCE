### MAKE & CMAKE ###

§ x3 ways to build a C project using:
- standalone "make" (v1 or v2) by acting on related "Makefiles";
- "make" driven by "cmake" by acting on "CMakeLists.txt".

§ Starting from the .h and .c files the scripts generate:
- compiled preprocessor outputs (.i);
- compiled assembly files (.s);
- compiled object files (.o);
- linked map file (.map);
- linked executable (.exe).s

---------------------------------------------

### BINUTILS ###

§ Several binutils tools have been tested (already part of the standard MinGW pack):
- size -> to display memory sections size, e.g. "size -G convolutional.o modulation.o extra.o main.o vkn.exe";
- nm -> to display symbols, e.g. "nm extra.o --defined" or "nm vkn.exe";
- objcopy -> to convert binary formats, e.g. "objcopy vkn.exe -O srec vkn.srec" or "objcopy vkn.exe -O binary vkn.bin";
- objdump -> to retrieve assembly code from object file, e.g. "objdump -d extra.o" or "objdump -D vkn.exe > log_objdump.txt";
- NB#1: to know more options use --help for info for all commnads;
- NB#2: remember that an executable file (i.e. with extension .exe) is just a type of object files!

§ For example, to use the GDB debugger from shell:
- gdb vkn.exe                   -> start GDB on vkn.exe file;
- break modulation.c:77         -> set breakpoint at line #77 of source file modulation.c (if not working, try specifying the absolute path);
- run                           -> run execution, then it will stop at breakpoint;
- print /d Mask                 -> print "Mask" variable in signed decimal format (returns 1);
- print /x IoArray[0]@4         -> print first x4 elements of "IoArray" in hexadecimal format (returns [0x0,0x6d,0x9f,0xe5]);
- next                          -> step over at source-code level (aka move to next source code line);
- print /x IoArray[0]@4         -> print first x4 elements of "IoArray" in hexadecimal format (returns [0x0,0x0,0x0,0x0] since "memset" has been executed);
- set variable IoArray[1] = 12  -> to change a variable in memory at run-time
- print /x IoArray[0]@4         -> print first x4 elements of "IoArray" (returns [0x0,0xc,0x0,0x0] due to previous command);
- quit                          -> to exit debug;
- NB#1: remember to compile the project with the "-g" flag (as for make_v2) to be able to debug with GDB;
- NB#2: use the command "step" for step-into debug at source-code level;
- NB#3: use "nexti" and "stepi" to step at assembly-instruction level.
