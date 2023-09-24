


Import-Module -Force .\sfdx_project_utility\sfdx_project_json_service.psm1
Import-Module -Force .\sfdx_project_utility\tests\sfdx_project_json.test.utility.psm1

# Invoke-Pester -EnableExit -Strict .\sfdx_project_utility\tests\unit\sfdx_project_json_service.unit.tests.ps1 -CodeCoverage .\sfdx_project_utility\sfdx_project_json_service.psm1

Describe "get_expected_package_version_by_sfdx_project_json" {


    It "given expected sfdx-project.json file returns expected package version number " {

        $expected_sfdx_project_package_version = "1.3.1" ### comes from utility file
        $fake_sfdx_project_json_content = get_fake_sfdx_project_json_file_content_with_expected_patch_version_number
        $actual_package_version_number = get_package_version_number_by_sfdx_project_json_file_content -sfdxprojectjson_content $fake_sfdx_project_json_content
        
        $actual_package_version_number | Should -Be $expected_sfdx_project_package_version

    }



}

Describe "update_sfdx_project_json_version_number" {


    It "given expected sfdx-project.json file returns expected package version number " {

      
        $sfdx_project_json_content = get_fake_sfdx_project_json_file_content_with_expected_patch_version_number

        $test_sfdx_project_json_file_name = "test-sfdx-project.json"

        New-Item -Name $test_sfdx_project_json_file_name -Value $sfdx_project_json_content

        $expected_version_number = "99.99.99"
        $expected_version_number_from_sfdxprojectjson = "$expected_version_number.NEXT"

        update_sfdx_project_json_version_number -sfdx_project_json_path $test_sfdx_project_json_file_name -version_number $expected_version_number

        $actual_sfdx_project_json_content = Get-Content $test_sfdx_project_json_file_name

        $fake_sfdxproject_detail = $actual_sfdx_project_json_content | ConvertFrom-Json

        $actual_version_number = $fake_sfdxproject_detail.packageDirectories `
                                                            | Where-Object { $_.default -eq $true} `
                                                            | Select-Object -ExpandProperty "versionNumber"

        $actual_version_number | Should -Be $expected_version_number_from_sfdxprojectjson

        Remove-Item -Path $test_sfdx_project_json_file_name

    }



}

Describe "increment_sfdx_project_json_version_number_by_update_type" {

    It "given expected sfdx-project.json file and patch update type returns expected package version number " {

        $expected_version_number = "2.0.0"
       
        $fake_sfdx_project_json_content = get_fake_sfdx_project_json_file_content_with_expected_patch_version_number
        
        $fake_version_number = get_package_version_number_by_sfdx_project_json_file_content -sfdxprojectjson_content $fake_sfdx_project_json_content

        $fake_update_type = "major"

        $actual_version_number = increment_sfdx_project_json_version_number_by_update_type -version_number $fake_version_number -update_type $fake_update_type

        $actual_version_number | Should -Be $expected_version_number

    }

    It "given expected sfdx-project.json file and minor update type returns expected package version number " {

        $expected_version_number = "1.4.0"
       
        $fake_sfdx_project_json_content = get_fake_sfdx_project_json_file_content_with_expected_patch_version_number
        
        $fake_version_number = get_package_version_number_by_sfdx_project_json_file_content -sfdxprojectjson_content $fake_sfdx_project_json_content

        $fake_update_type = "Minor"

        $actual_version_number = increment_sfdx_project_json_version_number_by_update_type -version_number $fake_version_number -update_type $fake_update_type

        $actual_version_number | Should -Be $expected_version_number

    }

    It "given expected sfdx-project.json file and patch update type returns expected package version number " {

        $expected_version_number = "1.3.2"
       
        $fake_sfdx_project_json_content = get_fake_sfdx_project_json_file_content_with_expected_patch_version_number
        
        $fake_version_number = get_package_version_number_by_sfdx_project_json_file_content -sfdxprojectjson_content $fake_sfdx_project_json_content

        $fake_update_type = "Patch"

        $actual_version_number = increment_sfdx_project_json_version_number_by_update_type -version_number $fake_version_number -update_type $fake_update_type

        $actual_version_number | Should -Be $expected_version_number

    }
}

Describe "get_path_of_default_package_code_base_by_sfdx_project_json_file_content" {


    It "given expected path of default package code base by sfdx project json file content " {

        $expected_default_path_from_sfdx_project_json_content = "sfdx-source/fake-utility-package"
        $fake_sfdx_project_json_content = get_fake_sfdx_project_json_file_content_with_expected_patch_version_number
        $actual_default_path_from_sfdx_project_json_content = get_path_of_default_package_code_base_by_sfdx_project_json_file_content -sfdxprojectjson_content $fake_sfdx_project_json_content
        
        $actual_default_path_from_sfdx_project_json_content | Should -Be $expected_default_path_from_sfdx_project_json_content

    }
}


