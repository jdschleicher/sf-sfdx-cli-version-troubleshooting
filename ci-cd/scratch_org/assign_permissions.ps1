param($username, $permset_name)

function assign_permissions {
    param($username, $permset_name)
    Write-Host 'ASSIGNING USER PERMISSIONS FOR DEPLOYED APP'
    sfdx force:user:permset:assign -u $username -n $permset_name
}

assign_permissions $username $permset_name
