Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\environment-management-service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github-test-utility.psm1"

# Invoke-Pester -EnableExit -Strict .\github\tests\unit\environment-management-service.unit.tests.ps1 -CodeCoverage .\github\environment-management-service.psm1

Describe 'add_administrative_github_review_team_by_environment' {

    BeforeEach {

        Mock -ModuleName environment-management-service -CommandName Invoke-RestMethod  {
            $fake_expected_environment_update_callout = get_fake_environment_update_callout_result
            $fake_expected_environment_update_callout
        }

    }

    It 'given expected github team slug returns expected github id' {

        $expected_fake_github_team_name_in_protection_rules_reviewers_array = "DTC-SFDX-ADMIN"
        $fake_github_team_id = "2434234"
        $fake_github_token = "3423423rkrj32j4234kj"
        $fake_github_organization = "department-of-testing"
        $fake_github_repository_to_add_environment_update_to = "test-repo"
        $fake_github_environment = "fake-int"

        $actual_environment_update_callout  = add_administrative_github_review_team_by_environment -github_organization $fake_github_organization `
                                                                        -github_token $fake_github_token `
                                                                        -github_repository_name $fake_github_repository_to_add_environment_update_to `
                                                                        -github_environment $fake_github_environment `
                                                                        -github_team_id $fake_github_team_id
                                                                        
        $actual_environment_update_callout.protection_rules[0].reviewers[0].reviewer.name | Should -Be $expected_fake_github_team_name_in_protection_rules_reviewers_array


    }

}

Describe 'exception_expected_for_unknown_repo_name_when_calling_add_administrative_github_review_team_by_environment' {

    BeforeEach {
        Mock -ModuleName environment-management-service -CommandName Invoke-RestMethod  {
             
            $expected_try_catch_failure_result = get_fake_exception_response_for_environment_update_with_unknown_repo_name
            throw $expected_try_catch_failure_result
            
        }
    }

    It 'given incorrect github repository name expected failure resonse for github environment update' {
           
        $expected_fake_exception_message = "@{Response=; StatusCode=; TargetSite=; Message=Response status code does not indicate success: 404 (Not Found).; Data=; InnerException=; HelpLink=; Source=System.Management.Automation; HResult=-2146233088; StackTrace=   at System.Management.Automation.MshCommandRuntime.ThrowTerminatingError(ErrorRecord errorRecord)}"
        $fake_github_team_id = "2434234"
        $fake_github_token = "3423423rkrj32j4234kj"
        $fake_github_organization = "department-of-testing"
        $fake_github_repository_to_add_environment_update_to = "test-repo"
        $fake_github_environment = "fake-int"

        $actual_environment_update_callout_failure  = add_administrative_github_review_team_by_environment -github_organization $fake_github_organization `
                                                                        -github_token $fake_github_token `
                                                                        -github_repository_name $fake_github_repository_to_add_environment_update_to `
                                                                        -github_environment $fake_github_environment `
                                                                        -github_team_id $fake_github_team_id
                                                                        
        $actual_environment_update_callout_failure.Message | Should -Be $expected_fake_exception_message
        
    }

}