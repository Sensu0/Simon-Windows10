# Simon-Windows10

This is a repo to help people fix common issues with the Windows operating system, but also to customize Windows 10.

I learned how to make these on my free time and while working in Servicedesk. Tested and confirmed to be working on Windows 10 20H2, but it will probably word on older Windows operating systems as well.

---

### Troubleshooting and maintenance

Here, you will find scripts for troubleshooting and maintenance

#### Windows-specific issues

<i>Fix-Windows.bat</i> is designed scan for issues related to Windows internal issues and attempt to fix them. For example, if Explorer.exe starts crashing randomly or the Start Menu won't show up or appears broken.

In case that won't work, you may have issues with the partition itself so running <i>Checkdisk.bat</i> and rebooting your computer might help, which the script will prompt you fo

#### For network issues

I would start by running <i>renew-ip.bat</i> to ask your network AP to provide a new IP address (provided you're using commonly default DHCP ON setting on your router). It will essentially have the same effect as restarting the computer except you don't actually have to do it when running that script.

If you're still having issues there, try <i>Network reset.bat</i> to perform a lot more advanced troubleshooting, but do note it requires a restart afterwards, which this script will prompt for as well, once finished.

#### Profesional & Enterprise specific

This is not relevant for the average home user, but rather for corporate computers with Windows 10 Pro or Enterprise equivalent and which are connected to a domain.

<i>gpupdate.bat</i> might help you when you've made changes to <b>Active Directory</b> from a server on the local computer, such as resetting or changing a password or for example given a user access to a specific path on your network storage.

The script works by running <i>gpupdate /force</i> in <i>cmd.exe</i> to sync AD changes between the domain controller and the client.

<i>Delete-bin.ps1</i> will clean the recyclebin for all the users that have a profile on the given computer.

### Customization

These scrippts are purely for tweaking Windows 10 to my liking.

<i>Install PS3 Controller support.ps1</i> will install drivers from <a href="https://github.com/ViGEm">ViGEm</a> for making Playstation 3 controllers compatible with with Windows 10. Your dead CMOS battery may prevent you from playig digital games, but at least you can use the controller for <a href="https://rpcs3.net/">RPCS3</a>.

<i>Install better PS4 Controller support</i> will install and <a href="https://github.com/Ryochan7/DS4Windows">DS4Windows</a> (dependencies <a href="https://dotnet.microsoft.com/download/dotnet/5.0/runtime">.NET 5</a> and <a href="https://support.microsoft.com/en-us/topic/the-latest-supported-visual-c-downloads-2647da03-1eea-4433-9aff-95f26a218cc0">Visual C++ 2015-2019 Redistributable</a> are also installed with this script), thus giving you more options to tweak your PS4 controller and the ability to have it be recognized as an Xinput controller.


<i>Set-Alias.ps1</i> will use the scripts mentioned below to set up aliases to execute various windows programs in an elevated state or to make performing certain actions from PowerShell easier. By elevating the state upon execution, one can perform certain actions from a standard user account, such as managing disk partitions for example.

Just type in the path of the <b>customization</b> folder from this git repo when prompted (<b>Ctrl+L, Ctrl+C and Ctrl+V</b> are your friend ;) and you'll be good to go.

<i>
certmgr.ps1
..\'Troubleshooting and maintenance'\Delete-bin.ps1
devmgmt.ps1
diskmgmt.ps1
services.ps1
WF.ps1
</i>
