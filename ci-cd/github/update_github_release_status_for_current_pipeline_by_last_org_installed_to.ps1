param( 
    $release_to_update, 
    $last_org_installed_to, 
    $github_action_run_id, 
    $github_repo_url
)

Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-release-service.psm1"

Write-Host "last org installed to: $last_org_installed_to"
Write-Host "git tag for release to update: $release_to_update"

$status_result = 0
try {
    $release_edit_result = update_github_release_by_last_org_installed_to -github_release_to_update $release_to_update `
                                                    -last_org_installed_to $last_org_installed_to `
                                                    -github_action_run_id $github_action_run_id `
                                                    -github_repo_url $github_repo_url
    Write-Host "release edit result : $release_edit_result"
} catch {
    $status_result = 1
}

exit $status_result