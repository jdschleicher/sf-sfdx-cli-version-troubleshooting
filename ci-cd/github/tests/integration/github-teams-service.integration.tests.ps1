param( $github_token, $github_organization)

Write-Host "github token: $github_token"
Write-Host "github_organization: $github_organization"

Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\dtc_administration_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github-test-utility.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\..\repository-administration\update_repos_module.psm1"

# $github_integration_test_container = New-PesterContainer -Path .\github\tests\integration\github-teams-service.integration.tests.ps1 -Data @{ github_token = $github_token; github_organization = $github_organization }
# Invoke-Pester -EnableExit -Strict -Container $github_integration_test_container

Describe 'Confirm GitHub Teams in Correct Repositories' {

    It 'given expected github teams and repositories confirm access' {

        $package_name_by_salesforce_repository_configurations =  get_package_name_by_package_repo_configurations_hash_table 

        $dx_github_teams_to_setting_configurations = get_expected_dtc_github_teams_to_settings_hashtable

        
        $headers = @{
            "authorization" = "Bearer $github_token"
            "Accept" = "application/vnd.github.v3.repository+json"
        }

        foreach ($package_to_repo_configuration_key in $package_name_by_salesforce_repository_configurations.Keys) {


            $package_salesforce_repo_config = $package_name_by_salesforce_repository_configurations[$package_to_repo_configuration_key]

            $github_repository = $package_salesforce_repo_config.repository_name

            foreach ( $dx_github_team_name_key in $dx_github_teams_to_setting_configurations.Keys ) {

                Write-Host "Checking permissions in repo: $github_repository for team: $dx_github_team_name_key"

                $github_url = "https://api.github.com/orgs/$github_organization/teams/$dx_github_team_name_key/repos/$github_organization/$github_repository"
                Write-Host "targeted repository url: $github_url"
                $github_team_access_detail = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_url -ContentType "application/json")
                
                $expected_github_team_permission = $dx_github_teams_to_setting_configurations[$dx_github_team_name_key].permission
                $github_team_access_detail.role_name | Should -Be $expected_github_team_permission
                
            }

        }
    
    }

}