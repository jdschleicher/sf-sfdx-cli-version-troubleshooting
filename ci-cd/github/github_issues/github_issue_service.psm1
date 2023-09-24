

function get_user_email_for_adding_github_user_to_team_template {
    param (
        $github_issue_string
    )
    $email_substring_start_index = $github_issue_string.IndexOf("User Email") + 10
    $email_substring_end_index = $github_issue_string.IndexOf("GitHub Username") - 20

    $email_substring = $github_issue_string.Substring($email_substring_start_index, $email_substring_end_index)
    $email_substring = $email_substring.Trim()

    $email_substring

}

function get_username_for_adding_github_user_to_team_template {
    param (
        $github_issue_string
    )

    $username_substring_index = $github_issue_string.IndexOf("GitHub Username") + 14
    $username_substring = $github_issue_string.Substring($username_substring_index+1)
    $username_substring = $username_substring.Trim()

    $username_substring

}

function get_expected_release_date_from_issue_body {
    param (
        $github_issue_string
    )

    $returned_date_substring = $null
    if ( $github_issue_string -like "*_No response_*" ) {

        $returned_date_substring = $null

    } else {

        $date_substring_index = $github_issue_string.IndexOf("Release Branch Date (Optional)") + 29

        $date_substring = $github_issue_string.Substring($date_substring_index+1)
        
        $date_substring = $date_substring.Trim()

        $returned_date_substring = $date_substring

    }
        
    $returned_date_substring

}

function add_github_issue_comment {
    param(
        $github_organization_and_repository,
        $github_issue_number,
        $github_token,
        $request_body
    )

    $github_organization = $github_organization_and_repository.Split("/")[0]
    $github_repository = $github_organization_and_repository.Split("/")[1]
    
    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.v3+json"
    }

    $body = @{
        "body" = $request_body
    }
    $json_body = $body | ConvertTo-Json


    $gh_issue_comment_endpoint = "https://api.github.com/repos/$github_organization/$github_repository/issues/$github_issue_number/comments"
    Write-Host "GITHUB gh_issue_comment_endpoint: $gh_issue_comment_endpoint"
    
    Invoke-RestMethod -URI $gh_issue_comment_endpoint `
                        -ContentType "application/json" `
                        -Method POST `
                        -Body $json_body `
                        -Headers $headers

}

function update_github_issue_status {
    param(
        $github_organization_and_repository,
        $github_issue_number,
        $github_token,
        $issue_status
     )

    $github_organization = $github_organization_and_repository.Split("/")[0]
    $github_repository = $github_organization_and_repository.Split("/")[1]

    
    $headers = @{
        'Accept' = 'application/vnd.github.v3+json'
        'authorization' = "Bearer $github_token"
    }
    
    $post_body = @{
        "state" = $issue_status
    }
    
    $post_body_json = $post_body | ConvertTo-Json
    
    $url = "https://api.github.com/repos/$github_organization/$github_repository/issues/$github_issue_number"
    Invoke-WebRequest -Method Patch -Uri $url -Headers $headers -Body $post_body_json
    
}

function parse_github_issue_body_to_map {
    param(
        [Parameter(Mandatory=$true)]
        $github_issue_body
    )

    Write-Host "in the method : $github_issue_body :: $($github_issue_body.gettype())"
    
    $lines = $github_issue_body.Split("`n") | Where-Object { -not([string]::IsNullOrWhiteSpace($_)) }

    $input_field_to_value_map = @{}

    for ($i = 0; $i -lt $lines.Count; $i++) {

        $input_value = $null
        Write-Host $lines[$i]
        if ( $lines[$i] -match "###" ) {

            Write-Host "match $($lines[$i])"
            $input_field_split = $lines[$i].split("###")
            ### SPLIT RETURNS OUR FIELD AND AN EMPTY LINE. EMPTY LINE IS FIRST INDEX[0] SO WE WANT SECOND INDEX[1]
            ### TRIM AND THEN REPLACE SPACES WITH UNDERSCORES
            $input_field = $input_field_split[1].trim().replace(" ", "_")
            $all_special_characters_regex_capture = "[\W]" 
            $input_field = $input_field -replace $all_special_characters_regex_capture, ""
            Write-Host "input $input_field"
            
            $value_index = $i + 1
            $is_true_checkbox = "- [X]"
            $is_false_checkbox = "- [ ]"
            if ( $lines[$value_index].indexOf($is_true_checkbox) -ne -1 ) {

                $input_value = $true

            } elseif ( $lines[$value_index].indexOf($is_false_checkbox) -ne -1 ) {

                $input_value = $false

            }

            if ( $null -eq $input_value ) {
                $input_value = $lines[$value_index].Trim()
            }

            Write-Host "value: $input_value"

            $input_field_to_value_map.Add($input_field, $input_value) | Out-Null
        }
    
    
    }

    $input_field_to_value_map


}





