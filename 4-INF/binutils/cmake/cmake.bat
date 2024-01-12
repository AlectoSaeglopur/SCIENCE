
:: disable echo to prevent all commands from dysplaying outputs on screen
@echo off

:: clear shell
cls

:: choose build-folder name
set BFL=build
echo Build-folder name is "%BFL%"

:: choose make app ("make" or "mingw32-make")
set VMAKE=mingw

:: delete, create and move to build-folder
if exist %BFL% rmdir %BFL% /s /q
mkdir %BFL%
cd %BFL%

:: execute Cmake to generate Makefile
cmake .. -G "MinGW Makefiles"

:: run Makefile to build the project (with either "make" or "mingw32-make")
if "%VMAKE%"=="mingw" (
    echo Launching mingw32-make...
    mingw32-make
) else (
    echo Launching make...
    make
)

:: run the .exe file generated in the build-folder (NB: actually EACH .exe file is launched)
for %%f in (*.exe) do (
    if "%%~xf"==".exe" %%f
)

ECHO Batch file completed!
PAUSE



:: NOTES ::

:: 1. To run the Cmake building procedure simply double-click this .bat file.