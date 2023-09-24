param($ORG_ALIAS, $DEVHUB_ALIAS)

Write-Host "INSTALLING PACKAGE DEPENDENCIES SCRATCH - TEXEI"
Write-Host "org ORG_ALIAS: $ORG_ALIAS"
Write-Host "DEVHUB_ALIAS: $DEVHUB_ALIAS";

$install_package_dependencies_result_json = $( sfdx texei:package:dependencies:install -u $ORG_ALIAS -v $DEVHUB_ALIAS --noprompt -w 120 --json)

# THIS TEXEI COMMAND SPECIFICALLY RETURNS ADDITIONAL LINES THAT SHOULD NOT EXIST AS PART OF JSON OUTPUT FLAG --json
# THE BELOW STEPS CAPTURE ONLY THE JSON AS SUBSTRING WHETHER WE GET AN EXPECTED JSON RESULT ONLY OR WE GET THE OUTLIER SCENARIO OF UNEXPECTED LINES IN ADDITION TO THE JSON
# FURTHER BELOW ARE SOME OF THE JSON RESULTS RETURNED FROM THIS COMMAND DEPENDING ON THE STATUS OF THE PACKAGE AND THE TARGET ENVIRONMENT ALREADY HAVING THAT PACKAGE INSTALLED
$string_install_dependencies_result = $install_package_dependencies_result_json | Out-String
Write-Host "INSTALL DEPENDENCIES RESULT: $string_install_dependencies_result"
$opening_json_bracket = $string_install_dependencies_result.IndexOf("{")
$closing_json_bracket = $string_install_dependencies_result.LastIndexOf("}")
$string_install_dependencies_result_json = $string_install_dependencies_result.Substring($opening_json_bracket,(($closing_json_bracket + 1) - $opening_json_bracket))
Write-Host "SUBSTRING OF JSON RESULT: $string_install_dependencies_result_json"
$install_dependencies_result = $string_install_dependencies_result_json | ConvertFrom-Json
$install_dependencies_result.status


# -----------------------------------------------------------------------------------------------------------------------------------------
# RESULT FROM AN INSTALL ATTEMPT WHERE THE PACKAGE WAS ALREADY INSTALLED: 
# # {
# #     "status": 0,
# #     "result": {
# #       "message": {
# #         "installedPackages": {}
# #       }
# #     }
# #   }

# RESULT FROM FAILURE WHEN JSON STRUCTURE OF sfdx-project.json FILE WAS MANIPULATED TO BE INVALID: 
# # {
# #     "status": 1,
# #     "name": "JsonParseError",
# #     "message": "Parse error in file C:\\git_VA\\dtc-dx\\dtc-release-cicd\\cicd-testing-framework\\sfdx-test-project\\sfdx-project.json on line 11\n                    // \"package\": \"Nebul",
# #     "exitCode": 1,
# #     "commandName": "Install",
# #     "stack": "JsonParseError: Parse error in file C:\\git_VA\\dtc-dx\\dtc-release-cicd\\cicd-testing-framework\\sfdx-test-project\\sfdx-project.json on line 11\n                    // \"package\": \"Nebul\n    at Function.create (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\@salesforce\\kit\\lib\\errors.js:62:16)\n    at parseJson (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\@salesforce\\kit\\lib\\json.js:28:39)\n    at Object.parseJsonMap (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\@salesforce\\kit\\lib\\json.js:67:18)\n    at Object.readJsonMap (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\core\\lib\\util\\fs.js:206:22)\n    at async SfdxProjectJson.read (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\core\\lib\\config\\configFile.js:151:29)\n    at async SfdxProjectJson.read (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\core\\lib\\sfdxProject.js:51:26)\n    at async SfdxProjectJson.init (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\core\\lib\\config\\configFile.js:329:9)\n    at async Function.create (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\@salesforce\\kit\\lib\\creatable.js:31:9)\n    at async Install.run (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\lib\\commands\\texei\\package\\dependencies\\install.js:20:25)\n    at async 
# #   Install._run (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\command\\lib\\sfdxCommand.js:81:40)\nOuter stack:\n    at Function.wrap (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\command\\node_modules\\@salesforce\\core\\lib\\sfdxError.js:171:27)\n    at Install.catch (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\command\\lib\\sfdxCommand.js:248:67)\n    at async Install._run (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\node_modules\\texei-sfdx-plugin\\node_modules\\@salesforce\\command\\lib\\sfdxCommand.js:85:13)\n    at async Config.runCommand (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\client\\7.148.3-dbf0a7b\\node_modules\\@oclif\\config\\lib\\config.js:173:24)\n    at async SfdxMain.run (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\client\\7.148.3-dbf0a7b\\node_modules\\@oclif\\command\\lib\\main.js:27:9)\n    at async SfdxMain._run (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\client\\7.148.3-dbf0a7b\\node_modules\\@oclif\\command\\lib\\command.js:43:20)\n    at async Object.run (C:\\Users\\JonathonSchleicher\\AppData\\Local\\sfdx\\client\\7.148.3-dbf0a7b\\dist\\cli.js:162:47)",
# #     "warnings": []
# #   }

# RESULT THAT SHOWS RETURN OF ADDITIONAL LINES THAT SHOULD NOT BE PART OF JSON OUTPUT IN ADDITION TO ACTUAL JSON STRUCTURE AT THE END OF THE RETURN
# 'Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Waiting for the package install request to complete. Status = IN_PROGRESS
# Successfully installed package [04t3d0000000UXLAA2]
# {
#   "status": 0,
#   "result": {
#     "message": {
#       "installedPackages": {
#         "04t3d0000000UXLAA2": {
#           "dependentPackage": "Nebula Logger",
#           "versionNumber": "4.7.1.2",
#           "packageVersionId": "04t3d0000000UXLAA2"
#         }
#       }
#     }
#   }
# }'