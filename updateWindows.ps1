# Set execution policy to unrestricted

#testing
#$CommandTimeout=0
$ExecutionTimeout = -1

#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Set-ExecutionPolicy -ExecutionPolicy bypass

# Install the PSWindowsUpdate module
Install-Module -Name PSWindowsUpdate

# Import the module
Import-Module -Name PSWindowsUpdate

# Check for updates
$Updates = Get-WUInstall

# Install updates
if ($Updates) {
    Write-Output "Installing updates..."
    Install-WindowsUpdate -Install -AcceptAll -AutoReboot
}
else {
    Write-Output "No updates available."
}
