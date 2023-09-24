echo "Installing SFDX CLI"
npm install -g npm
node --version

echo "npm install --global @salesforce/cli@2.7.11"
npm install --global @salesforce/cli@2.7.11

# When receiving install plugin errors comment out below to see if it shakes plugin install
# Write-Host "plugin packaging"
# Write-Host "npm i -g @salesforce/plugin-packaging"
# npm i -g @salesforce/plugin-packaging

sf version --verbose --json


