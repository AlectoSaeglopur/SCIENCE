
@echo off

:: path to script
set PYSCRIPT=H:\SCIENCE\4-INF\Python\playlist_launcher.py

:: script options
set PYOPTIONS=--size 20

:: open Git bash within current path
python %PYSCRIPT% %PYOPTIONS%

pause
