Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github_issue_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github_issue_test_utility.psm1"

# Invoke-Pester -EnableExit -Strict .\github\github_issues\tests\unit\github_issue_service.unit.tests.ps1 -CodeCoverage .\github\github_issues\github_issue_service.psm1


Describe 'get_username_for_adding_github_user_to_team_template ' {

    It 'given expected issue_body being passed in $retrieved_username should be equal to $expected_username' {
       
        $github_issue_body = get_fake_issue_body_for_adding_github_user_to_repository_team_issue_form
        
        $retrieved_username = get_username_for_adding_github_user_to_team_template -github_issue_string $github_issue_body

        $expected_username = "test_user01"

        $retrieved_username | Should -Be $expected_username

    } 
}

Describe "get_user_email_for_adding_github_user_to_team_template" {

    It 'given expected issue_body being passed in $retrieved_user_email should be equal to $expected_user_email' {
       
        $github_issue_body = get_fake_issue_body_for_adding_github_user_to_repository_team_issue_form
        
        $retrieved_user_email = get_user_email_for_adding_github_user_to_team_template -github_issue_string $github_issue_body

        $expected_user_email = "test@gmail.com"

        $retrieved_user_email | Should -Be $expected_user_email

    }
}

Describe 'get_expected_release_date_from_issue_body' {

    It 'given a GitHub Issue body being passed in with a date included, the test should return a non-null value' {

        $github_issue_string = get_fake_issue_body_for_creating_new_release_branch_issue_form_with_date_included

        $expected_date_substring = "12-31-2023"

        $actual_date_substring = get_expected_release_date_from_issue_body -github_issue_string $github_issue_string

        $expected_date_substring | Should -Be $actual_date_substring


    }

    It 'given a GitHub Issue body being passed in without a date included, the test should return a null value' {

        $github_issue_string = get_fake_issue_body_for_creating_new_release_branch_issue_form_without_date_included

        $expected_substring = $null

        $actual_substring = get_expected_release_date_from_issue_body -github_issue_string $github_issue_string

        $expected_substring | Should -Be $actual_substring

    }

}

Describe 'add_github_issue_comment' {   
          
    BeforeEach {
        Mock -ModuleName github_issue_service -CommandName Invoke-RestMethod  {
            Write-Host "expected successful invoke-restmethod"
        }
    }
    
    It 'given one expected issue and one comment, mocked update function should be invoked once' {

        $fake_github_organization_and_repository = "fake-org/fake-repo"
        $fake_github_issue_number = "1234"
        $fake_github_token = "djkbchwnailfuskejbwvi"
        $fake_request_body = "This is the request body"

        add_github_issue_comment -github_organization_and_repository $fake_github_organization_and_repository `
                                                                        -github_issue_number $fake_github_issue_number `
                                                                        -github_token $fake_github_token `
                                                                        -request_body $fake_request_body
                         
        Should -Invoke -ModuleName github_issue_service -CommandName Invoke-RestMethod -Exactly 1


    }
}

Describe 'update_github_issue_status' {   
          
    BeforeEach {
        Mock -ModuleName github_issue_service -CommandName Invoke-WebRequest  {
            Write-Host "expected successful Invoke-WebRequest"
        }
    }

    It 'given one expected issue and one status update, mocked update function should be invoked once' {

        $fake_github_organization_and_repository = "fake-org/fake-repo"
        $fake_github_issue_number = "1234"
        $fake_github_token = "djkbchwnailfuskejbwvi"
        $fake_issue_status = "closed"

        update_github_issue_status -github_organization_and_repository $fake_github_organization_and_repository `
                                    -github_issue_number $fake_github_issue_number `
                                    -github_token $fake_github_token `
                                    -issue_status $fake_issue_status

        Should -Invoke -ModuleName github_issue_service -CommandName Invoke-WebRequest -Exactly 1

    }
}

Describe  "parse_github_issue_body_to_map"{

    It "given fake expected issue body returns expected map" {

        $fake_github_issue_body = get_fake_github_issue_body_with_all_input_options
        $github_issue_body_detail = parse_github_issue_body_to_map -github_issue_body $fake_github_issue_body

        $expected_github_release_tag = "v1.45.3.2"
        $expected_org = "VA"
        $expected_blank_response = "_No response_"
        $expected_checkbox = "True"
        $github_issue_body_detail.GitHub_Release_Tag | Should -Be $expected_github_release_tag
        $github_issue_body_detail.What_Salesforce_Org_Pipeline_to_Install_to | Should -Be $expected_org
        $github_issue_body_detail.Expected_Blank_Response | Should -Be $expected_blank_response
        $github_issue_body_detail.Confirm_Checkbox | Should -Be $expected_checkbox
    
    }
}

        