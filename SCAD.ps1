# Copyright (C) 2021 Simon Brännström
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007
Write-Output "Press Enter to start checking for issues and attempt to repair them.

NOTE: Administrator privligies needed to start script!
If you don't have those on the logged-in account or you don't have the username and/or password for one, contact an IT professional.
"
Pause
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
Write-Output "Gonna run 3 separate scans of Windows to check for issues and attempt to repair them.

This will take some time to finish, but how long it takes depends on your computer.
"
sfc /scannow | Wait-Process
DISM /Online /Cleanup-image /Scanhealth | Wait-Process
DISM /Online /Cleanup-image /Restorehealth | Wait-Process
Write-Output "
System scans complete! Logs can be found in 'C:\Windows\Logs\CBS' and 'C:\Windows\Logs\DISM' folders. Please send these to your IT technician if you're still having issues.

Printing this as a note to Desktop in case you forget.

NOTE: If you had to put in a username and password to run this, then the note will be stored inside the Desktop of that account.
" | Out-File $HOME\Desktop\SCAD-NOTE.txt
Get-Content -Path $HOME\Desktop\SCAD-NOTE.txt
pause