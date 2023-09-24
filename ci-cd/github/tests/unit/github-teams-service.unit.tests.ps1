Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github-teams-service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github-test-utility.psm1"

# Invoke-Pester -EnableExit -Strict .\github\tests\unit\github-teams-service.unit.tests.ps1 -CodeCoverage .\github\github-teams-service.psm1


Describe 'save_github_team_to_github_repository_by_permission' {
    
    BeforeEach {
        Mock -ModuleName github-teams-service -CommandName gh -ParameterFilter { 
            "$args" -match "api" -and
            "$args" -match "--method PUT"  }   {

            Write-Host "SAVED GITHUB TEAM TO REPOSITORY"
        }
    }

    It 'given 1 expected github team to be created, the specified call should be invoked once' {
        
        $fake_github_repository = "fake-github-repository"
        $github_team_name_slug = "fake-github-team-slug"

        $fake_organization = "the-organization"
        $fake_team_permission = "push"

        save_github_team_to_github_repository_by_permission -github_organization $fake_organization `
                                                            -github_team_name_slug $github_team_name_slug `
                                                            -github_repository_name $fake_github_repository `
                                                            -github_team_permission $fake_team_permission


        Should -Invoke -ModuleName github-teams-service -CommandName gh -ParameterFilter {"$args" -match "api" -and "$args" -match "--method PUT" } -Exactly 1


    }

}

Describe 'exception_expected_save_github_team_to_github_repository_by_permission' {

    BeforeEach {
        Mock -ModuleName github-teams-service -CommandName gh -ParameterFilter { 
            "$args" -match "api" -and
            "$args" -match "--method PUT"  }   {
            $expected_try_catch_failure_result_json = @"
            {
            "message":"Not Found",
            "documentation_url":"https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions"
            }
"@

            $expected_try_catch_failure_result_json
        }
    }

    It 'given expected failure response github repository returns expected save callout' {
           
        $fake_github_repository = "fake-github-repository"
        $github_team_name_slug = "fake-github-team-slug"

        $fake_organization = "the-organization"
        $github_team_permission = "maintainer"

        $expected_try_catch_failure_result_json = save_github_team_to_github_repository_by_permission -github_organization $fake_organization `
                                                                                            -github_team_name_slug $github_team_name_slug `
                                                                                            -github_repository_name $fake_github_repository `
                                                                                            -github_team_permission $github_team_permission

        $expected_try_catch_failure_result = $expected_try_catch_failure_result_json | ConvertFrom-Json 
        $expected_try_catch_failure_result.documentation_url = "https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions"


    }

}


Describe 'get_github_team_id_by_team_slug' {

    BeforeEach {

        Mock -ModuleName github-teams-service -CommandName Invoke-RestMethod  {
            $fake_expected_github_team_id = 3252533
            $fake_expected_github_team_id
        }

    }

    It 'given expected github team slug returns expected github id' {

        $expected_github_team_slug = "sfdx-test-team"
        $fake_github_token = "3423423rkrj32j4234kj"
        $fake_github_organization = "department-of-testing"
        $actual_github_team_id  = get_github_team_id_by_team_slug -github_organization $fake_github_organization `
                                                                        -github_token $fake_github_token `
                                                                        -github_team_slug $expected_github_team_slug

        $actual_github_team_id | Should -Be $fake_expected_github_team_id

    }

}

Describe 'get_node_id_og_github_team_by_team_slug' {

    BeforeEach {

        Mock -ModuleName github-teams-service -CommandName Invoke-RestMethod  {
            $fake_expected_github_team_node_id = "aaaaaaQ2NTY2MDY="
            $fake_expected_github_team_node_id
        }

    }

    It 'given expected github team slug returns expected github id' {

        $expected_github_team_slug = "sfdx-test-team"
        $fake_github_token = "3423423rkrj32j4234kj"
        $fake_github_organization = "department-of-testing"
        $actual_github_team_id  = get_github_team_id_by_team_slug -github_organization $fake_github_organization `
                                                                        -github_token $fake_github_token `
                                                                        -github_team_slug $expected_github_team_slug

        $actual_github_team_id | Should -Be $fake_expected_github_team_node_id

    }

}

Describe 'exception_expected_for_get_node_id_og_github_team_by_team_slug' {

    BeforeEach {

        Mock -ModuleName github-teams-service -CommandName Invoke-RestMethod  {
            $fake_exception_response_for_github_team_id_by_team_slug = get_fake_exception_response_for_get_github_team_by_slug
            throw $fake_exception_response_for_github_team_id_by_team_slug
        }

    }

    It 'given expected github team slug returns expected exception code failure' {

        $expected_github_team_slug = "sfdx-test-team"
        $fake_github_token = "3423423rkrj32j4234kj"
        $fake_github_organization = "department-of-testing"

        $expected_github_response_exception_failure_code = 1
        $actual_github_response_exception  = get_node_id_og_github_team_by_team_slug -github_organization $fake_github_organization `
                                                                        -github_token $fake_github_token `
                                                                        -github_team_slug $expected_github_team_slug

        $actual_github_response_exception | Should -Be $expected_github_response_exception_failure_code

    }

}

Describe 'exception_expected_for_get_github_team_id_by_team_slug' {

    BeforeEach {

        Mock -ModuleName github-teams-service -CommandName Invoke-RestMethod  {
            $fake_exception_response_for_github_team_id_by_team_slug = get_fake_exception_response_for_get_github_team_by_slug
            throw $fake_exception_response_for_github_team_id_by_team_slug
        }

    }

    It 'given expected github team slug returns expected exception code failure' {

        $expected_github_team_slug = "sfdx-test-team"
        $fake_github_token = "3423423rkrj32j4234kj"
        $fake_github_organization = "department-of-testing"

        $expected_github_response_exception_failure_code = 1
        $actual_github_response_exception  = get_github_team_id_by_team_slug -github_organization $fake_github_organization `
                                                                        -github_token $fake_github_token `
                                                                        -github_team_slug $expected_github_team_slug

        $actual_github_response_exception | Should -Be $expected_github_response_exception_failure_code

    }

}

Describe "get_dtc_dx_release_github_team_slug" {

    it "given get_dtc_dx_release_github_team_slug called returns expected team name slug" {
        $expected_dtc_release_admin_github_team_slug = "dtc-dx-salesforce-release-admins"
        $actual_dtc_release_admin_github_team_slug = get_dtc_dx_release_github_team_slug

        $actual_dtc_release_admin_github_team_slug | Should -Be $expected_dtc_release_admin_github_team_slug

    }

}

Describe 'add_github_user_to_github_team' {
    
    BeforeEach {
        Mock -ModuleName github-teams-service -CommandName Invoke-RestMethod  {
            Write-Host "expected successful invoke-restmethod"
        }
    }
    
    It 'given expected github team and expected github repository returns expected save callout' {
        $fake_github_organization = "test_org"
        $fake_github_token = "wfhndpiwhnfpewiouf"
        $fake_github_team_name = "test-team"
        $fake_username = "testuser01"

        add_github_user_to_github_team `
                                    -github_organization $fake_github_organization `
                                    -github_token $fake_github_token `
                                    -github_team_name_slug $fake_github_team_name `
                                    -github_user_name $fake_username 
   
        Should -Invoke -ModuleName github-teams-service -CommandName Invoke-RestMethod -Exactly 1

    }

}

Describe "create_github_team" {

    BeforeEach {
        Mock -ModuleName github-teams-service -CommandName gh -ParameterFilter { 
            "$args" -match "api" -and
            "$args" -match "--method POST"  }   {

            Write-Host "CREATED NEW GITHUB TEAM"
        }
    }
    
    It 'given 1 expected github team to be created, the specified call should be invoked once' {
        
        $fake_team_name_slug = "fake-github-team-slug"

        $fake_description = "test description"

        $fake_permission = "push"

        $fake_notification_settings = "enabled"

        $fake_privacy_type = "closed"

        $fake_organization = "the-organization"

        create_github_team -team_name $fake_team_name_slug `
                            -team_description $fake_description `
                            -permission_type $fake_permission `
                            -notification_settings $fake_notification_settings `
                            -privacy_type $fake_privacy_type `
                            -github_organization $fake_organization

        Should -Invoke -ModuleName github-teams-service -CommandName gh -ParameterFilter {"$args" -match "api" -and "$args" -match "--method POST" } -Exactly 1


    }

}
