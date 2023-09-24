Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github-release-service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github-test-utility.psm1"
Import-Module -Force -Global -DisableNameChecking ".\package\tests\package_version_service_test_utility.psm1"
Import-Module -Force -Global -DisableNameChecking ".\github\tests\github_release_service_test_utility.psm1"

# Invoke-Pester -EnableExit -Strict .\github\tests\unit\github-release-service.unit.tests.ps1 -CodeCoverage .\github\github-release-service.psm1
Describe 'get_release_asset_json_content_by_package_version_report' {

    It 'given expected fake report and package version returns expected gh release asset json content' {

        $expected_associated_skip_validation_package_version = "9.9.9.9"
        $expected_package_version_from_fake_report = "1.7.0.2"
        $fake_package_version_report_json = get_fake_package_version_report
        $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json

        $actual_release_asset_json_content = get_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
        $actual_release_asset = $actual_release_asset_json_content | ConvertFrom-Json

        $actual_release_asset.Associated_SKIPVALIDATION_Package_Version | Should -Be $expected_associated_skip_validation_package_version
        $actual_release_asset.FULLY_Validated_Package_Version | Should -Be $expected_package_version_from_fake_report
        $actual_release_asset.ORGs_Installed_To | Should -Not -BeNullOrEmpty
    }

}

Describe 'get_feature_flow_release_asset_json_content_by_package_version_report' {

    It 'given expected fake report and package version returns expected gh release asset for feature flow json content' {

        $expected_associated_skip_validation_package_version = "9.9.9.9"
        $expected_package_version_from_fake_report = "1.7.0.2"
        $fake_package_version_report_json = get_fake_package_version_report
        $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json

        $actual_release_asset_json_content = get_feature_flow_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
        $actual_release_asset = $actual_release_asset_json_content | ConvertFrom-Json

        $actual_release_asset.Associated_SKIPVALIDATION_Package_Version | Should -Be $expected_associated_skip_validation_package_version
        $actual_release_asset.FULLY_Validated_Package_Version | Should -Be $expected_package_version_from_fake_report
        $actual_release_asset.ORGs_Installed_To | Should -BeNullOrEmpty

    }

}

Describe 'get_hotfix_release_asset_json_content_by_package_version_report' {

    It 'given expected fake hotfix package version report returns expected gh release asset json content' {

        $expected_package_version_from_fake_report = "1.7.2.2"
        $fake_package_version_report_json = get_fake_hotfix_package_version_report
        $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json

        $actual_hotfix_release_asset_json_content = get_hotfix_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
        $actual_hotfix_release_asset = $actual_hotfix_release_asset_json_content | ConvertFrom-Json

        $actual_hotfix_release_asset.FULLY_Validated_Package_Version | Should -Be $expected_package_version_from_fake_report
        $actual_hotfix_release_asset.ORGs_Installed_To.'HOTFIX-SANDBOX' | Should -Be "Not Installed"
    }

}

Describe 'create_github_release_draft' {   

    BeforeEach {
  
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release create" }  {

            Write-Host "mocked gh release create call"

        }
    }

    It 'given expected parameters creates expected github release files' {
        $fake_version_report_json = get_fake_package_version_report
        $fake_github_tag_name = "v2.2.2.99"
        $fake_associated_skip_validation_version = "2.2.2.99"
        $fake_last_org_installed_to = "sit" #needs to be expected pipleine org

        create_github_release_draft -package_version_report_json $fake_version_report_json `
                                    -github_tag_name $fake_github_tag_name `
                                    -associated_skip_validation_package_version $fake_associated_skip_validation_version `
                                    -last_org_installed_to $fake_last_org_installed_to

        $expected_release_notes_file_name = "gh_release_notes.txt"
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        
        Test-Path $expected_release_notes_file_name | Should -Be $true
        Test-Path $expected_release_asset_json_file_name | Should -Be $true

        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json
        $release_asset_from_file.Associated_SKIPVALIDATION_Package_Version | Should -Be $fake_associated_skip_validation_version
        $release_asset_from_file.ORGs_Installed_To.SIT | Should -Be $fake_associated_skip_validation_version

    }

    It 'given last org installed is int_update then the SIT org is set to int_update' {
        $fake_version_report_json = get_fake_package_version_report
        $fake_github_tag_name = "v2.2.2.99"
        $fake_associated_skip_validation_version = "2.2.2.99"
        $fake_last_org_installed_to = "int_update" 

        create_github_release_draft -package_version_report_json $fake_version_report_json `
                                    -github_tag_name $fake_github_tag_name `
                                    -associated_skip_validation_package_version $fake_associated_skip_validation_version `
                                    -last_org_installed_to $fake_last_org_installed_to

        $expected_release_notes_file_name = "gh_release_notes.txt"
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        
        Test-Path $expected_release_notes_file_name | Should -Be $true
        Test-Path $expected_release_asset_json_file_name | Should -Be $true

        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json
        $release_asset_from_file.ORGs_Installed_To.SIT | Should -Be $fake_last_org_installed_to

    }



}

Describe 'create_json_release_notes_asset_file_by_release_asset' {

    It 'given expected release asset and json file name creates expected file with expected content' {
        $expected_associated_skip_validation_package_version = "9.9.9.9"
        $expected_package_version_from_fake_report = "1.7.0.2"
        $fake_package_version_report_json = get_fake_package_version_report
        $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json

        $expected_release_asset_json_content = get_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
        $expected_release_asset = $expected_release_asset_json_content | ConvertFrom-Json

        $expected_release_asset_json_file_name = "gh_release_asset.json"
        create_json_release_notes_asset_file_by_release_asset -release_asset $expected_release_asset -release_asset_json_file_name $expected_release_asset_json_file_name
        
        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json

        $release_asset_from_file.Associated_SKIPVALIDATION_Package_Version | Should -Be $expected_associated_skip_validation_package_version
        $release_asset_from_file.FULLY_Validated_Package_Version | Should -Be $expected_package_version_from_fake_report
  
    }

}

Describe 'create_formatted_release_notes_file_by_release_asset' {

    It 'given expected release asset creates and sets content on release notes file' {
        $release_notes_file_name = "gh_release_notes.txt"
        $expected_associated_skip_validation_package_version = "9.9.9.9"
        $fake_package_version_report_json = get_fake_package_version_report
        $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json

        $expected_release_asset_json_content = get_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
        $expected_release_asset = $expected_release_asset_json_content | ConvertFrom-Json

        create_formatted_release_notes_file_by_release_asset -release_notes_file $release_notes_file_name -release_asset $expected_release_asset
        
        Test-Path $release_notes_file_name | Should -Be $true

        $release_notes_content_from_file = Get-Content $release_notes_file_name
        $release_notes_content_from_file | Should -Not -BeNullOrEmpty 

    }
    
}

Describe 'update_github_release_by_last_org_installed_to' {

    BeforeEach {
  
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release create" -or
            "$args" -match "release edit" -or  
            "$args" -match "release upload"}  {

            Write-Host "mocked gh release create and edit call"

        }

        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release download" }  {

            $expected_associated_skip_validation_package_version = "9.9.9.9"
            $fake_package_version_report_json = get_fake_package_version_report
            $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json
    
            $expected_release_asset_json_content = get_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
            $expected_release_asset = $expected_release_asset_json_content | ConvertFrom-Json
    
            $expected_release_asset_json_file_name = "gh_release_asset.json"
            create_json_release_notes_asset_file_by_release_asset -release_asset $expected_release_asset -release_asset_json_file_name $expected_release_asset_json_file_name
        
        }

    }

    It 'given expected int org installed to updated release asset has expected version set to INT key' {
        $expected_release = "v2.3.3.3"
        $expected_last_org = "int"
        $github_action_run_id = "239021378"
        $github_repo_url = "www.google.com"

        $expected_package_version = "1.7.0.2" #expected version from fake package version report

        update_github_release_by_last_org_installed_to -github_release_to_update $expected_release `
                                                        -last_org_installed_to $expected_last_org `
                                                        -github_action_run_id $github_action_run_id `
                                                        -github_repo_url $github_repo_url
        
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json

        $release_asset_from_file.ORGs_Installed_To.INT | Should -Be $expected_package_version

    }  
    
    It 'given expected reg org installed to, updated release asset has expected version set to REG key' {
        $expected_release = "v2.3.3.3"
        $expected_last_org = "reg"
        $github_action_run_id = "239021378"
        $github_repo_url = "www.google.com"

        $expected_package_version = "1.7.0.2" #expected version from fake package version report

        update_github_release_by_last_org_installed_to -github_release_to_update $expected_release `
                                                        -last_org_installed_to $expected_last_org `
                                                        -github_action_run_id $github_action_run_id `
                                                        -github_repo_url $github_repo_url
        
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json

        $release_asset_from_file.ORGs_Installed_To.REG | Should -Be $expected_package_version

    }  

    It 'given expected perf org installed to, updated release asset has expected version set to PERF key' {
        $expected_release = "v2.3.3.3"
        $expected_last_org = "perf"
        $github_action_run_id = "239021378"
        $github_repo_url = "www.google.com"

        $expected_package_version = "1.7.0.2" #expected version from fake package version report

        update_github_release_by_last_org_installed_to -github_release_to_update $expected_release `
                                                        -last_org_installed_to $expected_last_org `
                                                        -github_action_run_id $github_action_run_id `
                                                        -github_repo_url $github_repo_url
        
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json

        $release_asset_from_file.ORGs_Installed_To.PERF | Should -Be $expected_package_version

    }  

    It 'given expected prod org installed to, updated release asset has expected version set to PROD key' {
        $expected_release = "v2.3.3.3"
        $expected_last_org = "prod"
        $github_action_run_id = "239021378"
        $github_repo_url = "www.google.com"

        $expected_package_version = "1.7.0.2" #expected version from fake package version report

        update_github_release_by_last_org_installed_to -github_release_to_update $expected_release `
                                                        -last_org_installed_to $expected_last_org `
                                                        -github_action_run_id $github_action_run_id `
                                                        -github_repo_url $github_repo_url
        
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json

        $release_asset_from_file.ORGs_Installed_To.PROD | Should -Be $expected_package_version

    }  
    
}

Describe 'hotfix-sandbox-scenario:update_github_release_by_last_org_installed_to' {

    BeforeEach {
  
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release create" -or
            "$args" -match "release edit" -or  
            "$args" -match "release upload"}  {

            Write-Host "mocked gh release create and edit call"

        }

        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release download" }  {

            $expected_associated_skip_validation_package_version = "9.9.9.9"
            $fake_package_version_report_json = get_fake_package_version_report
            $fake_package_version_report = $fake_package_version_report_json | ConvertFrom-Json
    
            $expected_release_asset_json_content = get_hotfix_release_asset_json_content_by_package_version_report -package_version_report $fake_package_version_report -associated_skip_validation_package_version $expected_associated_skip_validation_package_version
            $expected_release_asset = $expected_release_asset_json_content | ConvertFrom-Json
    
            $expected_release_asset_json_file_name = "gh_release_asset.json"
            create_json_release_notes_asset_file_by_release_asset -release_asset $expected_release_asset -release_asset_json_file_name $expected_release_asset_json_file_name
        
        }

    }

    It 'given expected hotfix-sandbox org installed to and hotfix associated github release structure, the updated release asset has expected version set to HOTFIX-SANDBOX key' {
        $expected_release = "v2.3.3.3"
        $expected_last_org = "hotfix-sandbox"
        $github_action_run_id = "239021378"
        $github_repo_url = "www.google.com"

        $expected_package_version = "1.7.0.2" #expected version from fake package version report

        update_github_release_by_last_org_installed_to -github_release_to_update $expected_release `
                                                        -last_org_installed_to $expected_last_org `
                                                        -github_action_run_id $github_action_run_id `
                                                        -github_repo_url $github_repo_url
        
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json

        $release_asset_from_file.ORGs_Installed_To.'HOTFIX-SANDBOX' | Should -Be $expected_package_version

    }  

}

Describe 'update_github_release_asset_by_org_last_installed_to' {

    It 'given expected release params for prod org returns expected release asset with prod updated' {
        $expected_package_version = "1.1.1.2"
        $expected_associated_skip_validation_package_version = "1.1.1.1"
        $expected_package_tag = "thepackagetag"
        $last_org_installed_to = "prod"

        $fake_release_asset_json = get_fake_release_asset_json_by_release_tag_package_version_and_skip_validation_version -expected_package_version $expected_package_version `
                                                                                                                        -expected_associated_skip_validation_package_version $expected_associated_skip_validation_package_version `
                                                                                                                        -expected_package_tag $expected_package_tag

        $fake_release_asset = $fake_release_asset_json | ConvertFrom-Json
        $expected_release_asset = update_github_release_asset_by_org_last_installed_to -release_asset $fake_release_asset -package_version $expected_package_version -org_installed_to $last_org_installed_to 

        $expected_release_asset.Package_Version_Tag | Should -Be $expected_package_tag
        $expected_release_asset.ORGs_Installed_To.PROD | Should -Be $expected_package_version

    }
}

Describe 'update_github_release_prerelease_by_title_and_updated_release_asset' {


    BeforeEach {

        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release download" -or
            "$args" -match "release edit" -or
            "$args" -match "release upload" }   {

            Write-Host "mocked gh call"
        }

    }

    It 'given expected args call mocked gh commands 2 times' {
        $expected_package_version_git_tag = "v3.3.2.3"
        $release_edit_result = update_github_release_prerelease_by_title_and_updated_release_asset -github_release_tag $expected_package_version_git_tag `
                                                                                                    -release_asset $release_asset `
                                                                                                    -new_release_title $new_release_title

        Should -Invoke -CommandName gh -ModuleName github-release-service -Times 2
    }
  
}

Describe 'update_github_release_prerelease_to_published' {


    BeforeEach {

        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release download" -or
            "$args" -match "release edit" -or
            "$args" -match "release upload" }   {

            Write-Host "mocked gh call"
        }

    }

    It 'given expected args call mocked gh commands 2 times' {
        $expected_package_version_git_tag = "v3.3.2.3"
        $new_release_title = "fake_title"
        $release_edit_result = update_github_release_prerelease_to_published -github_release_tag $expected_package_version_git_tag `
                                                                                -release_asset $release_asset `
                                                                                -new_release_title $new_release_title

        Should -Invoke -CommandName gh -ModuleName github-release-service -Times 2
    }
  
}

Describe 'update_github_release_from_draft_to_prerelease' {


    BeforeEach {

        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release download" -or
            "$args" -match "release edit" -or
            "$args" -match "release upload" }   {

            Write-Host "mocked gh call"
        }

    }

    It 'given expected github tag call invoked with mocked git callouts' {
        $expected_package_version_git_tag = "v3.3.2.3"
        $release_edit_result = update_github_release_from_draft_to_prerelease -github_release_tag $expected_package_version_git_tag `
                                                                                                    -release_asset $release_asset 

        Should -Invoke -CommandName gh -ModuleName github-release-service -Times 2
    }
  
}

Describe 'get_current_pipeline_github_release_asset' {
    
    BeforeEach {
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release download" }   {
            Write-Host "mocked gh call"
            $expected_release_asset_json_file_name = "gh_release_asset.json"
            $faked_gh_release_asset_json = get_fake_release_asset_json
            If (Test-Path $expected_release_asset_json_file_name) {
                Remove-Item $expected_release_asset_json_file_name
            }
            New-Item -Path . -Name $expected_release_asset_json_file_name -ItemType "file" -Value $faked_gh_release_asset_json

        }
    }

    It 'given expected release asset json file and mocked gh cli call returns expected json' {

        $fake_tag_name = "fake tag name"
        $expected_release_asset_json_file_name = "gh_release_asset.json"
    
        $actual_release_asset_json = get_current_pipeline_github_release_asset -release_tag_name $fake_tag_name -expected_gh_release_asset_json_file $expected_release_asset_json_file_name
        
        $actual_release_asset_json | Should -Not -BeNullOrEmpty

    }
}

Describe 'generate_action_workflow_link' {

    It 'given value returned for generate_action_workflow_link matches intended link layout' {

        $github_repo_url = "https://github.com/department-of-veterans-affairs/dtc-release-cicd/"
        $github_action_run_id = "0123456789"

        $expected_workflow_link = "$github_repo_url/actions/runs/$github_action_run_id"
        Write-Host $github_action_workflow_link
        $actual_workflow_link = generate_action_workflow_link -github_repo_url $github_repo_url -github_action_run_id $github_action_run_id

        $actual_workflow_link | Should -Be $expected_workflow_link
    }
}

Describe 'delete_github_release_by_id' {

    BeforeEach {
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "api" -and
            "$args" -match "--method DELETE"  }   {

            Write-Host "DELETE GITHUB RELEASE DRAFT"
        }
    }

    It 'given 1 expected fake github release ID and expected GitHub organization and repository, mocked delete function should be invoked once' {
        
        $fake_github_organization_and_repository = "department-of-veterans-affairs/fake-dtc-repository"
        $fake_github_release_id = "125353N2"
        delete_github_release_by_id -github_release_id $fake_github_release_id -github_organization_and_repository $fake_github_organization_and_repository

        ### EXPECTING 1 FAKE GITHUB RELEASE TO BE DELETED
        Should -Invoke -ModuleName github-release-service -CommandName gh -ParameterFilter {"$args" -match "api" -and "$args" -match "--method DELETE" } -Exactly 1
    
    }

} 

Describe 'create_github_prerelease' {

    BeforeEach {
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter {
            "$args" -match "release" -and
            "$args" -match "create" } {

            Write-Host "CREATE GITHUB PRERELEASE"

        }

    }

    It 'given 1 expected github prerelease that needs to be created, the mocked github prelease creation function should be invoked once' {

        $github_tag_name = "v1.0.0"
        $release_asset_file_name = "test_asset"
        $release_notes_file_name = "test_notes"
        $release_title = "$github_tag_name.hotfix"
        create_github_prerelease -github_tag_name $github_tag_name -release_asset_file_name $release_asset_file_name -release_notes_file_name $release_notes_file_name -release_title $release_title

        ##EXPECTING 1 FAKE GITHUB PRERELEASE TO BE CREATED
        Should -Invoke -ModuleName github-release-service -CommandName gh -ParameterFilter {"$args" -match "release" -and "$args" -match "create"} -Exactly 1

    }

}

Describe 'create_github_release_build_artifact_by_package_version' {   

    BeforeEach {
  
        $random_minor_version = (( (1..9) | Get-Random -Count 3 ) | foreach { "$_" }) -join ''      
        $random_hotfix_version = (( (1..9) | Get-Random -Count 3 ) | foreach { "$_" }) -join '' 
        $fake_github_tag_name = "vtest.$random_minor_version.$random_hotfix_version"
        
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release create" }  {

            Write-Host "mocked gh release create call"
            $fake_release_creation_url = "https://github.com/department-of-veterans-affairs/dtc-release-cicd/releases/tag/$fake_github_tag_name"
            $fake_release_creation_url
        }
    }

    It 'given expected parameters creates expected github release files' {
        $fake_version_report_json = get_fake_package_version_report

        $fake_associated_skip_validation_version = "$fake_github_tag_name.99"

        create_github_release_build_artifact_by_package_version -package_version_report_json $fake_version_report_json `
                                    -github_tag_name $fake_github_tag_name `
                                    -associated_skip_validation_package_version $fake_associated_skip_validation_version 
        
        $expected_release_notes_file_name = "gh_release_notes.txt"
        $expected_release_asset_json_file_name = "gh_release_asset.json"
        
        Test-Path $expected_release_notes_file_name | Should -Be $true
        Test-Path $expected_release_asset_json_file_name | Should -Be $true

        $release_asset_json_from_file = Get-Content $expected_release_asset_json_file_name
        $release_asset_from_file = $release_asset_json_from_file | ConvertFrom-Json
        $release_asset_from_file.Associated_SKIPVALIDATION_Package_Version | Should -Be $fake_associated_skip_validation_version

    }

    It 'given expected non-equal github tag parameter mock returns failing throw' {
        
        $fake_version_report_json = get_fake_package_version_report

        $fake_failure_github_tag_name = "vexpected.fail"
        $fake_associated_skip_validation_version = "$fake_failure_github_tag_name.99"

        try {

            create_github_release_build_artifact_by_package_version -package_version_report_json $fake_version_report_json `
                                                                    -github_tag_name $fake_failure_github_tag_name `
                                                                    -associated_skip_validation_package_version $fake_associated_skip_validation_version 
        }
        catch {

            $exception_thrown = $true
        }

        $exception_thrown | Should -Be $true

    }

}

Describe 'build_new_release_branch_name_by_provided_date' {

    It 'given a non-null release date being passed in, the release branch date should include the release date' {

        $fake_version_number = "1.0.0.NEXT"
        $fake_release_branch_date = "7-6-2023"
        $expected_release_branch_name = "release_$($fake_version_number)_$fake_release_branch_date"

        $actual_release_branch_name = build_new_release_branch_name_by_provided_date -updated_version_number $fake_version_number `
                                                                                     -expected_release_branch_date $fake_release_branch_date

        $actual_release_branch_name | Should -Be $expected_release_branch_name

    }

    It 'given a null release date being passed in, the release branch date should not include a release date' {

        $fake_version_number = "1.0.0.NEXT"
        $fake_release_branch_date = $null
        $expected_release_branch_name = "release_$($fake_version_number)"

        $actual_release_branch_name = build_new_release_branch_name_by_provided_date -updated_version_number $fake_version_number `
                                                                                     -expected_release_branch_date $fake_release_branch_date

        $actual_release_branch_name | Should -Be $expected_release_branch_name
    }

}

Describe 'get_github_cli_releases_by_limit' {   

    BeforeEach {
          
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter { 
            "$args" -match "release list" }  {

            Write-Host "mocked gh release list call"
        }
    }

    It 'given expected parameters, the function should be invoked once' {

        $github_organization_and_repository = "department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo"

        get_github_cli_releases_by_limit -github_organization_and_repository $github_organization_and_repository

    }
}



Describe 'get_drafts_from_github_releases' {

    It 'given a non-null release date being passed in, the release branch date should include the release date' {

        $fake_github_releases = get_fake_github_cli_releases

        $converted_fake_github_releases = convert_github_release_strings_to_github_release_objects -latest_github_cli_releases $fake_github_releases

        $expected_github_draft_string_releases =  get_fake_github_draft_string_releases 

        $expected_github_draft_releases = convert_github_release_strings_to_github_release_objects -latest_github_cli_releases $expected_github_draft_string_releases
        $actual_github_draft_releases = get_drafts_from_github_releases -github_releases $converted_fake_github_releases

        $actual_github_draft_releases.count | Should -Be $expected_github_draft_releases.count

        foreach ( $release in $actual_github_draft_releases ) {

            $release.State | Should -Be "Draft"

        }



    }
}

Describe 'get_associated_release_drafts_by_matching_version_number' {

    It 'given a non-null release date being passed in, the release branch date should include the release date' {

        $fake_github_draft_releases = get_fake_github_draft_string_releases

        $fake_version_number = "v0.946.498"

        $fake_converted_github_draft_releases = convert_github_release_strings_to_github_release_objects -latest_github_cli_releases $fake_github_draft_releases

        $actual_github_draft_releases = get_associated_release_drafts_by_matching_version_number -github_release_drafts $fake_converted_github_draft_releases -version_number $fake_version_number

        $expected_github_draft_releases = get_fake_github_draft_releases_by_tag 

        $expected_github_draft_releases.count | Should -Be $actual_github_draft_releases.count
  

    }
}

Describe 'get_latest_github_release_draft' {

    It 'given a non-null array of GitHub Release objects being passed in, should return the latest release draft' {

        $fake_github_releases = get_fake_github_draft_releases_by_tag

        $actual_latest_release = get_latest_github_release_draft -github_release_drafts $fake_github_releases

        $expected_latest_release = get_fake_github_release_object

        $actual_latest_release | Should -Be $expected_latest_release

    }
}

Describe 'get_tag_from_github_release' {

    It 'given a non-null release date being passed in, the release branch date should include the release date' {

        $fake_github_release = get_fake_github_release_object

        $fake_converted_github_release = convert_github_release_strings_to_github_release_objects -latest_github_cli_releases $fake_github_release

        $actual_associated_tag = get_tag_from_github_release -github_release $fake_converted_github_release

        $expected_associated_tag = "v0.946.498.12"

        $actual_associated_tag | Should -Be $expected_associated_tag

    }
}


Describe 'convert_github_release_strings_to_github_release_objects' {

    It 'given a non-null release date being passed in, the release branch date should include the release date' {

        $fake_github_releases = get_fake_github_cli_releases

        $expected_converted_github_releases = get_fake_converted_github_releases

        $actual_converted_github_releases = convert_github_release_strings_to_github_release_objects -latest_github_cli_releases $fake_github_releases

        $actual_converted_github_releases.length | Should -Be $expected_converted_github_releases.length

        $actual_converted_github_releases.GetType() | Should -Be $expected_converted_github_releases.getType()


    }
}

Describe 'get_github_release_by_tag_name' {

    BeforeEach {
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter {
            "$args" -match "api" } {

            Write-Host "GETTING RELEASE BY TAG NAME"

            $fake_github_release = get_fake_release_by_tag_name
            $fake_github_release

        }

    }

    It 'given expected tag name returns expected github release' {

        $expected_github_tag_name = "v1.0.0.37"
        $fake_github_owner_and_repository = "department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo"

        $actual_github_release_by_tag_name_json = get_github_release_by_tag_name -tag_name $expected_github_tag_name -github_organization_and_repository $fake_github_owner_and_repository
        $actual_github_release = $actual_github_release_by_tag_name_json | ConvertFrom-Json

        $actual_tag_name = $actual_github_release.tag_name

        $actual_tag_name | Should -Be $expected_github_tag_name
        
    }

}

Describe 'get_all_github_releases_by_repo_and_organization_owner' {

    BeforeEach {
        Mock -ModuleName github-release-service -CommandName gh -ParameterFilter {
            "$args" -match "api" } {

            $actual_github_releases = get_fake_github_releases

            $actual_github_releases
        }

    }

    It 'given expected tag name returns expected github release' {

        $fake_github_owner_and_repository = "test-repo"
        $expected_count_of_fake_github_releases = 10

        $actual_github_releases = get_all_github_releases_by_repo_and_organization_owner -github_organization_and_repository $fake_github_owner_and_repository

        $actual_github_releases.count | Should -Be $expected_count_of_fake_github_releases
        
    }

}


Describe 'does_branch_exist_in_origin' {

    Context 'given a branch that does exist in origin being passed in, the actual_branch_exists_result should return as true' {
        
        BeforeEach {
            Mock -ModuleName github-release-service -CommandName git -ParameterFilter {
                "$args" -match "branch" } {
    
                Write-Host "GETTING RELEASE BY TAG NAME"
    
                $fake_git_branch = "origin/master"
                $fake_git_branch
    
            }
    
        }
    
        It 'given a branch that does exist in origin being passed in, the actual_branch_exists_result should return as true' {

            $branch_name = "master"
    
            $expected_branch_exists_result = $true
    
            $actual_branch_exists_result = does_branch_exist_in_origin -branch_name $branch_name
    
            $expected_branch_exists_result | Should -Be $actual_branch_exists_result
            
        }    

    }   

    Context 'given a branch that does not exist in origin being passed in, the actual_branch_exists_result should return as false' { 
        
        BeforeEach {
            Mock -ModuleName github-release-service -CommandName git -ParameterFilter {
                "$args" -match "branch" } {
    
                Write-Host "GETTING RELEASE BY TAG NAME"
    
                $fake_git_branch = $null
                $fake_git_branch
    
            }
    
        }
    
        It 'given a branch that does not exist in origin being passed in, the actual_branch_exists_result should return as false' {

            $branch_name = "expected_fake_branch"
    
            $expected_branch_exists_result = $false
        
            $actual_branch_exists_result = does_branch_exist_in_origin -branch_name $branch_name
        
            $expected_branch_exists_result | Should -Be $actual_branch_exists_result
                    
        }          

    }   

}


