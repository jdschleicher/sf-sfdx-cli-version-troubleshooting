Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github_template_repository_service.psm1"

# Invoke-Pester -EnableExit -Strict .\github\github_repository_templates\tests\unit\github_template_repository_service.unit.tests.ps1 -CodeCoverage .\github\github_repository_templates\github_template_repository_service.psm1


Describe 'create_github_repo_from_template' {

    BeforeEach {
        Mock -ModuleName github_template_repository_service -CommandName gh {
            Write-Host "expected successful Invoke-WebRequest"
        }
    }


    It 'given expected repository and product details, an expected repository is created' {
       
        $fake_github_organization = "department-of-va"
        $fake_new_repository_name = "new-product"
        $fake_github_template_name = "dtc-rollout-ci-fake-template"
        $fake_product_description = "descriptive stuff"
        
        $actual_gh_create_repo_callout = create_github_repo_from_template -github_organization $fake_github_organization `
                                            -new_repository_name $fake_new_repository_name `
                                            -github_template_name $fake_github_template_name `
                                            -product_description $fake_product_description


        Should -Invoke -ModuleName github_template_repository_service -CommandName gh -Exactly 1

    } 
}