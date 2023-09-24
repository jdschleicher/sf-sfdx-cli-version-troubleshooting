param(
    $github_json, 
    $version_number
)

Import-Module -DisableNameChecking -Force "$PSScriptRoot/../github/github-environment-service.psm1"
Import-Module -DisableNameChecking -Force "$PSScriptRoot/../github/github-release-service.psm1"

$github_organization = get_workflow_github_organization_by_github_json $github_json
$github_repository = get_repository_name_by_github_json $github_json

function fail_and_exit {
  exit 1 
}

Write-Host 'DOWNLOADING LATEST RELEASE TAG FROM GITHUB'
$latest_github_cli_string_releases = get_github_cli_releases_by_limit -github_organization_and_repository "$github_organization/$github_repository"
if ( $null -eq $latest_github_cli_string_releases ) {
    Write-Error "get_github_cli_releases_by_limit failed test value"
    fail_and_exit
}

$latest_github_cli_releases = convert_github_release_strings_to_github_release_objects -latest_github_cli_releases $latest_github_cli_string_releases
if ( $null -eq $latest_github_cli_releases ) {
    Write-Error "convert_github_release_strings_to_github_release_objects failed"
    fail_and_exit
}

$draft_releases = get_drafts_from_github_releases -github_releases $latest_github_cli_releases
if ( $null -eq $draft_releases ) {
    Write-Error "get_drafts_from_github_releases failed"
    fail_and_exit
}

$associated_release_drafts = get_associated_release_drafts_by_matching_version_number -github_release_drafts $draft_releases -version_number $version_number
if ( $null -eq $associated_release_drafts ) {
    Write-Error "get_associated_release_drafts_by_matching_version_number failed"
    fail_and_exit
}

$latest_associated_release_draft = get_latest_github_release_draft -github_release_drafts $associated_release_drafts
if ( $null -eq $latest_associated_release_draft ) {
    Write-Error "get_latest_github_release_draft failed"
    fail_and_exit
}

$latest_github_release_tag = get_tag_from_github_release -github_release $latest_associated_release_draft
if ( $null -eq $latest_github_release_tag ) {
    Write-Error "get_tag_from_github_release failed"
    fail_and_exit
}

Write-Host "gh_release_tag_name : $latest_github_release_tag"
"gh_release_tag_name=$latest_github_release_tag" >> $env:GITHUB_OUTPUT

$expected_gh_release_asset_json_file = "gh_release_asset.json" 
WRITE-HOST "gh_json_file_name_pattern : $expected_gh_release_asset_json_file"
gh release download $latest_github_release_tag --pattern $expected_gh_release_asset_json_file

$success_result = 0
$failure_result = 1
$result = 1
if (Test-Path $expected_gh_release_asset_json_file) {
    $json_content = Get-Content $expected_gh_release_asset_json_file -Raw | ConvertFrom-Json 
    $subscriber_package_version_id = $json_content.SubscriberPackageVersionId
    $package_version = $json_content.FULLY_Validated_Package_Version
    WRITE-HOST "subscriber_package_version_id from downloaded json : $subscriber_package_version_id"
    WRITE-HOST "package_version from downloaded json : $package_version"
    "latest_release_subscriber_package_version_id=$subscriber_package_version_id" >> $env:GITHUB_OUTPUT

    $result = $success_result

} else {
    Write-Host "NO GITHUB JSON FILE FOUND"
    $result = $failure_result
}

exit $result

