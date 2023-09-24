
Write-Host "install 7zip"
Install-Module -Name 7Zip4Powershell -RequiredVersion 2.0.0 -Force

# Get-InstalledModule -Name 7Zip4Powershell

$sf_cli_tar_xz_path = "sf-cli.tar.xz"
$sf_cli_tar_path = "sf-cli"
$sf_cli_tar_file = "sf-cli.tar"

Write-Host " Download Salesforce CLI tar file"
Invoke-WebRequest -Uri "https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-win32-x64.tar.xz" -OutFile "$sf_cli_tar_xz_path"

Write-Host " Extract the downloaded zip file"
Expand-7Zip -TargetPath $sf_cli_tar_path -ArchiveFileName "$sf_cli_tar_xz_path"

Write-Host "extract tar"
tar -xvf "$sf_cli_tar_path/$sf_cli_tar_file" -C sf-cli

Write-Host "profile directory : $PROFILE"
Write-Host "pshome directory : $PSHOME"
$profilePath = $PROFILE
Write-Host "path var: $profilePath"

if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

### SET UP POWERSHELL ALIAS TO MIMIC "sf" AND "sfdx" TO POINT TO BINARY SALESFORCE CLI EXECUTEABLE 

$sf_binary_path = ".\sf-cli\sf\bin\sf"
$sf_alias = @"
`n Set-Alias -Name sf -Value $sf_binary_path
"@
Add-Content -Path $PROFILE -Value $sf_alias


$sfdx_alias = @"
`n Set-Alias -Name sfdx -Value $sf_binary_path
"@
Add-Content -Path $PROFILE -Value $sfdx_alias


Get-Content $PROFILE

# INITIATE PROFILE FOR ALIASES TO REGISTER
. $PROFILE

