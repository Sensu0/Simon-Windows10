REM Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
REM GNU GENERAL PUBLIC LICENSE
REM Version 3, 29 June 2007

echo NOTE! This script is only relevant for users that have accounts managed on a server for login on computers {i.e domain computers}.
echo  
echo This will do nothing for independent computers. Press [Enter] to continue with execution.
pause
echo   
echo Syncing group policy changes in Active Directory to computer and user account...
gpupdate /force
echo   
echo Done! Pressing [Enter] will close this window.
Pause
