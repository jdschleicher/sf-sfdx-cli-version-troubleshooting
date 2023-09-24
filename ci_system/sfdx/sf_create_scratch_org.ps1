param( $devhub_alias, $scratch_org_alias)

Write-Host "CREATING SCRATCH ORG devhub_alias: $devhub_alias"
Write-Host "CREATING SCRATCH ORG scratch_org_alias: $scratch_org_alias"

Write-Host "sf org create scratch --target-dev-hub $devhub_alias -a $scratch_org_alias --definition-file config/project-scratch-def.json --duration-days 1 --wait 15 --json --no-namespace" 
$create_scratch_result_json = $(sf org create scratch --target-dev-hub $devhub_alias -a $scratch_org_alias --definition-file config/project-scratch-def.json --duration-days 1 --wait 15 --json --no-namespace)

Write-Host "sf create scratch: $create_scratch_result_json"

