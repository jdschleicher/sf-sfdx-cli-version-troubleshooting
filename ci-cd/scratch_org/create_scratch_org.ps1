param($devhub_alias, $scratch_org_alias)

Write-Host "CREATING SCRATCH ORG"

Write-Host "sf org create scratch --target-dev-hub $DEVHUB_ALIAS --set-default --definition-file config/project-scratch-def.json  --duration-days 1 --no-namespace --alias $SCRATCH_ORG_ALIAS --json"
$create_scratch_result_json = $( sf org create scratch --target-dev-hub $DEVHUB_ALIAS --set-default --definition-file config/project-scratch-def.json  --duration-days 1 --no-namespace --alias $SCRATCH_ORG_ALIAS --json )
Write-Host $create_scratch_result_json
$create_scratch_result = $create_scratch_result_json| ConvertFrom-Json
$create_scratch_result.result.status
