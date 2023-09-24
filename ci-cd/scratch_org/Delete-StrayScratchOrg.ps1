# get scratch org username
$create_scratch_org_result_json = get-content -raw $env:CREATE_SCRATCH_ORG_JSON_PATH
$create_scratch_org_result = $create_scratch_org_result_json | convertfrom-json
$scratch_org_username = $create_scratch_org_result.result.username

# get authenticated usernames
$auth_list_json = sfdx auth:list --json
$auth_list = $auth_list_json | convertfrom-json
$authenticated_usernames = $auth_list.result|foreach username

$authenticated_usernames | format-list

if ($authenticated_usernames -contains $scratch_org_username) {
    Write-Host "DELETING STRAY SCRATCH ORG"
    sh 'ci-cd/scratch_org/delete_scratch_org.sh'
}
else {
    Write-Host 'stray scratch org could not be deleted:'
    Write-Host "scratch org username '$scratch_org_username' is not currently authenticated"
}

# get authenticated usernames
$auth_list_json = sfdx auth:list --json
$auth_list = $auth_list_json | convertfrom-json
$authenticated_usernames = $auth_list.result|foreach username

$authenticated_usernames | format-list
