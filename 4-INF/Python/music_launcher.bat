
:: disable echoing to terminal
@echo off

:: path to script
set PYSCRIPT=C:\Users\VKN\Documents\Science\4-INF\Python\music_launcher.py
:: script options
set PYOPTIONS=--size 20

:: set loop starting point
:loop

:: run python script with specific arguments
python %PYSCRIPT% %PYOPTIONS%

:: print message and pause execution
echo ^>^> Press any key to generate a new playlist...
pause >nul

:: clear shell
cls

:: jump back to loop starting point
goto loop