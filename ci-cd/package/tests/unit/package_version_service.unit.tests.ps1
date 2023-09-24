Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\package_version_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\package_version_service_test_utility.psm1"

# Invoke-Pester -EnableExit -Strict .\package\tests\unit\package_version_service.unit.tests.ps1 -CodeCoverage .\package\package_version_service.psm1

BeforeAll {
    #Needed in order to mock the sfdx commands since the sfdx cli seems to overwrite mocking commands
    New-Module -Script { 
        function sf-test { 
            "Mocking sf call" 
        }; 
        Set-Alias sf sf-test; 
        Export-ModuleMember -Alias sf -Function sf-test 
    }
    
    New-Module -Script { 
        function sfdx-test { 
            "Mocking sfdx call" 
        }; 
        Set-Alias sfdx sfdx-test; 
        Export-ModuleMember -Alias sfdx -Function sfdx-test 
    }

}

Describe 'create_full_validation_package_version_and_get_result' {
    BeforeEach {

        Mock -ModuleName package_version_service -CommandName sf -ParameterFilter { 
            "$args" -match 'package version create' -and
            "$args" -match "--code-coverage" } {
            
            $fake_full_validation_json = get_fake_package_version_full_validation_report_json
            $fake_full_validation_json 
        }

    }
    
    It 'given expected package detail and expected full validation mocked call returns validation skipped false ' {
        $package_detail = [PSCustomObject]@{ 
            "package_tag" = "full_validated_tag_1.0.0.1";        
            "package_name" = "test-cicd-package";
        }

        $devhub_alias = "test_alias"

        $expected_package_version_creation_result = create_full_validation_package_version_and_get_result -package_detail $package_detail -devhub_alias $devhub_alias
        $expected_package_version_creation_result.result.ValidationSkipped | Should -Be $false
    }

}

Describe 'create_full_validation_package_version_by_devhub_and_package_details' {
    BeforeEach {

        Mock -ModuleName package_version_service -CommandName sf -ParameterFilter { 
            "$args" -match 'package version create' -and
            "$args" -match "--code-coverage" } {
            
            $fake_full_validation_json = get_fake_package_version_full_validation_report_json
            $fake_full_validation_json 
        }
    }
    
    It 'given expected package detail and expected full validation mocked call returns valid json ' {
        $package_detail = [PSCustomObject]@{ 
            "package_tag" = "full_validated_tag_1.0.0.1";        
            "package_name" = "test-cicd-package";
        }

        $devhub_alias = "test_alias"

        $expected_package_version_creation_json = create_full_validation_package_version_by_devhub_and_package_details -package_detail $package_detail -devhub_alias $devhub_alias
        Test-Json $expected_package_version_creation_json | Should -Be $true

    }

}

Describe 'create_skip_validation_package_version_and_get_result' {
    BeforeEach {

        Mock -ModuleName package_version_service -CommandName sf -ParameterFilter { 
            "$args" -match 'package version create' -and
            "$args" -match "--skip-validation" } {
            
            $fake_skip_validation_json = get_fake_package_version_skip_validation_report_json
            $fake_skip_validation_json 
        }

    }
    
    It 'given expected package detail and expected skip validation mocked call returns validation skipped true ' {
        $package_detail = [PSCustomObject]@{ 
            "package_tag" = "validated_tag_1.0.0.1";        
            "package_name" = "test-cicd-package";
        }

        $devhub_alias = "test_alias"

        $expected_package_version_creation_result = create_skip_validation_package_version_and_get_result -package_detail $package_detail -devhub_alias $devhub_alias
        $expected_package_version_creation_result.result.ValidationSkipped | Should -Be $true
    }

}


Describe 'create_skipvalidation_validation_package_version_by_devhub_and_package_details' {
    BeforeEach {

        Mock -ModuleName package_version_service -CommandName sf -ParameterFilter { 
            "$args" -match 'package version create' -and
            "$args" -match "--skip-validation" } {
            
            $fake_full_validation_json = get_fake_package_version_full_validation_report_json
            $fake_full_validation_json 
        }


    }
    
    It 'given expected package detail and expected skip validation mocked call returns valid json ' {
        $package_detail = [PSCustomObject]@{ 
            "package_tag" = "skip_validated_tag_1.0.0.1";        
            "package_name" = "test-cicd-package";
        }

        $devhub_alias = "test_alias"

        $expected_package_version_creation_json = create_skipvalidation_validation_package_version_by_devhub_and_package_details -package_detail $package_detail -devhub_alias $devhub_alias
        Test-Json $expected_package_version_creation_json | Should -Be $true

    }

}

Describe 'get_package_version_report_by_subscriberversionid_and_devhub' {
    BeforeEach {

        Mock -ModuleName package_version_service -CommandName sfdx  -ParameterFilter { 
            "$args" -match 'force:package:version:report'} {

            $fake_package_report = get_fake_package_version_report
            $fake_package_report 
        }

    }
    
    It 'given expected subscriber package version id returns expected package version id from mock report' {

        $fake_subscriber_id = "324234234"
        $devhub_alias = "test_alias"

        $package_version_report.result.Version
        $expected_package_version_result = get_package_version_report_by_subscriberversionid_and_devhub -subscriber_package_version_id $fake_subscriber_id -devhub_alias $devhub_alias
        $expected_package_version_result.result.Version | Should -Be "1.7.0.2"

    }

}

Describe 'set_ghactions_outputs_for_skipvalidation_package_details' {

    It 'given expected package info parameters outputs expected results' {

        ### GitHub Actions creates a unique GITHUB OUTPUT variable to redirect output vars to
        ### we output variables to this github_output file in set_ghactions_outputs_for_skipvalidation_package_details
        $env:GITHUB_OUTPUT = "$(New-Guid).json"

        $package_tag_output = "fake tag output"
        $subscriber_package_version_id = "322323432"
        $package_version = "2.3.2.4"
        $fake_slack_message_info = [PSCustomObject]@{ 
            "github_run_id"   = "12345";
            "package_name" = "test-cicd-package-name"
            "package_tag" = "package_tag"
            "package_version" = "1.0.0.1"
            "subscriber_package_version_id" = "123456789"
        }
        $expected_output = @(
            'packageSubscriberId=322323432',
            'packageVersion=2.3.2.4',
            'packageTag=fake tag output',
            'slack_message_package_info={"github_run_id":"12345","package_name":"test-cicd-package-name","package_tag":"package_tag","package_version":"1.0.0.1","subscriber_package_version_id":"123456789"}'    
        );

        set_ghactions_outputs_for_skipvalidation_package_details -package_tag_output $package_tag_output `
                                                                    -subscriber_package_version_id $subscriber_package_version_id `
                                                                    -package_version $package_version `
                                                                    -slack_message_package_info $fake_slack_message_info `


        $actual_output_to_expected_file = $(Get-Content $env:GITHUB_OUTPUT)
        $actual_output_to_expected_file | Should -Be $expected_output

                                                                  
    }

}

Describe 'set_ghactions_output_from_fullvalidation_job' {
    It 'given expected github tag and package version report in json format outputs expected results' {
        
        ### GitHub Actions creates a unique GITHUB OUTPUT variable to redirect output vars to
        ### we output variables to this github_output file in set_ghactions_outputs_for_skipvalidation_package_details
        $env:GITHUB_OUTPUT = "$(New-Guid).json"

        $fake_package_version_result = [PSCustomObject]@{ 
            "test1" = "firstvalue";     
            "result" =   [PSCustomObject]@{
                "status" = "0"; 
                "version" = "3234";
            }  
        }

        $fake_slack_message_info = [PSCustomObject]@{ 
            "github_run_id"   = "12345";
            "package_name" = "test-cicd-package-name"
            "package_tag" = "package_tag"
            "package_version" = "1.0.0.1"
            "subscriber_package_version_id" = "123456789"
        }
        $github_tag = "fake github tag"
        $expected_output = @(
            "github_tag=fake github tag",
            "package_version_report={`"test1`":`"firstvalue`",`"result`":{`"status`":`"0`",`"version`":`"3234`"}}",
            "slack_message_package_info={`"github_run_id`":`"12345`",`"package_name`":`"test-cicd-package-name`",`"package_tag`":`"package_tag`",`"package_version`":`"1.0.0.1`",`"subscriber_package_version_id`":`"123456789`"}"
        );
        
        set_ghactions_output_from_fullvalidation_job -github_tag $github_tag `
                                                     -package_version_report $fake_package_version_result `
                                                     -slack_message_package_info $fake_slack_message_info `
    
        $actual_output_to_expected_file = $(Get-Content $env:GITHUB_OUTPUT)
        $actual_output_to_expected_file | Should -Be $expected_output
    }
}

