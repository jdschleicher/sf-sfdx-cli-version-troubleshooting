param($alias, $deploy_path)

Import-Module -DisableNameChecking "$PSScriptRoot/../utilities/package_xml_utility.psm1"

$deploy_path_directory_exists = Test-Path $deploy_path
if ($deploy_path_directory_exists) {
    # Package XML for validation
    $package_xml_path = "$deploy_path/package/package.xml"
    run_check_only_salesforce_deployment -alias $alias -package_xml_path $package_xml_path

    # Destructive Package XML
    $destructive_package_xml_path = "$deploy_path/destructiveChanges/destructiveChanges.xml"
    run_check_only_salesforce_destructive_changes -alias $alias -deploy_path $deploy_path -destructive_package_xml_path $destructive_package_xml_path    
} else {
    Write-Host "PATH DOES NOT EXIST: $deploy_path"
}