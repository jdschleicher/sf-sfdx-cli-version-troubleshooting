Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\sfdx_project_utility\sfdx_project_json_service.psm1"

function get_release_asset_json_content_by_package_version_report {
    param($package_version_report, $associated_skip_validation_package_version)

    $release_asset_json_content = @"
{
    "Pipeline_Progression_Workflow_Link" : "N/A",
    "Package_Version_Creation_Workflow_Link" : "N/A",
    "FULLY_Validated_Package_Version" : "$( $package_version_report.result.Version)",
    "Associated_SKIPVALIDATION_Package_Version" : "$($associated_skip_validation_package_version)",
    "SubscriberPackageVersionId" : "$( $package_version_report.result.SubscriberPackageVersionId)",
    "CodeCoverage" : "$( $package_version_report.result.CodeCoverage.apexCodeCoveragePercentage)",
    "Package_Version_Tag" : "$( $package_version_report.result.Tag)",
    "ORGs_Installed_To" : {
        "SIT"  : "Not Installed",
        "INT"  : "Not Installed",
        "REG"  : "Not Installed",
        "PERF" : "Not Installed",
        "PROD" : "Not Installed"
    }

}

"@

    write-host "release asset : $release_asset_json_content"
    $release_asset_json_content
}

function get_feature_flow_release_asset_json_content_by_package_version_report {
    param($package_version_report, $associated_skip_validation_package_version)

    $release_asset_json_content = @"
{
    "Package_Version_Creation_Workflow_Link" : "N/A",
    "FULLY_Validated_Package_Version" : "$( $package_version_report.result.Version)",
    "Associated_SKIPVALIDATION_Package_Version" : "$($associated_skip_validation_package_version)",
    "SubscriberPackageVersionId" : "$( $package_version_report.result.SubscriberPackageVersionId)",
    "CodeCoverage" : "$( $package_version_report.result.CodeCoverage.apexCodeCoveragePercentage)",
    "Package_Version_Tag" : "$( $package_version_report.result.Tag)"
}
"@

    write-host "feature flow release asset : $release_asset_json_content"
    $release_asset_json_content
}

function get_hotfix_release_asset_json_content_by_package_version_report {
    param($package_version_report)

    $hotfix_release_asset_json_content = @"
    {
        "Hotfix_Package_Version_Creation_and_Pipeline_Workflow_Link" : "N/A",
        "FULLY_Validated_Package_Version" : "$( $package_version_report.result.Version)",
        "SubscriberPackageVersionId" : "$( $package_version_report.result.SubscriberPackageVersionId)",
        "CodeCoverage" : "$( $package_version_report.result.CodeCoverage.apexCodeCoveragePercentage)",
        "Package_Version_Tag" : "$( $package_version_report.result.Tag)",
        "ORGs_Installed_To" : {
            "HOTFIX-SANDBOX"  : "Not Installed",
            "PROD"  : "Not Installed"
        }
    
    }
    
"@
    
    write-host "hotfix release asset : $hotfix_release_asset_json_content"
    $hotfix_release_asset_json_content

}

function create_github_release_draft  {
    param(
        $package_version_report_json, 
        $github_tag_name, 
        $associated_skip_validation_package_version, 
        $last_org_installed_to, 
        $github_action_workflow_link
    )
    
    write-host "in create_github_release_draft"
    $release_notes_file_name = "gh_release_notes.txt"
    $release_asset_json_file_name = "gh_release_asset.json"

    $package_version_report = $package_version_report_json | ConvertFrom-Json
    $release_asset_json_content = get_release_asset_json_content_by_package_version_report -package_version_report $package_version_report -associated_skip_validation_package_version $associated_skip_validation_package_version -github_action_workflow_link $github_action_workflow_link
    $release_asset = $release_asset_json_content | ConvertFrom-Json
    $release_asset.Package_Version_Creation_Workflow_Link = $github_action_workflow_link 
    
    $int_update_status = "int_update"
    $is_int_update = ( $last_org_installed_to -eq $int_update_status)
    if ( -not($is_int_update) ) {
        $release_asset = update_github_release_asset_by_org_last_installed_to -release_asset $release_asset -org_installed_to $last_org_installed_to -package_version $associated_skip_validation_package_version
    } else {
        $release_asset.ORGs_Installed_To.SIT = $int_update_status
    }

    $release_notes_file_name = create_formatted_release_notes_file_by_release_asset -release_notes_file $release_notes_file_name -release_asset $release_asset
    $release_asset_json_file_name = create_json_release_notes_asset_file_by_release_asset -release_asset $release_asset -release_asset_json_file_name $release_asset_json_file_name

    $release_title_suffix = ($is_int_update) ? "int_update.draft" `
                                             : "draft"

    gh release create $github_tag_name $release_asset_json_file_name --draft --notes-file $release_notes_file_name --title "$($package_version_report.result.Version).$release_title_suffix"

}

function create_github_prerelease {
    param(
        $github_tag_name,
        $release_asset_file_name,
        $release_notes_file_name,
        $release_title
    )
    
    gh release create $github_tag_name $release_asset_file_name --prerelease `
        --notes-file $release_notes_file_name `
        --title "$release_title"

}

function create_json_release_notes_asset_file_by_release_asset {
    param($release_asset, $release_asset_json_file_name)

    $json_release_notes = $($release_asset | ConvertTo-Json )
    If (Test-Path $release_asset_json_file_name) {
        Remove-Item $release_asset_json_file_name
    }
    New-Item -Path . -Name $release_asset_json_file_name -ItemType "file" -Value $json_release_notes

    Write-Host "release_asset_json_file_name: $release_asset_json_file_name"
}

function create_formatted_release_notes_file_by_release_asset {
    param($release_notes_file, $release_asset)

    Write-Host "create_formatted_release_notes_file_by_release_asset"
    # Prepare release notes by removing JSON characters: " { } ,
    $json_release_notes = $($release_asset | ConvertTo-Json )

    $json_character_removed_release_notes = $json_release_notes -replace '"|{|}|,',''

    #Need to create file with text body to iterate over. The other way to do this would 
    If (Test-Path $release_notes_file) {
        Remove-Item $release_notes_file
    }
    New-Item -Path . -Name $release_notes_file -ItemType "file" -Value $json_character_removed_release_notes

    $release_notes_from_file = Get-Content $release_notes_file

    # the below adds 4 spaces in front of the line being iterated over
    $formatted_release_notes = $release_notes_from_file | foreach {
    
      "    $_"
     
    } 

    Set-Content -Path $release_notes_file -Value $formatted_release_notes

    Write-Host "release_notes_file: $release_notes_file"

}

function update_github_release_by_last_org_installed_to {
    param($github_release_to_update, $last_org_installed_to, $github_action_run_id, $github_repo_url)

    Write-Host "last org installed to: $last_org_installed_to"
    $expected_gh_release_asset_json_file_from_current_release = "gh_release_asset.json" 
    $pipeline_release_asset_json = get_current_pipeline_github_release_asset -release_tag_name $github_release_to_update -expected_gh_release_asset_json_file $expected_gh_release_asset_json_file_from_current_release
    $release_asset = $pipeline_release_asset_json | ConvertFrom-Json
    $updated_github_release_asset = update_github_release_asset_by_org_last_installed_to -release_asset $release_asset `
                                                                                         -org_installed_to $last_org_installed_to `
                                                                                         -package_version $release_asset.FULLY_Validated_Package_Version

    $release_edit_result = $null
    if ($last_org_installed_to -eq "int") {
        Write-Host "int"
        $github_action_workflow_link = generate_action_workflow_link -github_repo_url $github_repo_url -github_action_run_id $github_action_run_id
        Write-Host "Action Workflow Link is $github_action_workflow_link"
        $updated_github_release_asset.Pipeline_Progression_Workflow_Link = $github_action_workflow_link
        $release_edit_result = update_github_release_from_draft_to_prerelease -github_release_tag $github_release_to_update `
                                                                                -release_asset $updated_github_release_asset 
    
    } elseif ($last_org_installed_to -eq "reg" ) {
        Write-Host "reg"

        $reg_release_title = "$github_release_to_update.prerelease.reg"
        $release_edit_result = update_github_release_prerelease_by_title_and_updated_release_asset -github_release_tag $github_release_to_update `
                                                                                                -release_asset $updated_github_release_asset `
                                                                                                -new_release_title $reg_release_title

    } elseif ( $last_org_installed_to -eq "perf" ) {
        Write-Host "perf"
        $perf_release_title = "$github_release_to_update.prerelease.perf"
        $release_edit_result = update_github_release_prerelease_by_title_and_updated_release_asset -github_release_tag $github_release_to_update `
                                                                                                -release_asset $updated_github_release_asset `
                                                                                                -new_release_title $perf_release_title

    } elseif ($last_org_installed_to -eq "prod") {
        Write-Host "prod"
        $published_release_title = "$github_release_to_update.published"

        $release_edit_result = update_github_release_prerelease_to_published -github_release_tag $github_release_to_update `
                                                                                                -release_asset $updated_github_release_asset `
                                                                                                -new_release_title $published_release_title
    } elseif ($last_org_installed_to -eq "hotfix-sandbox") {
        Write-Host "hotfix-sandbox"
        $hotfix_release_title = "$github_release_to_update.prerelease.hotfix-sandbox"

        $release_edit_result = update_github_release_prerelease_by_title_and_updated_release_asset -github_release_tag $github_release_to_update `
                                                                                                    -release_asset $updated_github_release_asset `
                                                                                                    -new_release_title $hotfix_release_title
    }

    Write-Host "release edit result : $release_edit_result"

    $release_edit_result

}

function update_github_release_asset_by_org_last_installed_to {
    param($release_asset, $org_installed_to, $package_version)

    Write-Host "in update_github_release_asset_by_org_last_installed_to "

    $release_asset_json = $release_asset | ConvertTo-Json
    Write-Host "release asset json: $release_asset_json"
    Write-Host "org installed to: $org_installed_to"
    Write-Host "package_version : $package_version"
    Write-Host "release_asset.ORGs_Installed_To :$($release_asset.ORGs_Installed_To)"

    $release_asset.ORGs_Installed_To.$org_installed_to = $package_version

    Write-Host "updated release_asset.ORGs_Installed_To :$($release_asset.ORGs_Installed_To)"

    $release_asset

}

function update_github_release_prerelease_by_title_and_updated_release_asset {
    param($github_release_tag, $release_asset, $new_release_title)

    $release_notes_file_name = "gh_release_notes.txt"
    create_formatted_release_notes_file_by_release_asset -release_notes_file $release_notes_file_name -release_asset $release_asset

    $release_asset_json_file_name = "gh_release_asset.json"
    create_json_release_notes_asset_file_by_release_asset -release_asset $release_asset -release_asset_json_file_name $release_asset_json_file_name

    Write-Host "gh releae edit github_releas_tag : $github_release_tag"
    Write-Host "gh releae edit release_asset_json_file_name : $release_asset_json_file_name"
    Write-Host "gh releae edit release_notes_file_name : $release_notes_file_name"
   
    $release_edit_result = $(gh release edit $github_release_tag --title $new_release_title --notes-file $release_notes_file_name --prerelease)

    $release_upload_result = $(gh release upload $github_release_tag $release_asset_json_file_name --clobber)
    Write-Host "release edit result : $release_edit_result"
    Write-Host "release_upload_result : $release_upload_result"

    $release_edit_result

}

function update_github_release_prerelease_to_published {
    param($github_release_tag, $release_asset, $new_release_title)

    $release_notes_file_name = "gh_release_notes.txt"
    $release_notes_file_name = create_formatted_release_notes_file_by_release_asset -release_notes_file $release_notes_file_name -release_asset $release_asset

    $release_asset_json_file_name = "gh_release_asset.json"
    $release_asset_json_file_name = create_json_release_notes_asset_file_by_release_asset -release_asset $release_asset -release_asset_json_file_name $release_asset_json_file_name

    Write-Host "gh releae edit github_releas_tag : $github_release_tag"
    Write-Host "gh releae edit release_asset_json_file_name : $release_asset_json_file_name"
    Write-Host "gh releae edit release_notes_file_name : $release_notes_file_name"
   
    $release_edit_result = $(gh release edit $github_release_tag --title $new_release_title --notes-file $release_notes_file_name --prerelease=false)

    $release_upload_result = $(gh release upload $github_release_tag $release_asset_json_file_name --clobber)
    Write-Host "release edit result : $release_edit_result"
    Write-Host "release_upload_result : $release_upload_result"

    $release_edit_result

}
function update_github_release_from_draft_to_prerelease {
    param($github_release_tag, $release_asset) 

    $release_notes_file_name = "gh_release_notes.txt"
    create_formatted_release_notes_file_by_release_asset -release_notes_file $release_notes_file_name -release_asset $release_asset

    $release_asset_json_file_name = "gh_release_asset.json"
    create_json_release_notes_asset_file_by_release_asset -release_asset $release_asset -release_asset_json_file_name $release_asset_json_file_name

    Write-Host "gh releae edit github_releas_tag : $github_release_tag"
    Write-Host "gh releae edit release_asset_json_file_name : $release_asset_json_file_name"
    Write-Host "gh releae edit release_notes_file_name : $release_notes_file_name"
   
    $release_edit_result = $(gh release edit $github_release_tag --title "$github_release_tag.prerelease" --notes-file $release_notes_file_name --draft=false --prerelease)
    $release_upload_result = $(gh release upload $github_release_tag $release_asset_json_file_name --clobber)
    Write-Host "release edit result : $release_edit_result"
    Write-Host "release_upload_result : $release_upload_result"

    $release_edit_result

}

function get_current_pipeline_github_release_asset {
    param($release_tag_name, $expected_gh_release_asset_json_file)

    gh release download $release_tag_name --pattern $expected_gh_release_asset_json_file | Out-Null
    $release_asset_json = Get-Content $expected_gh_release_asset_json_file
    Write-Host "release asset json : $release_asset_json"
    $release_asset_json

}

function delete_github_release_by_id {
    param($github_release_id, $github_organization_and_repository) 

    $delete_result_json =  $(gh api --method DELETE -H "Accept: application/vnd.github+json" `
         /repos/$github_organization_and_repository/releases/$github_release_id)
    
    Write-Host "delete result $delete_result_json"
    $delete_result = $delete_result_json | ConvertFrom-Json

    $github_release_not_found_message = "Not Found"
    if ( $delete_result -ne $null -and $delete_result.message -eq $github_release_not_found_message ) {
        Write-Host "DELETE Failed for $github_release_id"
    }

}

function generate_action_workflow_link {
    param(
        [Parameter(Mandatory=$true)]
        $github_repo_url, 
        [Parameter(Mandatory=$true)]
        $github_action_run_id)

    $github_action_workflow_link = "$github_repo_url/actions/runs/$github_action_run_id"
    $github_action_workflow_link

}

function create_github_release_build_artifact_by_package_version  {
    param(
        $package_version_report_json, 
        $github_tag_name, 
        $associated_skip_validation_package_version,
        $github_action_workflow_link
    )
    
    $release_notes_file_name = "gh_release_notes.txt"
    $release_asset_json_file_name = "gh_release_asset.json"

    $package_version_report = $package_version_report_json | ConvertFrom-Json
    $release_asset_json_content = get_feature_flow_release_asset_json_content_by_package_version_report -package_version_report $package_version_report -associated_skip_validation_package_version $associated_skip_validation_package_version -github_action_workflow_link $github_action_workflow_link
    $release_asset = $release_asset_json_content | ConvertFrom-Json
    $release_asset.Package_Version_Creation_Workflow_Link = $github_action_workflow_link 
    
    $release_notes_file_name = create_formatted_release_notes_file_by_release_asset -release_notes_file $release_notes_file_name -release_asset $release_asset
    $release_asset_json_file_name = create_json_release_notes_asset_file_by_release_asset -release_asset $release_asset -release_asset_json_file_name $release_asset_json_file_name

    $github_release_creation_result = $( gh release create $github_tag_name $release_asset_json_file_name --notes-file $release_notes_file_name --title "$github_tag_name")

    ### IN A SUCCESSFUL GITHUB RELEASE RESULT,
    ### A URL WILL BE RETURNED WITH THE LAST URL SEGMENT
    ### CONTAINING THE TAG NAME OF THE RELEASE
    $last_url_segment_of_creation_result = Split-Path $github_release_creation_result -Leaf
    
    if ( $null -eq $github_release_creation_result -or $last_url_segment_of_creation_result -ne $github_tag_name) {
        Write-Host -ForegroundColor Red -BackgroundColor White "gh release create $github_tag_name $release_asset_json_file_name --notes-file $release_notes_file_name --title '$github_tag_name'"
        Throw "THE GITHUB RELEASE DID NOT CREATE SUCCESSFULLY"
    } else {
        Write-Host -ForegroundColor Green "GITHUB RELEASE CREATION SUCCESSFUL: $github_release_creation_result"
    }


}

function build_new_release_branch_name_by_provided_date {
    param(
        [Parameter(mandatory=$true)]
        $updated_version_number,
        $expected_release_branch_date
    )

    if ($null -ne $expected_release_branch_date) {
        $expected_release_branch_name = "release_$($updated_version_number)_$expected_release_branch_date"
    } else {
        $expected_release_branch_name = "release_$updated_version_number"
    }

    $expected_release_branch_name

}

function get_github_cli_releases_by_limit {
    param(
        $github_organization_and_repository, 
        $limit = 100
    )

    $github_host = "github.com"
    $github_repository = "$github_host/$github_organization_and_repository"

    $github_releases = gh release list --limit $limit --exclude-pre-releases --repo "$github_repository"
    
    $github_releases

}

function get_drafts_from_github_releases {
    param ( [Github_Release[]]$github_releases )

    $draft_state = "Draft"
    $draft_releases = $github_releases | Where-Object {$_.State -eq $draft_state}   

    $draft_releases

}

function get_associated_release_drafts_by_matching_version_number {
    param (
        [Parameter(mandatory=$true)]
        $github_release_drafts,
        [Parameter(mandatory=$true)]
        $version_number
    )
    
    ## if matching_draft_releases count is greater than 1, get latest draft release by getting the "topmost" first result and deleting the rest:

    # v0.946.498.5.prerelease.perf        Draft   v0.946.498.5    2023-03-02T20:38:47Z  <-- is our draft we want
    # v0.946.498.3.published              Draft   v0.946.498.3    2023-03-02T20:07:13Z  <-- delete if matching major.minor.patch version number
    # v0.946.498.1.published              Draft   v0.946.498.1    2023-03-02T14:48:45Z  <-- delete if matching major.minor.patch version number

    $matching_version_number_releases = $github_release_drafts | Where-Object { $_.Associated_Tag_Name -match $version_number }

    $matching_version_number_releases

}

function get_latest_github_release_draft {
    param ( 
        [Parameter(mandatory=$true)]    
        $github_release_drafts
    )

    $latest_github_release_draft = $github_release_drafts | Sort-Object -Property "Created_At"
                                                          | Select-Object -Last 1

    $latest_github_release_draft

}

function get_tag_from_github_release {
    param ( 
        [Parameter(mandatory=$true)]    
        $github_release 
    )

    $associated_tag = $github_release.Associated_Tag_Name

    $associated_tag

}

function convert_github_release_strings_to_github_release_objects {
param ( 
    [Parameter(mandatory=$true)]    
    $latest_github_cli_releases
)

    $release_title_index = 0
    $github_release_state_index = 1
    $tag_name_index = 2
    $created_at_index = 3

    $github_releases = [system.collections.generic.list[Github_Release]]::new()

    foreach ( $github_cli_release in $latest_github_cli_releases ) {

        $split_github_release = $github_cli_release.split()

        $github_release = [Github_Release]::new()
        $github_release.Title = $split_github_release[$release_title_index]
        $github_release.State = $split_github_release[$github_release_state_index]
        $github_release.Associated_Tag_Name = $split_github_release[$tag_name_index]
        $github_release.Created_At = $split_github_release[$created_at_index]
        
        $github_releases.add($github_release) | Out-Null
    }

    $github_releases

}

class Github_Release {
    [string]$Title
    [string]$State
    [string]$Associated_Tag_Name
    [datetime]$Created_At
}


function get_github_release_by_tag_name {
    param(
        [Parameter(Mandatory=$true)]
        $github_organization_and_repository,
        [Parameter(Mandatory=$true)]
        $tag_name
    )

    $all_github_releases_by_repo_json = $(gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" /repos/$github_organization_and_repository/releases/tags/$tag_name)
    $all_github_releases_by_repo_json
    
}

function get_all_github_releases_by_repo_and_organization_owner {
    param($github_organization_and_repository)

    $max_results_per_page = 100  
    $results_by_page = $null  
    $all_github_releases = @()  
    $page = 1
    while ( ( $page -eq 1 ) -or ( $page -gt 1 -and $results_by_page -eq $max_results_per_page )) { 
        
        $github_releases_by_repo_json = $(gh api -H "Accept: application/vnd.github+json" "/repos/$github_organization_and_repository/releases?per_page=$max_results_per_page&page=$page")    
        $github_releases = $github_releases_by_repo_json | ConvertFrom-Json -Depth 10
        if ( $github_releases.count -gt 0 ) {
            $all_github_releases = ($all_github_releases + $github_releases)
        }

        $results_by_page = $github_releases.Count    
        $page++   

    }

    $all_github_releases
}




function does_branch_exist_in_origin {
    param (
        $branch_name
    )

   $branch_exists = git branch -r --list "origin/$branch_name"

   if ( $null -eq $branch_exists ) {

        Write-Host "$branch_name does not exist in remote"

   }

   $does_branch_exist = [bool]$branch_exists
   $does_branch_exist
 
}




