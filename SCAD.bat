REM Copyright (C) 2021 Simon Brännström
REM GNU GENERAL PUBLIC LICENSE
REM Version 3, 29 June 2007
echo Press Enter to start checking for issues using sfc and DISM and attempt to repair them.
echo  
echo Will launch as administrator if you press [Enter].
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

echo Gonna run sfc once and then 2 different scans with DISM.
echo  
echo This will take some time to finish, but how long it takes depends on your computer.

sfc /scannow
DISM /Online /Cleanup-image /Scanhealth
DISM /Online /Cleanup-image /Restorehealth
echo System scans complete! Logs can be found in 'C:\Windows\Logs\CBS' and 'C:\Windows\Logs\DISM' folders. Please send these to your IT technician if you're still having issues. > %userprofile%\Desktop\SCAD-NOTE.txt
type %userprofile%\Desktop\SCAD-NOTE.txt

echo Printing this as a note to %userprofile%\Desktop\SCAD-NOTE.txt
echo  
echo Press [Enter] to end this script.
pause
