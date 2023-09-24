
$sfdx_project = gc -raw './sfdx-project.json' | convertfrom-json

$package_versions_to_install = $sfdx_project.packageDirectories | foreach {
    if ($_.dependencies -ne $null) {
        $_.dependencies | foreach { "$($_.package)@$($_.versionNumber)" }
    }
}

$package_versions_to_install_no_duplicates = [System.Collections.Generic.HashSet[string]]$package_versions_to_install

if ($package_versions_to_install_no_duplicates.count -gt 0) {
    
    $package_install_commands = $package_versions_to_install_no_duplicates | foreach {
        "sfdx force:package:install --targetusername targetusername $_ --wait 10 --package  --noprompt"
    }

    $package_install_commands

}

# run all commands
# $package_install_commands | foreach { Invoke-Expression $_ }
