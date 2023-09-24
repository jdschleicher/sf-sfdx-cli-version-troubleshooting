if (Test-Path 'environment-setup/permission-set-configuration.json') {
    $permission_set_config_json = Get-Content -Raw 'environment-setup/permission-set-configuration.json'
    $permission_set_configurations = $permission_set_config_json | ConvertFrom-Json
    $permission_set_configurations | foreach {
        $permission_set_configuration = $_
        if ([string]::IsNullOrEmpty(($permission_set_configuration.user))) {
            Write-Host "sfdx force:user:permset:assign -n $($permission_set_configuration.permset_api_name)"
        } else {
            Write-Host "sfdx force:user:permset:assign -n $($permission_set_configuration.permset_api_name) -u $($permission_set_configuration.user)"
        }
    }   
} else {
    Write-Host "Could not find permission set configuration file"
}