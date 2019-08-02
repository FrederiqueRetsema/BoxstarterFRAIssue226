# BoxstarterFRAIssue226
Show Chocolatey issue 226 

The script BoxstarterFRAIssue226.ps1 is copied from a network share. This powershell-script installs 
Boxstarter, GIT and will clone the second part of the install. This is done from a private repository.

The secondpart-script will install all packages, do a lot of Powershell configuration. All works fine,
except for the last part: the installing of Windows updates. When an update is too big, Boxstarter will
write to the screen that the update has been installed, it will reboot after that. And in the next run,
it will see that the same update isn't install, it will try to install it again (and will reboot, and
update again, and again, ...)

This BoxstarterFRAIssue226 repository is created to get a minimal installation to show this bug.
- Use the "Windows 10 (business editions), version 1903 (updated June 2019)" edition from MSDN to install Windows
- Use a domain joined installation with user Frederique
- After the install, copy the BoxstarterFRAIssue226.ps1 script from a share to a newly created directory c:\FRA
- Start an elevated Powershell window
- Use Set-ExecutionPolicy Unrestricted (and (A)ll + enter) to set the execution policy 
- Run Boxstarter226Issue.ps1, give the password for Frederique
	- This will install Boxstarter and GIT, and will clone this repository to the new VM
	- It will also start the script "secondpart.ps1" from the repository, in this script the Install-WindowsUpdate
	  command will be used
	  
