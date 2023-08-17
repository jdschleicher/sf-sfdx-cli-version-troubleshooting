param($cli_version)

echo "Installing SFDX CLI"

Write-Host "version: $cli_version"

npm install --global $cli_version

if ( $cli_version -match "sfdx" ) {
    Write-Host " sfdx version --verbose --json"
    sfdx version --verbose --json
} else {
    Write-Host "sf version --verbose --json"
    sf version --verbose --json
}


