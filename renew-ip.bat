REM Copyright (C) 2021 Simon Brännström
REM GNU GENERAL PUBLIC LICENSE
REM Version 3, 29 June 2007

echo This might help against issues with communication between the computer and the router. It will request a new local IP address from the router. Press [Enter] to continue.
pause
ipconfig /release && ipconfig /renew
