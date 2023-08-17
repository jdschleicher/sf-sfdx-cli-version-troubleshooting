param($cli_version)

echo "Installing SFDX CLI"
npm install -g npm
node --version

npm install --global $cli_version

if ( $cli_version -match "sfdx" ) {
    sfdx version --verbose
} else {
    sf version --verbose
}


