
Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\sfdx_project_utility\sfdx_project_json_service.psm1"

$sfdx_project_json_path = "sfdx-project.json"
$sfdxprojectjson_content = Get-Content $sfdx_project_json_path

$status = 0
try {

    $version_number = get_package_version_number_by_sfdx_project_json_file_content -sfdxprojectjson_content $sfdxprojectjson_content
    #THIS IS GOING TO SET VERSION NUMBER AS AN AVAILABLE ENV VARIABLE IN THE GITHUB ACTIONS WORKFLOW
    "version_number=$version_number" >> $env:GITHUB_OUTPUT
         
}
catch {
   
    Write-Host "Exception : $($_.Exception.ToString())"
    Write-Host "ERROR LOG: $_"
    Write-Host "ERROR DETAILS: $($_.ErrorDetails)"
    Write-Host "ERROR DETAILS MESSAGE $($_.ErrorDetails.Message)"
    $status = 1
}

exit $status