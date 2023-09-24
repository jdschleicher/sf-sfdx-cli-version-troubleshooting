Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github_pipeline_environment_service.psm1"

# Invoke-Pester -EnableExit -Strict .\github\tests\unit\github_pipeline_environment_service.unit.tests.ps1 -CodeCoverage .\github\github_pipeline_environment_service.psm1

Describe 'delete_github_team_approval_by_environment' {

    BeforeEach {

        Mock -CommandName Invoke-RestMethod -ModuleName github_pipeline_environment_service {
            Write-Warning "$args"
            Write-Host "DELETE GITHUB TEAM APPROVAL"
        }

    }

    It 'given 1 expected environment key, the mocked delete function should be invoked once' {
        $github_organization_and_repository = "TEST_ORG/TEST_REPO"
        $github_token = "TEST_TOKEN"
        $environment_key = "TEST_KEY"
        $environment_configuration = "TEST_TOKEN"
        delete_github_team_approval_by_environment -github_organization_and_repository $github_organization_and_repository -github_token $github_token -environment_key $environment_key -environment_configuration $environment_configuration


        Should -Invoke -ModuleName github_pipeline_environment_service -CommandName Invoke-RestMethod -Exactly 1
    }

}
