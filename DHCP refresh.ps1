# Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
# GNU GENERAL PUBLIC LICENSE
# Version 3, 29 June 2007

Write-Output "DHCP refresh.ps1, Author: Simon Brännström <simon.brannstrom1@gmail.com>.
 
This might help if you ever suffer from connection issues to the internet.
It might, because this script will request a new local IP address from your router.
Usually when people have issues accessing the internet, it's because of an issue with the communication between your device and the router.

If this doesn't work for you, then I suggest restarting your router and waiting 5 min. Calling your <Internet Service Provider> will probably also help.
"
Pause
Write-Output "Requesting new local IP address from your router..."
ipconfig /release | Wait-Process
ipconfig /renew | Wait-Process
Write-Output "Done! You can close this window or Press ENTER to close it."
Pause