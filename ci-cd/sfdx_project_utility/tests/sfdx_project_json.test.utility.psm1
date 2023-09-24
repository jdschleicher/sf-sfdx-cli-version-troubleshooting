

function get_fake_sfdx_project_json_file_content_with_expected_patch_version_number {

    $sfdx_project_json_content = @"

    {
        "packageDirectories": [
          {
            "path": "sfdx-source/fake-utility-package",
            "package": "fake-utility-package",
            "default": true,
            "definitionFile": "config/project-scratch-def.json",
            "versionNumber": "1.3.1.NEXT"
          },
          {
            "path": "sfdx-source/unpackaged",
            "default": false
          },
          {
            "path": "sfdx-source/untracked",
            "default": false
          }
        ],
        "namespace": "",
        "sfdcLoginUrl": "https://login.salesforce.com",
        "sourceApiVersion": "54.0",
        "packageAliases": {
          "fake-utility-package": "0Hot00342000fxURCAY"
        }
      }
      
"@

      $sfdx_project_json_content

}