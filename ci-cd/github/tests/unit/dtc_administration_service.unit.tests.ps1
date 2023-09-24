Import-Module -Force -Global -DisableNameChecking "$PSScriptRoot\..\..\dtc_administration_service.psm1"

# Invoke-Pester -EnableExit -Strict .\github\tests\unit\dtc_administration_service.unit.tests.ps1 -CodeCoverage .\github\dtc_administration_service.psm1

Describe 'get_expected_dtc_github_teams_to_settings_hashtable' {

    It 'given method invoked returns expected github dx teams' {

        $expected_github_teams_by_access_settings = @{
            'dtc-architects' = @{
                'permission' = 'admin'
            }
            'dtc-dx-salesforce-release-admins' = @{
                'permission' = 'admin'
            }
            'dtc-sfdx-admin' = @{
                'permission' = 'admin'
            }
            'dtc-codescan-service-team' = @{
                'permission' = 'read'
            }
        }

        $actual_dx_github_teams = get_expected_dtc_github_teams_to_settings_hashtable

        foreach ( $actual_team in $actual_dx_github_teams.Keys ) {
            $expected_github_teams_by_access_settings.ContainsKey($actual_team) | Should -Be $true
        }

    }

}
