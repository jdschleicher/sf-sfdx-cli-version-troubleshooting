
function get_package_version_number_by_sfdx_project_json_file_content {
    param( 
        [Parameter(Mandatory=$true)]
        $sfdxprojectjson_content 
    )

    $sfdxproject_detail = $sfdxprojectjson_content | ConvertFrom-Json
     
    $default_project_detail = $sfdxproject_detail.packageDirectories | Where { $_.default -eq $true} 
    $current_package_version_number_with_NEXT_keyword = $default_project_detail.versionNumber

    $version_number = [string]$current_package_version_number_with_NEXT_keyword.split(".NEXT")
    $version_number = $version_number.Trim()

    $version_number 

}

function get_path_of_default_package_code_base_by_sfdx_project_json_file_content {
    param( 
        [Parameter(Mandatory=$true)]
        $sfdxprojectjson_content 
    )

    $sfdxproject_detail = $sfdxprojectjson_content | ConvertFrom-Json
     
    $default_project_detail = $sfdxproject_detail.packageDirectories | Where { $_.default -eq $true} 
    $default_path_for_package = $default_project_detail.path

    $default_path_for_package

}

function update_sfdx_project_json_version_number {
    param( $sfdx_project_json_path, $version_number )

    if ( !(Test-Path $sfdx_project_json_path) ) {
        
        throw "sfdx-project.json doesn't exist"

    }  else {
        $sfdxprojectjson_content = Get-Content $sfdx_project_json_path
        $sfdxproject_detail = $sfdxprojectjson_content | ConvertFrom-Json
        $default_project_detail = $sfdxproject_detail.packageDirectories | Where { $_.default -eq $true} 
     
        $default_project_detail.versionNumber = "$version_number.NEXT"

        $updated_sfdxprojectdetail_json = $sfdxproject_detail | ConvertTo-Json -Depth 8
        Set-Content -Path $sfdx_project_json_path -Value $updated_sfdxprojectdetail_json

    }
}

function increment_sfdx_project_json_version_number_by_update_type {
    param (
        $version_number,
        $update_type
    )

    $version_number_split = $version_number.Split(".")
    Write-Host "HERE IS `$version_number_split: $version_number_split "

    $major_version_number = [int]($version_number_split[0])
    $minor_version_number = [int]($version_number_split[1])
    $patch_number = [int]($version_number_split[2])

    $major_update_type = "major"
    $minor_update_type = "minor"
    $patch_update_type = "patch"
   
    if ( $update_type.toLower() -eq $major_update_type ) {

        $major_version_number++
        $minor_version_number = 0
        $patch_number = 0
        
    }
    elseif ( $update_type.toLower() -eq $minor_update_type ) {
      
        $minor_version_number++
        $patch_number = 0

    } elseif ( $update_type.toLower() -eq $patch_update_type ) {

        $patch_number++
       
    }
    

    $updated_version_number = "$major_version_number.$minor_version_number.$patch_number"

    $updated_version_number

}


