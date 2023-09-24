function get_dtc_dx_release_github_team_slug {
    $dtc_release_admin_github_team_slug = "dtc-dx-salesforce-release-admins"
    $dtc_release_admin_github_team_slug
}

function save_github_team_to_github_repository_by_permission {
    param($github_organization, $github_team_name_slug, $github_repository_name, $github_team_permission)

$json_result = gh api --method PUT -H "Accept: application/vnd.github+json" `
                                        -H "X-GitHub-Api-Version: 2022-11-28" `
                                        /orgs/$github_organization/teams/$github_team_name_slug/repos/$github_organization/$github_repository_name `
                                        -f permission=$github_team_permission 

Write-Host $json_result

$json_result

}

function get_github_team_id_by_team_slug {
    param($github_organization, $github_token, $github_team_slug)

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.json"
    }

    $github_url = "https://api.github.com/orgs/$github_organization/teams/$github_team_slug"

    try {
        $github_team_detail = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_url -ContentType "application/json")
        $github_team_id = $github_team_detail.id
        $github_team_id
    } catch {
        Write-Host "FAILED FUNCTION: get_github_team_id_by_team_slug"
        Write-Host "StatusDescription: $($_.Exception.ToString())"
        Write-Host "Exception Message: $($_.Exception.ToString())"
        return 1
    }

}

function get_node_id_og_github_team_by_team_slug {
    param($github_organization, $github_token, $github_team_slug)

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.json"
    }

    $github_url = "https://api.github.com/orgs/$github_organization/teams/$github_team_slug"

    try {
        $github_team_detail = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_url -ContentType "application/json")
        $github_team_node_id = $github_team_detail.node_id
        $github_team_node_id
    } catch {
        Write-Host "FAILED FUNCTION: get_github_team_id_by_team_slug"
        Write-Host "StatusDescription: $($_.Exception.ToString())"
        Write-Host "Exception Message: $($_.Exception.ToString())"
        return 1
    }

}

function add_github_user_to_github_team {
    param(
        $github_organization,
        $github_token,
        $github_team_name_slug,
        $github_user_name
     )

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.v3+json"
    }

    $body = @{
        "role" = "member"
    }
    $json_body = $body | ConvertTo-Json

    $github_url = "https://api.github.com/orgs/$github_organization/teams/$github_team_name_slug/memberships/$github_user_name"
    
    try {
        ### INVOKE RESTMETHOD BELOW DOES NOT RETURN ANY UPDATES SO WRITE HOST USED TO CAPTURE CALLOUT URL
        Write-Host $github_url
        $token_length = $github_token.length
        Write-Host "This is the length of the token: $token_length"
        $cicd_bot_exists = -not([string]::IsNullOrEmpty($github_token))
        Write-Host "Cicd bot exists: $cicd_bot_exists"
    
        Invoke-RestMethod -URI $github_url `
                            -ContentType "application/json" `
                            -Method PUT `
                            -Body $json_body `
                            -Headers $headers
            
    } catch {

        $user_not_found_error = "Not Found"

        if ($null -ne $_.ErrorDetails -and
            $null -ne $_.ErrorDetails.Message) {
        
            if ($_.ErrorDetails.Message -like $user_not_found_error) {

                Write-Error "USER NOT FOUND - USERNAME MAY NOT EXIST OR MAY NOT BE IN THE VA ORGANIZATION"

            }

            Write-Error "ERROR ADDING USERNAME $github_user_name TO TEAM: $($_.ErrorDetails.Message)"
            
        }
 
         Throw "ERROR ADDING USERNAME $github_user_name TO TEAM: $($_.ErrorDetails.Message)"

        
    }

} 

function create_github_team {
    param(
        $team_name,
        $team_description,
        $permission_type,
        $notification_settings,
        $privacy_type,
        $github_organization
    )
    
   $creation_result_json = gh api --method POST -H "Accept: application/vnd.github+json" `
                                                -H "X-GitHub-Api-Version: 2022-11-28" `
                                                /orgs/$github_organization/teams `
                                                -f name=$team_name `
                                                -f description=$team_description `
                                                -f permission=$permission_type `
                                                -f notification_settings=$notification_settings `
                                                -f privacy=$privacy_type
    
    Write-Host $creation_result_json
    
}