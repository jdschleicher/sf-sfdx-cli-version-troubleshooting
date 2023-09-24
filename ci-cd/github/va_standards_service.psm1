
function create_release_associated_artifacts {
    param ( 
        $expected_release_branch_name,
        $deployment_plan_path
    )

    if (-Not (Test-Path $deployment_plan_path)) {
        New-Item -ItemType Directory -Name "$deployment_plan_path"
    }

    New-Item -ItemType Directory -Name "$deployment_plan_path/$expected_release_branch_name"
    New-Item -ItemType Directory -Name "$deployment_plan_path/$expected_release_branch_name/post_install_scripts"
    New-Item -ItemType Directory -Name "$deployment_plan_path/$expected_release_branch_name/pre_install_scripts"

    New-Item -ItemType File -Name "$deployment_plan_path/$expected_release_branch_name/deployment_plan.md"  
    New-Item -ItemType File -Name "$deployment_plan_path/$expected_release_branch_name/post_install_scripts/post_install_scripts_plan.md"    
    New-Item -ItemType File -Name "$deployment_plan_path/$expected_release_branch_name/pre_install_scripts/pre_install_scripts_plan.md"    

}