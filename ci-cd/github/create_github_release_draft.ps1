param(
    $package_version_report, 
    $github_tag_name, 
    $associated_skip_validation_package_version, 
    $last_org_installed_to, 
    $github_action_run_id, 
    $github_repo_url
)

Import-Module -DisableNameChecking -Force "$PSScriptRoot/../github/github-release-service.psm1"

Write-Host "package_version_report: $package_version_report"
Write-Host "github_tag_name: $github_tag_name"
Write-Host "associated_skip_validation_package_version: $associated_skip_validation_package_version"
Write-Host "last_org_installed_to: $last_org_installed_to"

$github_action_workflow_link = generate_action_workflow_link -github_repo_url $github_repo_url -github_action_run_id $github_action_run_id
Write-Host "Action Workflow Link is $github_action_workflow_link"

$status_result = 0

try {
    create_github_release_draft -package_version_report $package_version_report `
                                 -github_tag_name $github_tag_name `
                                 -associated_skip_validation_package_version $associated_skip_validation_package_version `
                                 -last_org_installed_to $last_org_installed_to `
                                 -github_action_workflow_link $github_action_workflow_link
} catch {
    Write-Host "GitHub Release Draft failed"
    $status_result = 1
}

exit $status_result
