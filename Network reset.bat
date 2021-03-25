@ECHO OFF
: Copyright (C) 2021 Simon Brännström
: GNU GENERAL PUBLIC LICENSE
: Version 3, 29 June 2007

: Skip message at ScriptStart and proceed from gotAdmin if in administrator session.
::----------------------------------------------------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' ( goto ScriptStart ) else ( goto gotAdmin )

:ScriptStart
echo If you are having trouble with connecting to the internet or other network related issues, this might help against them.
echo.
echo This script requires administrator rights to execute.
echo.
echo If you're running this in standard mode,
echo this script will prompt you for your administrator credentials and continue execution.
echo. 
pause | echo Close this window to cancel. Press any key to continue.


: Prompt for administrator rights if cacls provides error. Otherwise, proceed.
::----------------------------------------------------------------------------
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

echo Resetting various network caches and datafiles...
echo.
Ipconfig /flushdns && Arp -d * && Nbtstat -R && Nbtstat -RR && netsh int ip reset && Netsh winsock reset
echo.
echo The computer needs to be restarted.
echo.
pause | echo Press Any key to restart the computer.
shutdown -r -t 0
