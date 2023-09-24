
function validate_only_deploy_by_target_org_and_path {
    param( 
        $validate_only_target_org, 
        $path_with_metadata_to_validate
    )

    Write-Host "sfdx force:source:deploy --targetusername $validate_only_target_org --sourcepath "$path_with_metadata_to_validate" --checkonly --json"
    $validate_only_deploy_result_json = $( sfdx force:source:deploy --targetusername $validate_only_target_org --sourcepath "$path_with_metadata_to_validate" --checkonly --json )
    Write-Host "validate deploy result:"
    Write-Host $validate_only_deploy_result_json
    $validate_only_deploy_result = $validate_only_deploy_result_json | ConvertFrom-Json

    $validate_only_deploy_result

}

function is_validate_only_deployment_success {
    param ( $validate_only_deployment_result )

    $validate_only_success_result = ( $validate_only_deployment_result.status -eq 0 -and $validate_only_deployment_result.result.success)  
    $validate_only_success_result   
    
}