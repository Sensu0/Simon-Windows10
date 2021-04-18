Write-Host "This will setup a bunch of PowerShell aliases
"
$path = Read-Host "Enter path of the 'Powershell' folder

Default for most people will be $env:userprofile\Downloads\Simon-Windows10\Powershell" -Prompt

# All of these programs end with ".msc"

Set-Alias -Name certs -Value $path\certmgr.ps1
Set-Alias -Name empty-bin -Value $path\Delete-bin.ps1
Set-Alias -Name devmgmt -Value $path\devmgmt.ps1
Set-Alias -Name diskmgmt -Value $path\diskmgmt.ps1
Set-Alias -Name services -Value $path\services.ps1
Set-Alias -Name firewall -Value $path\WF.ps1

# Aliases not dependent on scripts

Set-Alias -Name htop -Value perfmon /res
Set-Alias -Name cpanel -Value Control Panel