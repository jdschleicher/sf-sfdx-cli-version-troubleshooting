function add_administrative_github_review_team_by_environment {
    param($github_organization, $github_token, $github_repository_name, $github_environment, $github_team_id)

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.json"
    }

    $environment_body = @{
        reviewers = @(
            @{
                type = "Team"
                id = $github_team_id
            }
        )
        deployment_branch_policy = @{
            "protected_branches" = $true
            "custom_branch_policies" = $false
        }
    };

    $github_url = "https://api.github.com/repos/$github_organization/$github_repository_name/environments/$github_environment"
    $json_body = ConvertTo-Json -Depth 8 -Compress -InputObject $environment_body
    
    try {
        $environment_put_callout_return = $(Invoke-RestMethod -Method PUT -Body $json_body -Headers $headers -Uri $github_url -ContentType "application/json")
        $environment_put_callout_return
    } catch {
        Write-Host "Exception Failure Caught on Function: add_administrative_github_review_team_by_environment"
        Write-Host "StatusDescription:$($_.Exception.ToString())"
        $_.Exception
        return 1
    }

}

function approve_environment_review_by_repository_and_github_run_id {
    param($github_organization, $github_token, $github_repository_name, $github_environment_id, $github_run_id)

    $headers = @{
        "Authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github+json"
    }

    ### CANNOT USE OBJECT CONVERT TO JSON AS DOUBLE QUOTES ARE ADDED TO ENVIRONMENT ID ENTRIES THAT BREAKS THE GITHUB CALLOUT LEADING TO 422 ERROR
    $environment_approval_post_body = @"
    { 
        "environment_ids":[$github_environment_id],
        "state":"approved",
        "comment":"Ship it!"
    }
"@

    $github_url = "https://api.github.com/repos/$github_organization/$github_repository_name/actions/runs/$github_run_id/pending_deployments"
    
    $status_result = 0
    try {
        $approve_environment_callout_return = $(Invoke-RestMethod -Method POST -Body $environment_approval_post_body -Headers $headers -Uri $github_url -ContentType "application/json")
        Write-Host "approve environment callout success response: $approve_environment_callout_return"
    } catch {
        Write-Host "Exception Failure Caught on Function: approve_environment_review_by_repository_and_github_run_id"  | Out-Null
        Write-Host "StatusDescription:$($_.Exception.ToString())" | Out-Null
        Write-Host $_.Exception  | Out-Null
        $status_result = 1
    }

    Write-Host "status result in method = $status_result"
    $status_result

}

function get_github_environment_id_by_name_and_github_repository {
    param($github_organization, $github_token, $github_repository_name, $github_environment )

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.json"
    }

    $github_url = "https://api.github.com/repos/$github_organization/$github_repository_name/environments/$github_environment"
    
    try {
        $get_environment_callout_return = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_url )
        $get_environment_callout_return.id
    } catch {
        Write-Host "Exception Failure Caught on Function: get_github_environment_id_by_name_and_github_repository"
        Write-Host "StatusDescription:$($_.Exception.ToString())"
        $_.Exception
        return 1 
    }

}