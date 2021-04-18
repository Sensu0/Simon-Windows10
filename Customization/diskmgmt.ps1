# Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
diskmgmt.msc