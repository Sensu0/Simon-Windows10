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
    echo This script is for checking for Windows specific issues using sfc and DISM and attempt to fix them.
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

	echo Gonna run sfc once and then 2 different scans with DISM...
	echo.
	echo This will take some time to finish, but how long it takes depends on your computer.
	echo.
	echo DON'T CLOSE THIS WINDOW!
	echo.

: Run sfc first and then DISM & DISM with high priority.
cd /D %windir%\System32
echo Step 1 of 4
echo.
start /high /B /WAIT sfc.exe /scannow
echo Step 2 of 4
echo.
start /high /B /WAIT Dism.exe /Online /Cleanup-image /Scanhealth
echo Step 3 of 4
echo.
start /high /B /WAIT Dism.exe /Online /Cleanup-image /Restorehealth
echo Step 4 of 4
echo.
start /high /B /WAIT sfc.exe /scannow

: Print this message to a text file on the root of the boot drive.
: Usually C:\
echo System scans complete! Logs can be found in 'C:\Windows\Logs\CBS' and 'C:\Windows\Logs\DISM' folders. Please send these to your IT technician if you're still having issues. > "%windir%\..\Fix-Windows-NOTE.txt"
: Show content of text file in cmd
type "%windir%\..\Fix-Windows-NOTE.txt"

echo Printing this as a note to %windir%\..\Fix-Windows-NOTE.txt
echo.  
pause | echo Press Any key to close this window.
