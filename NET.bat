REM Copyright (C) 2021 Simon Brännström
REM GNU GENERAL PUBLIC LICENSE
REM Version 3, 29 June 2007

echo If you are having trouble with connecting to the internet or other network related issues, this might help against them. Press [Enter] to continue.
pause

@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:

ipconfig /flushdns && Arp -a -d && Nbtstat -R && Nbtstat -RR && netsh int ip reset && Netsh winsock reset

echo Next, we need to restart your computer. Press [Enter] to restart the computer.
pause
shutdown -r -t 0
