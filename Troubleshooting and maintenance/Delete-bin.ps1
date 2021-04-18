# Copyright (C) 2021 Simon Brännström
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007
#
# UAC prompt
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Write-Host "This will delete all files and folders in Recycle Bin for all users on this computer.

There is no way to recover from this!
"
pause
Write-Host "
Deleting items in Recycle Bin..."
# Remove all files in Recycle Bin for all users.
Get-ChildItem 'C:\$Recycle.bin\' -Force | Remove-Item -Recurse -force
Write-Host "
Done! Pressing [Enter] will close this window.
"
pause