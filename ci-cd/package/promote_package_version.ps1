param($devhub_alias, $subscriber_package_version_id)

$package_promote_result_json = $(sfdx force:package:version:promote --targetdevhubusername $devhub_alias --package $subscriber_package_version_id  --noprompt --json)
Write-Host "Here's the results of the SFDX CLI Promote Command: $package_promote_result_json"
$package_promote_result = $package_promote_result_json | ConvertFrom-Json

$package_promote_result.result.status
