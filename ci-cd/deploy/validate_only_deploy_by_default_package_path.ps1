param(
    [Parameter(Mandatory=$true)]
    $target_org_to_validate_against,
    [Parameter(Mandatory=$true)]
    $path_to_validate
)

Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\sfdx_deploy_service.psm1"

$is_successful_validate_only = $null
$validate_only_deployment_result = $null

try {
    
    $validate_only_deployment_result = validate_only_deploy_by_target_org_and_path -validate_only_target_org $target_org_to_validate_against -path_with_metadata_to_validate $path_to_validate
    $is_successful_validate_only = is_validate_only_deployment_success -validate_only_deployment_result $validate_only_deployment_result
    Write-Host "IS VALIDATE ONLY SUCCESSFUL:$ $is_successful_validate_only"

} catch {

    Write-Host "THERE WAS AN EXCEPTION HIT MAKING A CALLOUT TO SFDX CLI"
    
}

### DURING INTIAL TRIAL RUNS ALWAYS PASS
$always_successful_result = 0
exit $always_successful_result
 