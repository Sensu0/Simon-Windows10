# Simon-Windows10

This is a repo to help people fix common issues with the Windows operating system.

I learned of these on my free time and while working in Servicedesk. Tested and confirmed to be working on Windows 10, but it will probably word on older Windows operating systems as well.

---

<h3>Windows-specific issues</h3>

<i>Fix-Windows.bat</i> is designed scan for issues related to Windows internal issues and attempt to fix them. For example, if Explorer.exe starts crashing randomly or the Start Menu won't show up or appears broken.

In case that won't work, you may have issues with the partition itself so running <i>Checkdisk.bat</i> and rebooting your computer might help, which the script will prompt you for.

---

<h3>For network issues,</h3>

I would start by running <i>renew-ip.bat</i> to ask your network AP to provide a new IP address (provided you're using commonly default DHCP ON setting on your router). It will essentially have the same effect as restarting the computer except you don't actually have to do it when running that script.

If you're still having issues there, try <i>Network reset.bat</i> to perform a lot more advanced troubleshooting, but do note it requires a restart afterwards, which this script will prompt for as well, once finished.

---

<h3>Profesional & Enterprise specific</h3>

This is not relevant for the average home user, but rather for corporate computers with Windows 10 Pro or Enterprise equivalent and which are connected to a domain.

<i>gpupdate.bat</i> might help you when you've made changes to <b>Active Directory</b> from a server on the local computer, such as resetting or changing a password or for example given a user access to a specific path on your network storage.

The script works by running <i>gpupdate /force</i> in <i>cmd.exe</i> to sync AD changes between the domain controller and the client.

<i>Clean-recyclebin.ps1</i> will clean the recyclebin for all the users that have a profile on the given computer.
