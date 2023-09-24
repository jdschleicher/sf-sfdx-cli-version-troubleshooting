function delete_github_team_approval_by_environment {
    param ($github_organization_and_repository, $github_token, $environment_key, $environment_configuration)

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.v3+json"
    }

    $json = ConvertTo-Json -Depth 8 -Compress -InputObject $environment_configuration
	$github_url = "https://api.github.com/repos/$github_organization_and_repository/environments/$environment_key"
	Invoke-RestMethod -Method PUT -Headers $headers -Body $json -Uri $github_url -ContentType "application/json"

}
