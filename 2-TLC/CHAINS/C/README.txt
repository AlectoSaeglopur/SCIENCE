
>> 1. LAUNCH <<

§ To compile and run use:
  - target mode >> "cls && build.bat target"
  - unit test mode >> "cls && build.bat utest"

-------------------------------------------------------------------------------

>> 2. DEBUG <<

§ To debug code via GDB within Visual Studio Code (VSC):
  - switch VSC default console to Git bash ("F1 > "Terminal: Select Default Profile > Git bash");
  - add "-g" flag to compiler flags to enable debugging;
  - keep compiler optimization disabled while debugging (i.e. use "-O0" as compiler flag);
  - add a ".vscode\launch.json" file specifying all debug options (and optionally also a "task.json" file for additional pre/post-debug actions);
  - NB: keep in mind need to recompile if any change has been made on source files before startin debug!

§ To debug via watermarks within the code:
    - copy the watermark code (one per level) displayed on terminal;
    - search for the latter inside "target.map" and "objdump.txt" placed within and "build\target\lis\", where the function names
      are linked to the corresponding memory addresses;
    - NB: actual addresses read at run-time may not match exactly the ones written in the x2 aforementioned files since the PC can add some
      offset upon running the executable; to avoid this mismatch on MSBs an address filtering via "WATERMARK_MASK" has been added.

-------------------------------------------------------------------------------

>> 3. DOXYGEN <<

§ Note whenever specifying a relative path inside the "doxyfile" (e.g. for setting INPUT, OUTPUT_DIRECTORY and PROJECT_LOGO) the root path is not where the latter is located (i.e. "docs\doxygen\config") but where the "doxygen" command is invoked (in this case by "build.bat", so the main project directory).

-------------------------------------------------------------------------------

>> 4. LINKER <<

§ To show (and save) GCC default linker script, type on shell "ld --verbose [> docs\gcc_default_linker_script.ld]" or save it via

-------------------------------------------------------------------------------





/*************/
/*** @todo ***/
/*************/

// add CC with rate lower than 1/2 (e.g 1/3!) >> prova mettendo in cascata più encorer da 1/2! (fai simulazione in python e vedi se performance sono effettivamente migliori!)
// sistema Makefile (print, utest, etc..)
// sistema makefile in modo che non sia obbligatorio cancellare ogni volta cartella di build (solo se esplicitato in comando), così più veloce a ricompilare!
// aggiungi comando di solo target exe in makefile
// write instruction about how to clean/compile/run
// rifai funzionare utest build!
// aggiungi qui note che adesso sono in fondo a "Makefile" file
// prova a compilare con altri compilatori diversi da GCC (e.g. Clang)
// try automatic build via jenkins
/**
 * @file modulation.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
 * @ingroup TLC_CHAIN
 * @brief Modulation library
 * 
 * Library containing modulation functions.
 */