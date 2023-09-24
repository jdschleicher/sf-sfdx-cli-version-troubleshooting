param (
    $github_issue_body,
    $github_organization_and_repository,
    $github_issue_number,
    $github_token
)

Write-Host "Here is the issue number: $github_issue_number"

Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github\github-release-service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\sfdx_project_utility\sfdx_project_json_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github\github_issues\github_issue_service.psm1"
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\github\va_standards_service.psm1"

git config --global user.email "dtcsalesforcedevops@va.gov" | Out-Null
git config --global user.name "dtcsalesforcedevops" | Out-Null

### USE GIT FETCH UNSHALLOW TO ENSURE REFERENCES ARE AVAILABLE
git fetch --unshallow origin

$sfdx_project_json_path = "sfdx-project.json"
$sfdxprojectjson_content = Get-Content $sfdx_project_json_path

Write-Host "here is sfdxprojectjson content: $sfdxprojectjson_content"
$version_number = get_package_version_number_by_sfdx_project_json_file_content -sfdxprojectjson_content $sfdxprojectjson_content


$github_issue_map = parse_github_issue_body_to_map -github_issue_body $github_issue_body

Write-Host "HERE IS `$version_num: $version_number"
$update_type = $github_issue_map.Is_this_new_release_branch_a_minor_version_update_or_a_patch_version_update 
$updated_version_number = increment_sfdx_project_json_version_number_by_update_type -version_number $version_number -update_type $update_type

$expected_release_branch_date = $github_issue_map.Release_Branch_Date_Optional

git status

$git_flow_base_branch_name = "sit"
if ( does_branch_exist_in_origin -branch_name $git_flow_base_branch_name ) {
    
    git checkout $git_flow_base_branch_name | Out-Null

}

$expected_release_branch_name = build_new_release_branch_name_by_provided_date -updated_version_number $updated_version_number `
                                                                               -expected_release_branch_date $expected_release_branch_date
                                                          
git checkout -b $expected_release_branch_name

update_sfdx_project_json_version_number -sfdx_project_json_path $sfdx_project_json_path -version_number $updated_version_number

git add $sfdx_project_json_path | Out-Null
$commit_message = "Incremented version number for $expected_release_branch_name"
git commit -m "$commit_message" | Out-Null

$deployment_plan_path = "deployment_plans"
create_release_associated_artifacts -expected_release_branch_name $expected_release_branch_name -deployment_plan_path $deployment_plan_path

git add $deployment_plan_path | Out-Null
$commit_message = "Created deployment plan directory for $expected_release_branch_name"
git commit -m "$commit_message" | Out-Null
git push -u origin $expected_release_branch_name | Out-Null

$request_body = "This is the created release branch: https://github.com/$github_organization_and_repository/tree/$expected_release_branch_name"

add_github_issue_comment -github_organization_and_repository $github_organization_and_repository `
                         -github_issue_number $github_issue_number `
                         -github_token $github_token `
                         -request_body $request_body

$issue_status = "closed"
update_github_issue_status -github_organization_and_repository $github_organization_and_repository `
                            -github_issue_number $github_issue_number `
                            -github_token $github_token `
                            -issue_status $issue_status
