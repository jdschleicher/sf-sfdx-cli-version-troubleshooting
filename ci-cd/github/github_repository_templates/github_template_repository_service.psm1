
function create_github_repo_from_template {
    param(
        $github_organization,
        $new_repository_name,
        $github_template_name,
        $product_description
    )

    echo "gh repo create '$github_organization/$new_repository_name' `
                    --description '$product_description' `
                    --template '$github_organization/$github_template_name' `
                    --internal"

    $gh_repo_create_result = $(gh repo create "$github_organization/$new_repository_name" `
                                                        --description "$product_description" `
                                                        --template "$github_organization/$github_template_name" `
                                                        --internal )

    $gh_repo_create_result

}