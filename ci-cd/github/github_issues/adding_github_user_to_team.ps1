param (
    $github_issue_body,
    $github_token,
    $github_repository_and_organization,
    $github_team_name
)

Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github\github_issues\github_issue_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\validation_service\validation_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github\github-teams-service.psm1"

$github_organization = $github_repository_and_organization.Split("/")[0]
Write-Host "GitHub Organization: $github_organization"

## Grabbing user email and username from github_issue_body variable
$get_user_email_result = get_user_email_for_adding_github_user_to_team_template -github_issue_string $github_issue_body
$get_username_result = get_username_for_adding_github_user_to_team_template -github_issue_string $github_issue_body

## Validating whether the email grabbed in the $get_user_email_result is a valid email
$email_validation_result = validate_regex_email_address -email_address $get_user_email_result
Write-Host "This is the email validation result: $email_validation_result"

## If the email is valid, then the functionality will run
if ($email_validation_result -eq "True") {

    Write-Host "  add_github_user_to_github_team `
                            -github_organization $github_organization `
                            -github_token $github_token `
                            -github_team_name_slug $github_team_name `
                            -github_user_name $get_username_result    "

    add_github_user_to_github_team `
        -github_organization $github_organization `
        -github_token $github_token `
        -github_team_name_slug $github_team_name `
        -github_user_name $get_username_result    
}
else {

    Throw "Invalid Email"

}
