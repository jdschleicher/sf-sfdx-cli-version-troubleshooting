param($org_alias, $auth_url)

Write-Host "AUTHENTICATING SALESFORCE ORG (VIA AUTH URL)" 
Write-Host "org_alias: $org_alias"

$key_file = "auth_url.key"

New-Item -Type File $key_file | Out-Null
$auth_url | Out-File $key_file

Write-Host "sfdx auth:sfdxurl:store -f $key_file -a $org_alias --json"
$auth_result_json = $(sfdx auth:sfdxurl:store -f $key_file -a $org_alias --json)
Write-Host $auth_result_json
$auth_result = $auth_result_json| ConvertFrom-Json
$auth_result.status

Remove-Item -Force $key_file