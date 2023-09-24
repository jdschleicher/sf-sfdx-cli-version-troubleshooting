

param ($github_organization_and_repository, $github_token)

Import-Module -DisableNameChecking -Force "$PSScriptRoot/../github/github_pipeline_environment_service.psm1"

$environment_key = "int"
$environment_configuration = @{
    "reviewers" = $null
}

delete_github_team_approval_by_environment -github_organization_and_repository $github_organization_and_repository -github_token $github_token -environment_key $environment_key -environment_configuration $environment_configuration


