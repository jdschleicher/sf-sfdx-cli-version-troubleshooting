param(
    $org_sfpowerkit_auth_json
)

# expecting below json structure from parameter:
# {
#     "org_name": "secret_representing_org_info",
#     "username": "test-dxdnahekfbgj@example.com",
#     "password": "testtest1",
#     "securitytoken": "9ik4vXoVd4yNoL2dNd8zAaJUk",
#     "mydomain_instanceurl": "https://mydomainONLY.my.salesforce.com"
# }


$base64decoded_orgauth_json = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($org_sfpowerkit_auth_json))  
$org_sfpowerkit_auth = $base64decoded_orgauth_json | ConvertFrom-Json

Write-Host "AUTHENTICATING SALESFORCE ORG $($org_sfpowerkit_auth.org_name)" 

$auth_result_json = $(sfdx sfpowerkit:auth:login --username $org_sfpowerkit_auth.username --password $org_sfpowerkit_auth.org_password --url $org_sfpowerkit_auth.mydomain_instanceurl --alias $org_sfpowerkit_auth.org_name --securitytoken $org_sfpowerkit_auth.securitytoken --json)
Write-Host $auth_result_json
$auth_result = $auth_result_json| ConvertFrom-Json
$auth_result.status