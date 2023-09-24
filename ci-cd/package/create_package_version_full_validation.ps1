param($package_version_creation_details)

Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-environment-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../github/github-release-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../slack/slack-service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../package/package_version_service.psm1"
Import-Module -DisableNameChecking "$PSScriptRoot/../github/github_git_service.psm1"


Write-Host 'CREATING PACKAGE VERSION'
Write-Host "`$package_version_creation_details.is_full_validation is: $($package_version_creation_details.is_full_validation)"
Write-Host "`$package_version_creation_details.associated_skip_validation_package is: $($package_version_creation_details.associated_skip_validation_package)"
Write-Host "`$package_version_creation_details.packageVersion is: $($package_version_creation_details.packageVersion)"

$fail_result = 1
$success_result = 0
$result = 0

$timestamp = $(Get-Date -Format "yyyy.MM.dd_HH:mm_K")
$triggering_branch = get_branch_name_by_github_json -github_json $package_version_creation_details.github_json
$package_tag = "validated_$($package_version_creation_details.associated_skip_validation_package)_$($triggering_branch)_$($timestamp)"

Write-Host "FULL VALIDATION BEGINNING"
$package_detail = [PSCustomObject]@{
    "package_tag"   = $package_tag;
    "package_name"  = $package_version_creation_details.package_name;
}    
$package_version_creation_result = create_full_validation_package_version_and_get_result -package_detail $package_detail -devhub_alias $package_version_creation_details.devhub_alias

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

        $github_tag_name = "v$package_version" 
        create_git_tag $github_tag_name
        set_ghactions_output_from_fullvalidation_job -github_tag $github_tag_name -package_version_report $package_version_report -slack_message_package_info $slack_message_package_info

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

