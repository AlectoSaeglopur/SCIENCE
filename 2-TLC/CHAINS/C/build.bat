
:: initialization
@echo off
setlocal
echo ^>^> Starting batch execution...
echo ------------------------------------------------

:: check arguments
if "%1"=="" (
    echo ERROR: Too few arguments provided! ^(x1 expected^)
    exit /b
)
if not "%2"=="" (
    echo ERROR: Too many arguments provided! ^(x1 expected^)
    exit /b
)

:: run make
call make %1 | tee build\%1\%1.log
