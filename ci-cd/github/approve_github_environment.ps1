param(
    $github_workflow_run_id,
    $github_organization,
    $github_token,
    $github_repository_name,
    $github_environment
)

Import-Module -DisableNameChecking "$PSScriptRoot/../github/environment-management-service.psm1"

$approve_status_result = 0
try {
    
    $environment_id = get_github_environment_id_by_name_and_github_repository -github_organization $github_organization -github_token $github_token -github_repository_name $github_repository_name -github_environment $github_environment

    $environment_approval_update_result = approve_environment_review_by_repository_and_github_run_id -github_organization $github_organization -github_token $github_token -github_repository_name $github_repository_name -github_environment_id $environment_id -github_run_id $github_workflow_run_id
    Write-Host "environment approval result : $environment_approval_update_result"
    $approve_status_result = $environment_approval_update_result

} catch {
    $approve_status_result = 1
}

if ( $approve_status_result -eq 1 ) {

    Write-Host "approval failed: $github_environment"
    ### DUE TO PROCESS OF INT INVARIABLY REQUIRING AN ENVIRONMENT APPROVAL, A FALSE FAILURE MAY ARRIVE IF THE INT APPROVAL IS NOT REQUIRED
    if ( $github_environment -ne "int") {
        exit $approve_status_result
    }

} else {

    $approve_status_result
}
 