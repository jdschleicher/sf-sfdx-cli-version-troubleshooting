param($cli_version)

echo "Installing SFDX CLI"

Write-Host "version: $cli_version"

npm install --global $cli_version

if ( $cli_version -match "sfdx" ) {
    Write-Host " sfdx version --verbose"
    sfdx version --verbose
} else {
    Write-Host "sf version --verbose"
    sf version --verbose
}


