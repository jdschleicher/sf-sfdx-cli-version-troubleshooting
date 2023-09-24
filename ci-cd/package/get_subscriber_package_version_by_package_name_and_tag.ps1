Using module "./unlocked_packages_utility.psm1"

param(
    [Parameter(Mandatory=$true)]
    $associated_github_tag,
    [Parameter(Mandatory=$true)]
    $package_name,
    [Parameter(Mandatory=$true)]
    $devhub_alias
)

Write-Host "associated_github_tag $associated_github_tag"
Write-Host "package_name $package_name"
Write-Host "devhub_alias $devhub_alias"

$metadata_package_detail_json = get_metadatapackage_detail_by_package_name -package_name $package_name -devhub_alias $devhub_alias
$metadata_package_detail = $metadata_package_detail_json | ConvertFrom-Json

if ( $metadata_package_detail.status -eq 1 ) {
### ERROR POSTING LOGS
    Throw "THERE WAS AN ISSUE QUERYING THE METADATA PACKAGE BY PACKAGE NAME"
    
} elseif ( $metadata_package_detail.result.records.count -ne 1 ) {

    Throw "THE EXPECTED METADATA PACKAGE WAS NOT RETURNED"
}

$metadata_package_id = $metadata_package_detail.result.records[0].Id

$package_version_build = convert_git_tag_to_package_version_build -associated_github_tag $associated_github_tag 

$package_version_json = get_package_version_by_version_and_metadatapackage_id_and_build_version -devhub_alias $devhub_alias `
                                                                                                                        -metadata_package_id $metadata_package_id `
                                                                                                                        -package_version_build $package_version_build 

$package_version_detail = $package_version_json | ConvertFrom-Json

if ( $package_version_detail.status -ne 0 ) {
    
    Throw "THERE WAS AN ISSUE QUERYING FOR THE PACKAGE VERSION BY METADATA PACKAGE ID AND TAG"

} elseif ( $package_version_detail.result.records.count -ne 1 ) {
    
    Throw "THERE WERE NO RESULTS RETURNED FOR PACKAGE BASED ON PACKAGE NAME AND TAG"
}

$package_version_subscriber_id = $package_version_detail.result.records[0].ID

$package_version_subscriber_id











