function get_all_github_repository_secrets {
    param($github_organization, $github_token, $github_repository_name)

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.json"
    }


    $all_github_secrets = @{
        "action_secrets" = [System.Collections.ArrayList]@()
        "secrets_by_environment" = @{}
    };

    $github_repository_url = "https://api.github.com/repos/$github_organization/$github_repository_name"
    $github_repository = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_repository_url -ContentType "application/json")
    $github_repo_id = $github_repository.id

    if ( !([string]::IsNullOrEmpty($github_repo_id)) ) {
        
        $expected_github_environments = @{
            "sit" = [System.Collections.ArrayList]@()
            "int" = [System.Collections.ArrayList]@()
            "reg" = [System.Collections.ArrayList]@()
            "perf" = [System.Collections.ArrayList]@()        
            "prod" = [System.Collections.ArrayList]@()
        }
    
        $all_github_secrets.action_secrets = get_github_action_secrets_by_repo -github_repository_name $github_repository_name -github_token $github_token -github_organization $github_organization
        $all_github_secrets.secrets_by_environment = get_github_environment_secrets_map_by_repo -expected_github_environments $expected_github_environments -github_repo_id $github_repo_id -github_token $github_token 
  
    } else {

        Write-Host "Could not get repository Id for $github_repository_name"

    }

    $all_github_secrets

}

function get_github_action_secrets_by_repo {
    param($github_repository_name, $github_organization, $github_token)

    $headers = @{
        "authorization" = "Bearer $github_token"
        "Accept" = "application/vnd.github.json"
    }

    $github_actions_secrets_url = "https://api.github.com/repos/$github_organization/$github_repository_name/actions/secrets"
    $github_actions_secrets = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_actions_secrets_url -ContentType "application/json")
    
    $github_secrets = [System.Collections.ArrayList]@()

    if ( $github_actions_secrets -eq $null -or $github_actions_secrets.secrets.count -eq 0) {

        $github_secrets = $null

    } else {

        foreach ($gha_secret in $github_actions_secrets.secrets) {

            $github_secrets.Add($gha_secret.name) | Out-Null

        }
    
    }
   
    $github_secrets

}

function get_github_environment_secrets_map_by_repo {
    param($expected_github_environments, $github_repo_id )

    $secrets_by_environment = @{}

    foreach ($github_environment in $expected_github_environments.Keys) {

        $github_secrets_by_environment = get_github_environment_secrets_by_repo_id_and_environment -repo_id $github_repo_id -github_environment $github_environment
        $secrets_by_environment.Add($github_environment, $github_secrets_by_environment) | Out-Null

    }

    $secrets_by_environment
}


function get_github_environment_secrets_by_repo_id_and_environment {
    param($repo_id, $github_environment)

    $github_environment_secrets_url = "https://api.github.com/repositories/$github_repo_id/environments/$github_environment/secrets"
    
    $github_environment_secrets = $(Invoke-RestMethod -Method GET -Headers $headers -Uri $github_environment_secrets_url -ContentType "application/json")

    $environment_secrets = [System.Collections.ArrayList]@()

    if ( $github_environment_secrets -eq $null -or $github_environment_secrets.secrets -eq 0) {

        $environment_secrets = $null

    } else {

        foreach ($github_env_secret in $github_environment_secrets.secrets) {

            $environment_secrets.Add($github_env_secret.name) | Out-Null   

        }
    }
   
    $environment_secrets

}

function get_expected_listed_github_action_secrets {

    $expected_github_secrets_from_env_file = [System.Collections.ArrayList](Get-Content .\config\.env)
    $expected_github_secrets_from_config_env =  parse_environment_secrets_for_secret_name -environment_secrets_from_env_file $expected_github_secrets_from_env_file

    $expected_github_secrets_from_config_env

}

function parse_environment_secrets_for_secret_name {
    param($environment_secrets_from_env_file)

    $parsed_environment_secrets_from_env_file = $environment_secrets_from_env_file | foreach {
        $_ = ($_ -split "=")[0]
        $_
    } 

    $parsed_environment_secrets_from_env_file

}

function get_expected_listed_github_environment_to_github_environment_secrets {

    $sit_environment_secrets_from_env_file = [System.Collections.ArrayList](Get-Content .\config\.env-sit)
    $sit_secrets_from_env_file = parse_environment_secrets_for_secret_name -environment_secrets_from_env_file $sit_environment_secrets_from_env_file

    $int_environment_secrets_from_env_file = [System.Collections.ArrayList](Get-Content .\config\.env-int)
    $int_secrets_from_env_file = parse_environment_secrets_for_secret_name -environment_secrets_from_env_file $int_environment_secrets_from_env_file

    $reg_environment_secrets_from_env_file = [System.Collections.ArrayList](Get-Content .\config\.env-reg)
    $reg_secrets_from_env_file = parse_environment_secrets_for_secret_name -environment_secrets_from_env_file $reg_environment_secrets_from_env_file

    $perf_environment_secrets_from_env_file = [System.Collections.ArrayList](Get-Content .\config\.env-perf)
    $perf_secrets_from_env_file = parse_environment_secrets_for_secret_name -environment_secrets_from_env_file $perf_environment_secrets_from_env_file

    $prod_environment_secrets_from_env_file = [System.Collections.ArrayList](Get-Content .\config\.env-prod)
    $prod_secrets_from_env_file = parse_environment_secrets_for_secret_name -environment_secrets_from_env_file $prod_environment_secrets_from_env_file

    $expected_github_environment_to_github_environment_secrets = @{
        "sit" = $sit_secrets_from_env_file;
        "int" = $int_secrets_from_env_file;
        "reg" = $reg_secrets_from_env_file;
        "perf" = $perf_secrets_from_env_file;
        "prod" = $prod_secrets_from_env_file;
    }

    $expected_github_environment_to_github_environment_secrets

}



