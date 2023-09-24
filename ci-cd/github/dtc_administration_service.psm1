function get_expected_dtc_github_teams_to_settings_hashtable {
    $github_teams_by_access_settings = @{
        'dtc-architects' = @{
            'permission' = 'admin'
        }
        'dtc-dx-salesforce-release-admins' = @{
            'permission' = 'admin'
        }
        'dtc-sfdx-admin' = @{
            'permission' = 'admin'
        }
    }
    $github_teams_by_access_settings
}
