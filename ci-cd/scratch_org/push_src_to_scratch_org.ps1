param($scratch_org_alias)

echo "PUSHING SOURCE TO SCRATCH ORG"

ls

$push_src_to_scratch_result_json = $(sfdx force:source:push --targetusername $scratch_org_alias --loglevel trace --json )
Write-Host $push_src_to_scratch_result_json
$push_src_to_scratch_result = $push_src_to_scratch_result_json| ConvertFrom-Json
$push_src_to_scratch_result.result.status