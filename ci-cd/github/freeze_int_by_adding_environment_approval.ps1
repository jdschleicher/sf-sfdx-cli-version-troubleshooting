param($github_json, $github_repository_name, $github_token)

Import-Module -DisableNameChecking "$PSScriptRoot/../github/environment-management-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-environment-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-teams-service.psm1"

$github_organization = get_workflow_github_organization_by_github_json -github_json $github_json

$dtc_release_admin_github_team_slug = get_dtc_dx_release_github_team_slug
$github_environment_to_add_review_protection = "int"
$github_team_id = get_github_team_id_by_team_slug -github_organization $github_organization -github_token $github_token -github_team_slug $dtc_release_admin_github_team_slug

$failure_code = 1
if ($github_team_id -eq $failure_code) {
    return $failure_code
}

try {
    add_administrative_github_review_team_by_environment -github_organization $github_organization -github_token $github_token -github_repository_name $github_repository_name -github_environment $github_environment_to_add_review_protection -github_team_id $github_team_id
    
} catch {
    Write-Host "ps1 execute failure - freeze_int_by_adding_environment_approval.ps1"
    Write-Host "Exceptoin :$($_.Exception.ToString())"
    $_.Exception
}