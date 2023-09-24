param (
    $github_organization_and_repository,
    $version_number
)

Import-Module -Force -DisableNameChecking "$PSScriptRoot/../github/github-release-service.psm1"
Import-Module -Force -DisableNameChecking "$PSScriptRoot/../package/unlocked_packages_utility.psm1"

$all_github_releases = get_all_github_releases_by_repo_and_organization_owner -github_organization_and_repository $github_organization_and_repository
$latest_created_release_version = convert_git_tag_to_package_version_build -associated_github_tag $version_number
foreach ($release in $all_github_releases) {

    $release_major_minor_patch = convert_git_tag_to_package_version_build -associated_github_tag $release.tag_name
    $is_matching_major_minor_patch = ( $latest_created_release_version.MajorVersion -eq $release_major_minor_patch.MajorVersion `
                                        -and $latest_created_release_version.MinorVersion -eq $release_major_minor_patch.MinorVersion `
                                        -and $latest_created_release_version.PatchVersion -eq $release_major_minor_patch.PatchVersion )

    if ( $release.tag_name -ne $version_number -and `
            $release.draft -eq "True" -and `
            $is_matching_major_minor_patch ) {

        delete_github_release_by_id -github_release_id $release.id -github_organization_and_repository $github_organization_and_repository
        $tag_name = $release.tag_name
        Write-Host "deleted release: $tag_name"

    }
}



