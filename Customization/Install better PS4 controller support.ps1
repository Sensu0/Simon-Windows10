# Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007

# Run script as admin. NOTE: If logged in as standard user, this script will run as another user with admin rights.
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Location where all files will be downloaded.
$location = "~\Downloads"

Write-Host "Please edit the location varible to change the download path.
Current path is set to $location"
Pause
Clear-Host

# Dependencies for DS4Windows
$url1 = "https://download.visualstudio.microsoft.com/download/pr/c1ef0b3f-9663-4fc5-85eb-4a9cadacdb87/52b890f91e6bd4350d29d2482038df1c/windowsdesktop-runtime-5.0.5-win-x64.exe"
$url2 = "https://aka.ms/vs/16/release/vc_redist.x64.exe"

# Release version of DS4Windows
$url3 = "https://github.com/Ryochan7/DS4Windows/releases/download/v3.0.3/DS4Windows_3.0.3_x64.zip"
$DS4Windowsver = "DS4Windows_3.0.3"

# Comment out line 20, 21, 24 and uncomment the 3 lines below if you are running a 32-bit version of Windows 10.
# $url1 = "https://download.visualstudio.microsoft.com/download/pr/c089205d-4f58-4f8d-ad84-c92eaf2f3411/5cd3f9b3bd089c09df14dbbfb64124a4/windowsdesktop-runtime-5.0.5-win-x86.exe"
# $url2 = "https://aka.ms/vs/16/release/vc_redist.x86.exe"
# $url3 = "https://github.com/Ryochan7/DS4Windows/releases/download/v3.0.3/DS4Windows_3.0.3_x86.zip"

Write-Host "Step 1 of 5
Downloading dotnet5..."
Invoke-WebRequest -Uri $url1 -OutFile $location\dotnet5.exe
Clear-Host

Write-Host "Step 2 of 5
Downloading vcredist 2015-2019..."
Invoke-WebRequest -Uri $url2 -OutFile $location\vcredist.exe
Clear-Host

Write-Host "Step 3 of 5
Downloading $DS4Windowsver.zip..."
Invoke-WebRequest -Uri $url3 -OutFile $location\$DS4Windowsver.zip
Clear-Host

Write-Host "
Step 4 of 5

Installing dotnet5 and vcredist 2015-2019..."
.$location\dotnet5.exe ; .$location\vcredist.exe

Write-Host "
Wait until all the installations have finished before continuing with this script!"
Pause

Write-Host "
Step 5 of 5

Extracting $DS4Windowsver.zip to 'C:\Program Files\'.."
Expand-Archive -Path $location\$DS4Windowsver.zip -DestinationPath 'C:\Program Files\' -Force

Write-Host "
Done! You can close this window.
Nothing else will run after this message."
Pause