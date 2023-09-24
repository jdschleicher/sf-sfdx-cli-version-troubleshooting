
function create_git_tag {
    param($GH_TAG)
    ## WITHOUT THIS CONFIG SET UP, WILL NOT BE ABLE TO CREATE A GIT TAG OR COMMIT
    git config user.email "dtcsalesforcedevops@va.gov"
    git config user.name "dtcsalesforcedevops"
    ### USE GIT FETCH UNSHALLOW TO ENSURE SHALLOW CLONE CAN NOW CREATE TAGS
    git fetch --unshallow origin
    Write-Host "before git tag creation"
    $git_tag_creation_local = $(git tag -a $GH_TAG -m "package version $GH_TAG")
    Write-Host "git tag creation local results:"
    Write-Host $git_tag_creation_local
    $git_tag_push_origin = $(git push origin $GH_TAG)
    Write-Host "git_tag_push_origin results:"
    Write-Host $git_tag_push_origin
}

function create_pull_request {
    param ( 
        $pull_request_title, 
        $pull_request_body, 
        $head_branch, 
        $base_branch
    )

    Write-Host "base branch : $base_branch"
    Write-Host "head_banch : $head_branch"

    $created_pr_link = $(gh pr create --base "$base_branch" --head "$head_branch" --title "$pull_request_title" --body "$pull_request_body" )

    $created_pr_link

}

function merge_pull_request {
    param($created_pr_link)

    Write-Host "pr link : $created_pr_link "
    $pr_merge_result = $( gh pr merge $created_pr_link --delete-branch --admin --merge )

}




