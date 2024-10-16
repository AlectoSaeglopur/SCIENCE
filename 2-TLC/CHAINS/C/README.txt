/*************/
/*** NOTES ***/
/*************/

0. To compile and run in target mode:
    "cls && build.bat target"

-------------------------------------------------------------------------------

1. To debug code via GDB within Visual Studio Code (VSC):
    - switch VSC default console to Git bash ("F1 > "Terminal: Select Default Profile > Git bash");
    - add "-g" flag to compiler flags to enable debugging;
    - keep compiler optimization disabled while debugging (i.e. use "-O0" as compiler flag);
    - add a ".vscode\launch.json" file specifying all debug options (and optionally also a "task.json" file for additional pre/post-debug actions);
    - NB: keep in mind need to recompile if any change has been made on source files before startin debug!

-------------------------------------------------------------------------------

2. To debug via watermarks within the code:
    - copy the watermark code (one per level) displayed on terminal;
    - search for the latter inside "target.map" and "objdump.txt" placed within and "build\target\lis\", where the function names
      are linked to the corresponding memory addresses;
    - NB: actual addresses read at run-time may not match exactly the ones written in the x2 aforementioned files since the PC can add some
      offset upon running the executable; to avoid this mismatch on MSBs an address filtering via "WATERMARK_MASK" has been added.

-------------------------------------------------------------------------------

3. Regarding Doxygen:
   - note whenever specifying a relative path inside the "doxyfile" (e.g. for setting INPUT, OUTPUT_DIRECTORY and PROJECT_LOGO) the root path is not where the latter is located (i.e. "docs\doxygen\config") but where the "doxygen" command is invoked (in this case by "build.bat", so the main project directory).



/*************/
/*** @todo ***/
/*************/

// generate .elf file and find out how this may come in handy!
// try to add linker file (.icf file?)
// add CC with rate lower than 1/2 (e.g 1/3!) >> prova mettendo in cascata più encorer da 1/2! (fai simulazione in python e vedi se performance sono effettivamente migliori!)
// sistema Makefile (print, utest, etc..)
// sistema makefile in modo che non sia obbligatorio cancellare ogni volta cartella di build (solo se esplicitato in comando), così più veloce a ricompilare!
// aggiungi comando di solo target exe in makefile
// write instruction about how to clean/compile/run
// rifai funzionare utest build!
// aggiungi qui note che adesso sono in fondo a "Makefile" file
// prova a compilare con altri compilatori diversi da GCC
