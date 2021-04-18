@echo off 
REM Copyright (C) 2021 Simon Brännström <simon.brannstrom1@gmail.com>
REM GNU GENERAL PUBLIC LICENSE
REM Version 3, 29 June 2007

echo NOTE! This script is only relevant for users that have accounts managed on a server for login on computers {i.e domain computers}.
echo.
echo This will do nothing for independent/home computers.
echo Only effective on domain computers. In other words, work computers.
echo.
echo.
echo Syncing group policy changes for Active Directory for the computer and logged in user account... )
echo.
gpupdate /force
echo.
Pause | echo Done! Pressing any key will close this window.
