param (
    $github_repository_and_organization,
    $repo_and_team_name
)

Import-Module -DisableNameChecking -Force "$PSScriptRoot/../github/github-teams-service.psm1"

$github_organization = $github_repository_and_organization.Split("/")[0]
$team_description = "default team for $repo_and_team_name"
$permission_type = "push"
$notification_settings = "notifications_enabled"
$privacy_type = "closed"

try {

    create_github_team -team_name $repo_and_team_name `
                    -team_description $team_description `
                    -permission_type $permission_type `
                    -notification_settings $notification_settings `
                    -privacy_type $privacy_type `
                    -github_organization $github_organization
} catch {
    
    Throw "CREATE NEW GITHUB TEAM FAILED"
    
}

try {

    save_github_team_to_github_repository_by_permission -github_organization $github_organization `
                                                        -github_team_name_slug $repo_and_team_name `
                                                        -github_repository_name $repo_and_team_name `
                                                        -github_team_permission $permission_type

}
catch {

    Throw "SAVE NEW GITHUB TEAM TO REPO FAILED"
    
}
