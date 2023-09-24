Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\sfdx_deploy_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\sfdx_deploy_service_tests_utility.psm1"

# Invoke-Pester -EnableExit -Strict .\deploy\tests\unit\sfdx_deploy_service.unit.tests.ps1 -CodeCoverage .\deploy\sfdx_deploy_service.psm1

BeforeAll {
    #Needed in order to mock the sfdx commands since the sfdx cli seems to overwrite mocking commands
    New-Module -Script { 
        function sfdx-test { 
            "Mocking sfdx call" 
        }; 
        Set-Alias sfdx sfdx-test; 
        Export-ModuleMember -Alias sfdx -Function sfdx-test 
    }
}

Describe 'validate_only_deploy_by_target_org_and_path' {    

    Context "Given expected success with non-null path and target parameters passed into validate only deployment" {

        BeforeEach {
            Mock -ModuleName sfdx_deploy_service -CommandName sfdx {
                $expected_fake_success_validate_only_result = get_fake_successful_validate_only
                $expected_fake_success_validate_only_result
            }
        }

        It 'Given expected successful validate-only deploy, validate_only_deploy has status and result field ' {
            
            $fake_path = "sfdx-source/codebase-folder/"
            $fake_target_env = "sit"
            $fake_actual_validate_only_deployment_result = validate_only_deploy_by_target_org_and_path -validate_only_target_org $fake_target_env -path_with_metadata_to_validate $fake_path

            $fake_actual_validate_only_deployment_result.result.success | Should -Be $true

        }

    }   

    Context "Given expected failure with non-null path and target parameters passed into validate only deployment" {

        BeforeEach {
            Mock -ModuleName sfdx_deploy_service -CommandName sfdx {
                $expected_fake_validate_validate_only_result = get_fake_failed_validate_only
                $expected_fake_validate_validate_only_result
            }
        }

        It 'Given expected failure validate-only deploy, validate_only_deploy has status and result field ' {
            
            $fake_path = "sfdx-source/codebase-folder/"
            $fake_target_env = "sit"
            $fake_actual_validate_only_deployment_result = validate_only_deploy_by_target_org_and_path -validate_only_target_org $fake_target_env -path_with_metadata_to_validate $fake_path

            $fake_actual_validate_only_deployment_result.result.success | Should -Be $false

        }

    }  

}

Describe 'is_validate_only_deployment_success' {

    Context 'Given expected successful deploy result, returns success' {

        It 'given non-null value with expected success body, expected success property captured' {

            $actual_fake_validate_only_deployment_result_json = get_fake_successful_validate_only
            $actual_fake_validate_only_deployment_result = $actual_fake_validate_only_deployment_result_json | ConvertFrom-Json

            $is_valid_result = is_validate_only_deployment_success $actual_fake_validate_only_deployment_result
            $is_valid_result | Should -Be $true

        }
    }

    Context 'Given expected failure deploy result, returns success' {

        It 'given non-null value with expected failure body, expected success property captured' {

            $actual_fake_validate_only_deployment_result_json = get_fake_failed_validate_only
            $actual_fake_validate_only_deployment_result = $actual_fake_validate_only_deployment_result_json | ConvertFrom-Json

            $is_valid_result = is_validate_only_deployment_success $actual_fake_validate_only_deployment_result
            $is_valid_result | Should -Be $false

        }
    }

}
