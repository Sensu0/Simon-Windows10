# admin-templates

This is simply a document featuring the code strings needed to have a script execute with admin rights automatically for PowerShell and CMD/Batch.

## For CMD and Batch script:

### Before either of these 2 methods for CMD/Batch

Paste in the following code at the beginning of the script if you want to give the user some info before escalation of privligies via User Account Control.

```
: If running this as standard user, 
::----------------------------------------------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
REM --> If error flag set, we do not have admin.
REM Every command in 
if '%errorlevel%' NEQ '0' (
	goto ScriptStart
	) else ( goto gotAdmin )
:ScriptStart
```

### Below is one method:

```
@echo off
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
```

### Here is another:

```
@echo off        
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
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
```

## For PowerShell:

```
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
```
