param(
    $github_organization,
    $new_repository_name,
    $selected_org,
    $product_description
)

Write-Host " github_organization $github_organization"
Write-Host " new_repository_name $new_repository_name"
Write-Host " selected_org $selected_org"
Write-Host " product_description $product_description"

Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github\github_repository_templates\github_template_repository_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\onboarding-bootstrapper\onboarding_bootstrapper_service.psm1"

$selected_repo_template = $null
$gitflow_template = "dtc-rollout-ci-git-flow-template"
$featureflow_template = "dtc-rollout-ci-feature-flow-template"

if ( $selected_org -eq "All-Orgs" ) {
    $selected_repo_template = $featureflow_template
} else {
    $selected_repo_template = $gitflow_template
}

$gh_repo_create_result = create_github_repo_from_template -github_organization $github_organization `
                                                            -new_repository_name $new_repository_name `
                                                            -github_template_name $selected_repo_template `
                                                            -product_description $product_description

echo "$gh_repo_create_result"

$gh_repo_create_result