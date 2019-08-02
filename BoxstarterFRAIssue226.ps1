# BoxstarterFRAIssue226.ps1
# =========================


# Before running this script:

# Set-ExecutionPolicy Unrestricted
#	-> A (All)
#

# Ask for password
# ----------------
$MachineCred = Get-Credential -UserName "Frederique" -Message "Account-password for Frederique:"

# Install boxstarter:
# -------------------

$alreadystarted=$Boxstarter.AutoLogin
. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force

# Settings for Boxstarter:
#
$Boxstarter.RebootOk=$true
$Boxstarter.NoPassword=$true
$Boxstarter.AutoLogin=$true
RefreshEnv.cmd

# Settings for Chocolatey:
# ------------------------
# Don't ask for confirmation for every install 

choco feature enable -n=allowGlobalConfirmation

# Windows 10 comes with OneGet, a universal package manager that can use Chocolaty
#
Get-PackageProvider -name chocolatey -force

# Install git from Chocolaty
#
cinst git.install
& "C:\Program Files\Git\bin\git" config --global user.email "fretsema@fretsema.nl"
& "C:\Program Files\Git\bin\git" config --global user.name "Frederique Retsema"

# Get the scripts for the second part of the installation
#
if (! (Test-Path c:\fra)) {
    mkdir c:\fra
}

if (! (Test-Path c:\fra\BoxstarterFRAIssue226)) {
    c:
	cd \fra
	& "C:\Program Files\Git\bin\git" clone "https://github.com/FrederiqueRetsema/BoxstarterFRAIssue226.git"
}

# Install and configure anything else...
Install-BoxstarterPackage -PackageName "c:\fra\BoxstarterFRAIssue226\secondpart.ps1" -Credential ($MachineCred)
