function get_fake_issue_body_for_adding_github_user_to_repository_team_issue_form {
 
    $fake_issue_body = @" 
### User Email

Test@gmail.com

### GitHub Username

test_user01
"@

    $fake_issue_body

}

function get_fake_issue_body_for_creating_new_release_branch_issue_form_with_date_included {

    $fake_issue_body = @"

## Is this new release branch a major version update or a minor version update?

Minor

## Release Branch Date (Optional)

12-31-2023
"@

    $fake_issue_body
    
}

function get_fake_issue_body_for_creating_new_release_branch_issue_form_without_date_included {

    $fake_issue_body = @"
## Release Branch Date (Optional)


_No response_
"@
    
    $fake_issue_body
        
}
    
function get_fake_github_issue_body_with_all_input_options {


    $fake_github_issue_body = @"
### What Salesforce Org Pipeline to Install to?

VA

### GitHub Release Tag

v1.45.3.2

### Expected Blank Response

_No response_

### Confirm Checkbox

- [X] I understand the risk of selecting
"@

    $fake_github_issue_body

}