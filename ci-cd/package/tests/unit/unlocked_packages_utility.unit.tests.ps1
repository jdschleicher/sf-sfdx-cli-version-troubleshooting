Using module ..\..\unlocked_packages_utility.psm1

Import-Module -Force -DisableNameChecking "$PSScriptRoot\..\..\tests\unlocked_packages_utility_mock_service.psm1"   
# Invoke-Pester -EnableExit -Strict .\package\tests\unit\unlocked_packages_utility.unit.tests.ps1 -CodeCoverage .\package\unlocked_packages_utility.psm1

BeforeAll {
    #Needed in order to mock the sf commands since the sfdx cli seems to overwrite mocking commands
    New-Module -Script { 
        function sf-test { 
            "Mocking sf call" 
        }; 
        Set-Alias sf sf-test; 
        Export-ModuleMember -Alias sf -Function sf-test 
    }
}

Describe "get_package_version_by_version_and_metadatapackage_id_and_build_version" {

    BeforeEach {
        Mock -ModuleName unlocked_packages_utility -CommandName sf -ParameterFilter { 
            "$args" -match 'data query' -and
            "$args" -match "--query" } {
            
            $fake_package_version_by_metadatapackage_id_json = get_fake_package_version_by_version_and_metadatapackage_id_and_build_version
            $fake_package_version_by_metadatapackage_id_json 
        }
    }

    It "given expected metadatapackage id and version number returns expected version number to validate and subscriber id" {

        $fake_metadata_package_id = "32423423432"
        $fake_devhub_alias = "devhub_test"
        $expected_fake_package_version_build = [PackageVersionBuild]@{
            MajorVersion = 1
            MinorVersion = 0
            PatchVersion = 0
            BuildNumber = 37
        }

        $actual_package_version_by_metadatapackage_id_json = get_package_version_by_version_and_metadatapackage_id_and_build_version -devhub_alias $fake_devhub_alias `
                                                                                                                                    -metadata_package_id $fake_metadata_package_id `
                                                                                                                                    -package_version_build $expected_fake_package_version_build
                                                                                                                        
        $actual_package_version_detail = $actual_package_version_by_metadatapackage_id_json | ConvertFrom-Json

        ### THE BELOW ASSERTS ARE BASED ON THE RETURNING RESULTS FROM THE MOCK SERVICE
        $expected_subscriber_id = "04tOE0000000RqLYAU"
        $actual_package_version_detail.result.records[0].MajorVersion | Should -Be $expected_fake_package_version_build.MajorVersion
        $actual_package_version_detail.result.records[0].MinorVersion | Should -Be $expected_fake_package_version_build.MinorVersion
        $actual_package_version_detail.result.records[0].PatchVersion | Should -Be $expected_fake_package_version_build.PatchVersion
        $actual_package_version_detail.result.records[0].BuildNumber | Should -Be $expected_fake_package_version_build.BuildNumber
        $actual_package_version_detail.result.records[0].Id | Should -Be $expected_subscriber_id

    }

}

Describe "get_metadatapackage_detail_by_package_name" {

    BeforeEach {
        Mock -ModuleName unlocked_packages_utility -CommandName sf -ParameterFilter { 
            "$args" -match 'data query' -and
            "$args" -match "--query" } {
            
            $fake_metadatapackage_detail_json = get_fake_metadatapackage_detail_by_package_name
            $fake_metadatapackage_detail_json 
        }
    }

    It "given expected package name returns metadata package id" {

        $fake_package_name = "dtc-fake-package"
        $fake_devhub_alias = "devhub_test"

        $actual_metadatapackage_detail_json = get_metadatapackage_detail_by_package_name -devhub_alias $fake_devhub_alias `
                                                                                            -package_name $fake_package_name 
                                                                                                                        
        $actual_metadatapackage_detail = $actual_metadatapackage_detail_json | ConvertFrom-Json

        ### THE BELOW ASSERTS ARE BASED ON THE RETURNING RESULTS FROM THE MOCK SERVICE
        $expected_fake_metadatapackage_id = "0333d0000008T69AAE"

        $actual_metadatapackage_detail.result.records[0].Id | Should -Be $expected_fake_metadatapackage_id

    }

}

Describe "convert_git_tag_to_package_version_build" {

    It "given expected tag being passed in, the properties of the created PackageVersionBuild object should equal the expected numbers" {

        $fake_tag_name = "1.2.0.3"

        $expected_major_version_number = "1"
        $expected_minor_version_number = "2"
        $expected_patch_version_number = "0"
        $expected_build_number = "3"

        $actual_package_version_build = convert_git_tag_to_package_version_build -associated_github_tag $fake_tag_name

        $actual_package_version_build.MajorVersion | Should -Be $expected_major_version_number
        $actual_package_version_build.MinorVersion | Should -Be $expected_minor_version_number
        $actual_package_version_build.PatchVersion | Should -Be $expected_patch_version_number
        $actual_package_version_build.BuildNumber | Should -Be $expected_build_number

    }

}