
function get_metadatapackage_detail_by_package_name {
    param(
        $devhub_alias,
        $package_name
    )

    $metadata_package_query = "SELECT Id, 
                        Name, 
                        NamespacePrefix, 
                        PackageCategory, 
                        SystemModstamp 
                    FROM MetadataPackage WHERE Name = '$package_name'"

    $metadata_package_query_result_json = $( sf data query --query "$metadata_package_query" --target-org $devhub_alias --json)  
    $metadata_package_query_result_json 

}

function get_package_version_by_version_and_metadatapackage_id_and_build_version {
    param(
        $devhub_alias,
        $metadata_package_id,
        [PackageVersionBuild]$package_version_build
    )

    $package_version_query_by_build_and_metadatapackage_id = "SELECT Id, 
                                MetadataPackageId, 
                                Name, 
                                ReleaseState, 
                                MajorVersion, 
                                MinorVersion, 
                                PatchVersion, 
                                BuildNumber, 
                                SystemModstamp, 
                                IsDeprecated 
                            FROM MetadataPackageVersion
                            WHERE MetadataPackageId = '$metadata_package_id'
                                AND MajorVersion = $($package_version_build.MajorVersion)
                                AND MinorVersion = $($package_version_build.MinorVersion)
                                AND PatchVersion = $($package_version_build.PatchVersion)
                                AND BuildNumber = $($package_version_build.BuildNumber)
                                AND ReleaseState = 'Beta'
                            LIMIT 1"

    $package_version_query_by_build_and_metadatapackage_id_json = $( sf data query --query "$package_version_query_by_build_and_metadatapackage_id" --target-org $devhub_alias --json)  
    $package_version_query_by_build_and_metadatapackage_id_json 

}

class PackageVersionBuild {
    [int]$MajorVersion
    [int]$MinorVersion
    [int]$PatchVersion
    [int]$BuildNumber
}

function convert_git_tag_to_package_version_build {
    param ($associated_github_tag)

    $associated_github_tag_without_v = $associated_github_tag.replace("v","")
    $version_build_split = $associated_github_tag_without_v.split(".")
    $major_version_index = 0
    $minor_version_index = 1
    $patch_version_index = 2
    $build_version_index = 3
    $package_version_build = [PackageVersionBuild]::new()

    $package_version_build.MajorVersion = $version_build_split[$major_version_index]
    $package_version_build.MinorVersion = $version_build_split[$minor_version_index]
    $package_version_build.PatchVersion = $version_build_split[$patch_version_index]
    $package_version_build.BuildNumber = $version_build_split[$build_version_index]

    $package_version_build

}