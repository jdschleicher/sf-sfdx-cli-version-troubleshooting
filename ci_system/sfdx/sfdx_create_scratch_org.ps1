param( $devhub_alias, $scratch_org_alias)

Write-Host "CREATING SCRATCH ORG devhub_alias: $devhub_alias"
Write-Host "CREATING SCRATCH ORG scratch_org_alias: $scratch_org_alias"

$create_scratch_result_json = $(sfdx force:org:create --targetdevhubusername $devhub_alias --definitionfile config/project-scratch-def.json --wait 15 --durationdays 1 -a $scratch_org_alias --json  --verbose --dev-debug --preserve)
Write-Host "sfdx create scratch: $create_scratch_result_json"

