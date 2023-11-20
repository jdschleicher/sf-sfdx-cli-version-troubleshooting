param(
    [Parameter(Mandatory=$true)]
    $validation_type,
    [Parameter(Mandatory=$true)]
    $devhub_alias,
    [Parameter(Mandatory=$true)]
    $package_name
)

Import-Module -DisableNameChecking "$PSScriptRoot/../package/package_version_service.psm1"

$package_version_creation_result = $null

$is_full_validation = $validation_type.toUpper() -eq "FULL"

$package_version_creation_details = [PSCustomObject]@{
    'github_run_id'                              = $env:GITHUB_RUN_ID;
    'devhub_alias'                               = $devhub_alias; 
    'package_name'                               = $package_name;
    'github_json'                                = $env:GITHUB_JSON;
    'is_full_validation'                         = $is_full_validation;
    'associated_skip_validation_package'         = 'n/a';
    'associated_skip_validation_package_version' = 'n/a'; 
    'package_tag'                                = 'n-a';   
}

if ( $is_full_validation ) {

    $package_version_creation_result = create_full_validation_package_version_and_get_result -package_detail $package_version_creation_details -devhub_alias $devhub_alias

} else {

    $package_version_creation_result = create_skip_validation_package_version_and_get_result -package_detail $package_version_creation_details -devhub_alias $devhub_alias

}

Write-Host "create package version result:$($package_version_creation_result.result)"
if ( $package_version_creation_result.status -ne $success_result `
        -and $package_version_creation_result.result.Status -ne "Success") {

    Write-Host "Failure Result Status: $($package_version_creation_result.result.Status)"
    Write-Host "Actual Status Code: $($package_version_creation_result.status)"
    Write-Host "Error Message: $($package_version_creation_result.message)"
    $fail_result = 1
    exit $fail_result
}

$subscriber_package_version_id = $package_version_creation_result.result.SubscriberPackageVersionId
$subscriber_package_version_id
