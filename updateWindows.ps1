# Set execution policy to unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

#registry tweaks 
$registryPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
$executionTimeout = 10800000

Set-ItemProperty -Path $registryPath -Name "ExecutionTimeout" -Value $executionTimeout -Force

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
