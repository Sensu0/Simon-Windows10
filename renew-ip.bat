@ECHO OFF
: Copyright (C) 2021 Simon Brännström
: GNU GENERAL PUBLIC LICENSE
: Version 3, 29 June 2007

echo This might help against issues with communication between the computer and the router.
echo It will request a new local IP address through DHCP from the router.
echo.
echo This does not require a restart of the computer.
echo But a restart of the computer will essentially do the same thing as this script.
echo.
pause | echo Press [Ctrl+C] to cancel script. Press any other key to continue.
echo.
ipconfig /release && ipconfig /renew
