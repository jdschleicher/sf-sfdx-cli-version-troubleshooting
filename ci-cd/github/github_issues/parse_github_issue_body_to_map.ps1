param (
    $github_issue_body
)

Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github\github_issues\github_issue_service.psm1"

$github_issue_body_map = parse_github_issue_body_to_map -github_issue_body $github_issue_body

$github_issue_body_map