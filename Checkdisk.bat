@ECHO OFF
: Copyright (C) 2021 Simon Brännström
: GNU GENERAL PUBLIC LICENSE
: Version 3, 29 June 2007
echo This script requires administrator rights to execute.
echo.
echo If you're running this in standard mode,
echo this script will prompt you to run it as administrator,
echo so no need to relaunch it manually as administrator.
echo. 
pause | echo Close this window to cancel. Press any key to continue.

:: BatchGotAdmin        
:-------------------------------------        
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (    echo Requesting administrative privileges...    goto UACPrompt) else ( goto gotAdmin )  
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
    "%temp%\getadmin.vbs"  
    exit /B
:gotAdmin

cd %windir%
echo.
chkdsk /scan /B
echo.
echo.
pause | echo Press any key to restart the computer. Close this window to restart later.
shutdown /r /t 0
