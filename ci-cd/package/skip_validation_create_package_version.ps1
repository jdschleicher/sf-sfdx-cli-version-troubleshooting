param($package_version_creation_details)

Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-environment-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-release-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../slack/slack-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../package/package_version_service.psm1"

Write-Host 'CREATING PACKAGE VERSION'


$fail_result = 1
$success_result = 0
$result = 0

$triggering_branch = get_branch_name_by_github_json -github_json $package_version_creation_details.github_json
$timestamp = $(Get-Date -Format "yyyy.MM.dd_HH:mm_K")
$package_tag = "$($triggering_branch)_$($timestamp)"
Write-Host "SKIP VALIDATION BEGINNING"
$package_detail = [PSCustomObject]@{
    "package_tag"   = $package_tag;
    "package_name"  = $package_version_creation_details.package_name;
}
$package_version_creation_result = create_skip_validation_package_version_and_get_result -package_detail $package_detail -devhub_alias $package_version_creation_details.devhub_alias

Write-Host "create package version result:$($package_version_creation_result.result)"
if ( $package_version_creation_result.status -eq $success_result -and $package_version_creation_result.result.Status -eq "Success") {
    
    $subscriber_package_version_id = $package_version_creation_result.result.SubscriberPackageVersionId

    Write-Host "GETTING PACKAGE VERSION REPORT"
    $package_version_report = get_package_version_report_by_subscriberversionid_and_devhub -subscriber_package_version_id $subscriber_package_version_id -devhub_alias $package_version_creation_details.devhub_alias
    
    if ( $package_version_report.status -eq $success_result ) {
        
        $package_version = $package_version_report.result.Version
        Write-Host "`$package version is $package_version"

        $slack_message_package_info = [PSCustomObject]@{
            "github_run_id" = $package_version_creation_details.github_run_id;
            "package_name" = $package_version_creation_details.package_name;
            "package_tag" = $package_tag;
            "package_version" = $package_version
            "subscriber_package_version_id" = $subscriber_package_version_id;
        }        
        set_ghactions_outputs_for_skipvalidation_package_details -package_tag_output $package_tag_output -subscriber_package_version_id $subscriber_package_version_id -package_version $package_version -slack_message_package_info $slack_message_package_info

    } else {
        $result = $fail_result
    }

} else {
    Write-Host "Failure Result Status: $($package_version_creation_result.result.Status)"
    Write-Host "Actual Status Code: $($package_version_creation_result.status)"
    Write-Host "Error Message: $($package_version_creation_result.message) "
    $result = $fail_result
}

#EXIT RESULT - 0 = SUCCESS / 1 = FAILURE
exit $result

