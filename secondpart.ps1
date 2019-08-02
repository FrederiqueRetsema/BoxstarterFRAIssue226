# Secondpart.ps1
# --------------

Install-WindowsUpdate
if (Test-PendingReboot) { Invoke-Reboot } 