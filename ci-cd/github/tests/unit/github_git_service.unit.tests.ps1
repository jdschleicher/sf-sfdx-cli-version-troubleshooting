Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github_git_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\tests\github-test-utility.psm1"

# Invoke-Pester -EnableExit -Strict .\github\tests\unit\github_git_service.unit.tests.ps1 -CodeCoverage .\github\github_git_service.psm1

Describe 'create_git_tag' {

    BeforeEach {

        Mock -ModuleName github_git_service -CommandName git  {
            Write-Host "mocked git call"
        }

    }

    It 'given expected github tag call invoked with mocked git callouts' {
        $expected_package_version_git_tag = "v3.3.2.3"
        create_git_tag -GH_TAG $expected_package_version_git_tag

        Should -Invoke -CommandName git -ModuleName github_git_service -Times 4
    }

}

Describe "create_pull_request" {

    BeforeEach {

        Mock -ModuleName github_git_service -CommandName gh  {       
            $fake_pr_link = get_fake_pull_request_link
            $fake_pr_link        
        }

    }

    it "given expected fake paramaters for pull request, gh cli call is mocked and returns expected fake pr link" {
        
        $expected_fake_pr_link_pr_number_wildcard = "*526*"
        
        $pull_request_title = "pull_request_title test parameter" 
        $pull_request_body = "pull_request_body test parameter" 
        $head_branch = "head_branch test parameter" 
        $base_branch = "base_branch test parameter"

        $fake_pull_request_link = create_pull_request -pull_request_title $pull_request_title `
                                                            -pull_request_body $pull_request_body `
                                                            -head_branch $head_branch `
                                                            -base_branch $base_branch 

        $fake_pull_request_link | Should -BeLike $expected_fake_pr_link_pr_number_wildcard

    }

}

Describe "merge_pull_request" {

    BeforeEach {

        Mock -CommandName gh -ModuleName github_git_service  {

            Write-Host "mocked gh merge call"
        }

    }

    it "given expected fake paramaters for pull request, gh cli call is mocked and runs once" {
        
        $fake_pr_link = get_fake_pull_request_link

        merge_pull_request -created_pr_link $fake_pr_link

        Should -Invoke -ModuleName github_git_service -CommandName gh -Exactly 1


    }

}

