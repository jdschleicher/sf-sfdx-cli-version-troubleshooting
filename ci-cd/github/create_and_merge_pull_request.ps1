
param (
    $pull_request_title, 
    $pull_request_body, 
    $head_branch,
    $base_branch
)

Import-Module -DisableNameChecking -Force "$PSScriptRoot/../github/github_git_service.psm1"

### IN ORDER TO AVOID GIT ERRORS SETTING GIT CONFIGURATION TO ENSURE AN "ACTOR" IS REFERENCED IN CREATING PULL REQUEST 
### THIS EMAIL AND NAME COMBINATION CAN BE FAKE AND DOES NOT HAVE TO BE THE CICD_BOT
git config user.email "dtcsalesforcedevops@va.gov" | Out-Null
git config user.name "dtcsalesforcedevops" | Out-Null
### WHEN CREATING A PULL REQUEST AGAINST MASTER WE REQUIRE A GIT FETCH --ALL OF THE ORIGIN
### THE FUNCTIONALITY WORKS AS EXPECTED BUT THE WORKFLOW RUN FAILS WITH EXIT 1 WITHOUT EVEN HITTING THE CATCH BELOW
### IN THE "GET LATEST CI/CD SCRIPTS" STEP WE POINT TO A SPECIFIC BRANCH TO CLONE AND IT ACTS AS A MINIMALISTIC CLONE OF THE 
### REPOSITORY. IT DOESN'T PULL DOWN ANY REFERENCES OF MASTER SO BY PERFORMING THE FETCH BELOW WE UPDATE THE REFERENCES
git fetch --all | Out-Null

try {

    $created_pull_request_link = create_pull_request -pull_request_title $pull_request_title `
                                                        -pull_request_body $pull_request_body `
                                                        -head_branch $head_branch `
                                                        -base_branch $base_branch

    merge_pull_request -created_pr_link $created_pull_request_link

} catch {

    exit 1

}
