Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\github-environment-service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github-test-utility.psm1"


# Invoke-Pester -EnableExit -Strict .\github\tests\unit\github-environment-service.unit.tests.ps1 -CodeCoverage .\github\github-environment-service.psm1
Describe 'get_branch_name_by_github_json' {

    It 'given expected github_json returns expected branch name' {

        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_branch_name = get_branch_name_by_github_json -github_json $mock_github_object

        $expected_branch_name = "test-json-branch-name"
        $expected_branch_name | Should -Be $mock_branch_name

    }

}


Describe 'get_repository_name_by_github_json' {

    It 'given expected github_json returns expected repository name' {

        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_branch_name = get_repository_name_by_github_json -github_json $mock_github_object

        $expected_repo_name = "dtc-release-cicd"
        $expected_repo_name | Should -Be $mock_branch_name
    }

}

Describe 'get_repository_workflow_by_github_json' {

    It 'given expected github_json returns expected workflow name' {
        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_workflow_name = get_repository_workflow_by_github_json -github_json $mock_github_object

        $expected_workflow_name = "test-expected-workflow-name"
        $expected_workflow_name | Should -Be $mock_workflow_name
    }

}


Describe 'get_github_username_by_github_json' {

    It 'given expected github_json returnes expected github username' {
        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_github_username = get_github_username_by_github_json -github_json $mock_github_object

        $expected_workflow_name = "test-github-username"
        $expected_workflow_name | Should -Be $mock_github_username
    }
}

Describe 'get_job_name_by_github_json' {

    It 'given expected github_json returnes expected job name' {
        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_job_name = get_job_name_by_github_json -github_json $mock_github_object

        $expected_job_name = "test-job-name"
        $expected_job_name | Should -Be $mock_job_name
    }
}


Describe 'get_workflow_github_organization_by_github_json' {

    It 'given expected github_json returnes expected organization name' {
        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_organization_name = get_workflow_github_organization_by_github_json -github_json $mock_github_object

        $expected_organization_name = "department-of-veterans-affairs"
        $expected_organization_name | Should -Be $mock_organization_name
    }

}

Describe 'get_github_object_by_json' {

    It 'given expected github_json returnes expected github object' {
        $mock_github_object = get_fake_github_json_from_pull_request_closed_event
        $mock_github_object | Should -Not -BeNullOrEmpty
    }

}


