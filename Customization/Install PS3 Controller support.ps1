# Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007

# Run script as admin. NOTE: If logged in as standard user, this script will run as another user with admin rights.
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Location where all files will be downloaded
$location = "D:\Downloads"

Write-Host "Please edit the location varible to change the download path.
Current path is set to $location"
Pause
Clear-Host

# URLs of files to download
$url1 = "https://github.com/ViGEm/BthPS3/releases/download/setup-v1.3.127/BthPS3Setup_x64.msi"
$url2 = "https://github.com/ViGEm/DsHidMini/releases/download/v1.3.130.0/dshidmini_v1.3.130.0.zip"

# Version of DsHidMini driver used in this script
$dshidminiver = "dshidmini_v1.3.130.0"

Write-Host "Step 1 of 5
Downloading BthPS3Setup.msi driver files..."
Invoke-WebRequest -Uri $url1 -OutFile $location\BthPS3Setup_x64.msi
Clear-Host

Write-Host "Step 2 of 5
Downloading $dshidminiver.zip..."
Invoke-WebRequest -Uri $url2 -OutFile $location\$dshidminiver.zip

Write-Host "
Step 3 of 5

Installing BthPS3 for USB functionality..."
.$location\BthPS3Setup_x64.msi

Write-Host "
Step 4 of 5

Extracting $dshidminiver.zip, then installing driver..."
Expand-Archive -Path $location\$dshidminiver.zip -DestinationPath $location\$dshidminiver\ -Force ; (
    PNPUtil.exe /add-driver $location\$dshidminiver\x64\dshidmini\dshidmini.inf
)

Write-Host "
Wait until all the installations have finished before continuing with this script!"
Pause

Write-Host "
Step 5 of 5

Moving $dshidminiver folder to 'C:\Program Files (x86)'..."
Move-Item -Path $location\$dshidminiver -Destination 'C:\Program Files (x86)' -Force

Write-Host "
If you want
'C:\Program Files (x86)'\$dshidminiver\DSHMC.exe
To run on login, open explorer.exe and paste a shortcut of it into 'shell:startup'

Nothing else will run after this message."
Pause
