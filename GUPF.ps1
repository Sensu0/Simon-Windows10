# Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007

Write-Output "GUPF.ps1, Author: Simon Brännström <simon.brannstrom1@gmail.com>.

This is going to sync group policy for the computer and the logged-in account against the closest domain controller.

In case you accidentally close this window after running it, I made sure this script will print output to a file on your DESKTOP.

NOTE: This will likely not work if you're working from home, unless if you have a VPN connection to your office network.

NOTE 2: This might not work on a privately owned computer, since it likely won't be connected to a domain network.
"
Pause
gpupdate /force > $HOME\Desktop\GUPF-output.txt | gpupdate /force | Wait-Process
Write-Output "
Done! Pressing ENTER will close this window.
"
Pause