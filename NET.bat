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

echo Resetting various network caches and datafiles...
echo on
Ipconfig /flushdns && Arp -d * && Nbtstat -R && Nbtstat -RR && netsh int ip reset && Netsh winsock reset
echo off
echo The computer needs to be restarted. Press [Enter] to restart.
pause
shutdown -r -t 0
pause
echo Nothing to see here! Unless, your computer can't shutdown for whatever reason.
pause
echo You should just reinstall Windows at this point, honestly. I doubt sfc and DISM will save your sorry ass.
pause
echo ...
pause 
echo Have you seen Deez? Y'know, DEEZ NUTS! HAHA, GOT 'EM!