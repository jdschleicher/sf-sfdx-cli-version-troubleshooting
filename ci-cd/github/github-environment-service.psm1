
function get_branch_name_by_github_json {
    param($github_json)

    $github_object = get_github_object_by_json($github_json)
    $branch_name = $github_object.head_ref
    $branch_name
    
}

function get_repository_name_by_github_json {
    param($github_json) 

    $github_object = get_github_object_by_json($github_json)
    $repository_name = $github_object.event.repository.name 
    $repository_name

}

function get_repository_workflow_by_github_json {
    param($github_json) 

    $github_object = get_github_object_by_json($github_json)
    $workflow_name = $github_object.workflow
    $workflow_name

}
function get_github_username_by_github_json {
    param($github_json) 

    $github_object = get_github_object_by_json($github_json)
    $github_username = $github_object.actor
    $github_username

}

function get_job_name_by_github_json {
    param($github_json) 

    $github_object = get_github_object_by_json($github_json)
    $job_name = $github_object.job
    $job_name

}

function get_workflow_github_organization_by_github_json {
    param($github_json)
    
    $github_object = get_github_object_by_json($github_json)
    $github_organization = $github_object.event.organization.login
    $github_organization

}

function get_github_object_by_json {
    param($github_json)

    if ($github_object -eq $null) {
        $github_object = $github_json | ConvertFrom-Json -Depth 8
    }

    Write-Host $github_object

    $github_object

}

