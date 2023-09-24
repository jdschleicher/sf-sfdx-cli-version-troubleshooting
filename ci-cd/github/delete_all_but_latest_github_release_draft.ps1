param($github_tag_name, $github_owner_and_repository )

Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-release-service.psm1"

Write-Host "github_tag_name: $github_tag_name"
Write-Host "github_owner_and_repository: $github_owner_and_repository"

$status_result = 0

try {

    delete_all_github_drafts_except_by_latest_created_github_tag -github_organization_and_repository $github_owner_and_repository `
                                                                    -github_tag_name $github_tag_name
} catch {
    $status_result = 1
}

exit $status_result