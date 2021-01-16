If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
Write-Output "Gonna run 3 separate scans of Windows to check for issues and attempt to repair them.

Press ENTER key to start the scan process. This will take approx. 10-15 minutes to finish"
pause
sfc /scannow
DISM /Online /Cleanup-image /Scanhealth
DISM /Online /Cleanup-image /Restorehealth
Write-Output "
System scans complete! Logs can be found in 'C:\Windows\Logs\CBS' and 'C:\Windows\Logs\DISM' folders. Please send these to your IT technician if you're still having issues."
pause