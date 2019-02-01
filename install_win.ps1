
$ErrorActionPreference = 'Stop'

# Download Scoop installer
Invoke-WebRequest https://get.scoop.sh -Out install_scoop.ps1

# Install Scoop
./install_scoop.ps1

# Use Scoop to install PowerShell
scoop install pwsh
