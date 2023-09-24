
function get_fake_successful_validate_only {

    $fake_validate_only_result_json = @"
{
    "status": 0,
    "result": {
        "checkOnly": true,
        "completedDate": "2023-06-12T21:15:15.000Z",
        "createdBy": "0053R000002J7Bo",
        "createdByName": "User User",
        "createdDate": "2023-06-12T21:15:07.000Z",
        "details": {
        "componentSuccesses": [
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.GitHubUser__c",
            "id": "00N3R000005K4F0UAK",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.BranchName__c",
            "id": "00N3R000005K4EzUAK",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
            "id": "00N3R000005K6UYUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
            "id": "00N3R000005K6UXUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
            "id": "00N3R000005K6UWUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
            "id": "00N3R000005K6UUUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
            "id": "00N3R000005K6UTUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
            "id": "00N3R000005K6USUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
            "id": "00N3R000005K6URUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
            "id": "00N3R000005K6UQUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
            "id": "00N3R000005K6UPUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
            "id": "00N3R000005K6UOUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.WorkflowRunLink__c",
            "id": "00N3R000005K6UNUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.WorkflowRunId__c",
            "id": "00N3R000005K6UMUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.WorkflowName__c",
            "id": "00N3R000005K6ULUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.WasSuccessful__c",
            "id": "00N3R000005K6UKUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.StartTime__c",
            "id": "00N3R000005K6UJUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.StartDate__c",
            "id": "00N3R000005K6UIUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.SalesforceOrg__c",
            "id": "00N3R000005K6UHUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.IsModule__c",
            "id": "00N3R000005K6UDUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
            "id": "00N3R000005K6UVUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.JobName__c",
            "id": "00N3R000005K6UEUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.RepositoryName__c",
            "id": "00N3R000005K6UFUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:15:10.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.RunTimeMilliseconds__c",
            "id": "00N3R000005K6UGUA0",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsets/GitHubWorkflowRun_Edit.permissionset",
            "fullName": "GitHubWorkflowRun_Edit",
            "id": "0PS3R000000H7vGWAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "",
            "created": false,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "package.xml",
            "fullName": "package.xml",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsets/CICD_DevHub_Integrator.permissionset",
            "fullName": "CICD_DevHub_Integrator",
            "id": "0PS3R000000H7vEWAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomTab",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "tabs/PoolScratchOrgInstance__c.tab",
            "fullName": "PoolScratchOrgInstance__c",
            "id": "01r3R000000J4wiQAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomTab",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "tabs/GitHubWorkflowRun__c.tab",
            "fullName": "GitHubWorkflowRun__c",
            "id": "01r3R000000J4whQAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "Layout",
            "created": false,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "layouts/PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout",
            "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
            "id": "00h3R000001Nhg2QAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "Layout",
            "created": false,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "layouts/GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout",
            "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
            "id": "00h3R000001Nhg1QAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "ListView",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.All",
            "id": "00B3R000002k5X5UAI",
            "success": true
            },
            {
            "changed": true,
            "componentType": "ListView",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.All",
            "id": "00B3R000002k5X4UAI",
            "success": true
            },
            {
            "changed": true,
            "componentType": "RecordType",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c.DTC_Release_Workflow_Metrics",
            "id": "0123R0000010HAqQAM",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomObject",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c",
            "id": "01I3R000000kY93UAE",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomObject",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c",
            "id": "01I3R000000kY92UAE",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSetGroup",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsetgroups/DevHub_Integrator.permissionsetgroup",
            "fullName": "DevHub_Integrator",
            "id": "0PG3R0000000nYgWAI",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSetGroup",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsetgroups/DTC_Release_Hub_Read_Only.permissionsetgroup",
            "fullName": "DTC_Release_Hub_Read_Only",
            "id": "0PG3R0000000nYfWAI",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsets/PoolScratchOrgInstance_ReadOnly.permissionset",
            "fullName": "PoolScratchOrgInstance_ReadOnly",
            "id": "0PS3R000000H7vJWAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsets/PoolScratchOrgInstance_Edit.permissionset",
            "fullName": "PoolScratchOrgInstance_Edit",
            "id": "0PS3R000000H7vIWAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsets/GitHubWorkflowRun_ReadOnly.permissionset",
            "fullName": "GitHubWorkflowRun_ReadOnly",
            "id": "0PS3R000000H7vHWAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:15:14.000Z",
            "deleted": false,
            "fileName": "permissionsets/DTC_Release_Hub_ReadOnly.permissionset",
            "fullName": "DTC_Release_Hub_ReadOnly",
            "id": "0PS3R000000H7vFWAS",
            "success": true
            }
        ],
        "runTestResult": {
            "numFailures": 0,
            "numTestsRun": 0,
            "totalTime": 0,
            "codeCoverage": [],
            "codeCoverageWarnings": [],
            "failures": [],
            "flowCoverage": [],
            "flowCoverageWarnings": [],
            "successes": []
        },
        "componentFailures": []
        },
        "done": true,
        "id": "0Af3R00000QDHggSAH",
        "ignoreWarnings": false,
        "lastModifiedDate": "2023-06-12T21:15:15.000Z",
        "numberComponentErrors": 0,
        "numberComponentsDeployed": 41,
        "numberComponentsTotal": 41,
        "numberTestErrors": 0,
        "numberTestsCompleted": 0,
        "numberTestsTotal": 0,
        "rollbackOnError": true,
        "runTestsEnabled": false,
        "startDate": "2023-06-12T21:15:07.000Z",
        "status": "Succeeded",
        "success": true,
        "deployedSource": [
        {
            "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
            "type": "Layout",
            "state": "Changed",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
            "type": "Layout",
            "state": "Changed",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.BranchName__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\BranchName__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.GitHubUser__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\GitHubUser__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.IsModule__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\IsModule__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.JobName__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\JobName__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.RepositoryName__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\RepositoryName__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.RunTimeMilliseconds__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\RunTimeMilliseconds__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.SalesforceOrg__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\SalesforceOrg__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.StartDate__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\StartDate__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.StartTime__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\StartTime__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.WasSuccessful__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WasSuccessful__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.WorkflowName__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WorkflowName__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.WorkflowRunId__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WorkflowRunId__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.WorkflowRunLink__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WorkflowRunLink__c.field-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.All",
            "type": "ListView",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\listViews\\All.listView-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c.DTC_Release_Workflow_Metrics",
            "type": "RecordType",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\recordTypes\\DTC_Release_Workflow_Metrics.recordType-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c",
            "type": "CustomObject",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\GitHubWorkflowRun__c.object-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\BranchCreatedFrom__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ClaimedBy__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DataPopulated__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DependenciesAreInstalled__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ExpirationDate__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\IsClaimed__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ProjectName__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInfoId__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInstanceUrl__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgSignupUsername__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrg_Status__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.All",
            "type": "ListView",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\listViews\\All.listView-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c",
            "type": "CustomObject",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\PoolScratchOrgInstance__c.object-meta.xml"
        },
        {
            "fullName": "DevHub_Integrator",
            "type": "PermissionSetGroup",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DevHub_Integrator.permissionsetgroup-meta.xml"
        },
        {
            "fullName": "DTC_Release_Hub_Read_Only",
            "type": "PermissionSetGroup",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DTC_Release_Hub_Read_Only.permissionsetgroup-meta.xml"
        },
        {
            "fullName": "CICD_DevHub_Integrator",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\CICD_DevHub_Integrator.permissionset-meta.xml"
        },
        {
            "fullName": "DTC_Release_Hub_ReadOnly",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\DTC_Release_Hub_ReadOnly.permissionset-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun_Edit",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_Edit.permissionset-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun_ReadOnly",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_ReadOnly.permissionset-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance_Edit",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_Edit.permissionset-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance_ReadOnly",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_ReadOnly.permissionset-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c",
            "type": "CustomTab",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\GitHubWorkflowRun__c.tab-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c",
            "type": "CustomTab",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\PoolScratchOrgInstance__c.tab-meta.xml"
        }
        ],
        "outboundFiles": [],
        "deploys": [
        {
            "checkOnly": true,
            "completedDate": "2023-06-12T21:15:15.000Z",
            "createdBy": "0053R000002J7Bo",
            "createdByName": "User User",
            "createdDate": "2023-06-12T21:15:07.000Z",
            "details": {
            "componentSuccesses": [
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.GitHubUser__c",
                "id": "00N3R000005K4F0UAK",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.BranchName__c",
                "id": "00N3R000005K4EzUAK",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
                "id": "00N3R000005K6UYUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
                "id": "00N3R000005K6UXUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
                "id": "00N3R000005K6UWUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
                "id": "00N3R000005K6UUUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
                "id": "00N3R000005K6UTUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
                "id": "00N3R000005K6USUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
                "id": "00N3R000005K6URUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
                "id": "00N3R000005K6UQUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
                "id": "00N3R000005K6UPUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
                "id": "00N3R000005K6UOUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.WorkflowRunLink__c",
                "id": "00N3R000005K6UNUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.WorkflowRunId__c",
                "id": "00N3R000005K6UMUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.WorkflowName__c",
                "id": "00N3R000005K6ULUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.WasSuccessful__c",
                "id": "00N3R000005K6UKUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.StartTime__c",
                "id": "00N3R000005K6UJUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.StartDate__c",
                "id": "00N3R000005K6UIUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.SalesforceOrg__c",
                "id": "00N3R000005K6UHUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.IsModule__c",
                "id": "00N3R000005K6UDUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
                "id": "00N3R000005K6UVUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.JobName__c",
                "id": "00N3R000005K6UEUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.RepositoryName__c",
                "id": "00N3R000005K6UFUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:15:10.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.RunTimeMilliseconds__c",
                "id": "00N3R000005K6UGUA0",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsets/GitHubWorkflowRun_Edit.permissionset",
                "fullName": "GitHubWorkflowRun_Edit",
                "id": "0PS3R000000H7vGWAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "",
                "created": false,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "package.xml",
                "fullName": "package.xml",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsets/CICD_DevHub_Integrator.permissionset",
                "fullName": "CICD_DevHub_Integrator",
                "id": "0PS3R000000H7vEWAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomTab",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "tabs/PoolScratchOrgInstance__c.tab",
                "fullName": "PoolScratchOrgInstance__c",
                "id": "01r3R000000J4wiQAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomTab",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "tabs/GitHubWorkflowRun__c.tab",
                "fullName": "GitHubWorkflowRun__c",
                "id": "01r3R000000J4whQAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "Layout",
                "created": false,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "layouts/PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout",
                "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
                "id": "00h3R000001Nhg2QAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "Layout",
                "created": false,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "layouts/GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout",
                "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
                "id": "00h3R000001Nhg1QAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "ListView",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.All",
                "id": "00B3R000002k5X5UAI",
                "success": true
                },
                {
                "changed": true,
                "componentType": "ListView",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.All",
                "id": "00B3R000002k5X4UAI",
                "success": true
                },
                {
                "changed": true,
                "componentType": "RecordType",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c.DTC_Release_Workflow_Metrics",
                "id": "0123R0000010HAqQAM",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomObject",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c",
                "id": "01I3R000000kY93UAE",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomObject",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c",
                "id": "01I3R000000kY92UAE",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSetGroup",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsetgroups/DevHub_Integrator.permissionsetgroup",
                "fullName": "DevHub_Integrator",
                "id": "0PG3R0000000nYgWAI",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSetGroup",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsetgroups/DTC_Release_Hub_Read_Only.permissionsetgroup",
                "fullName": "DTC_Release_Hub_Read_Only",
                "id": "0PG3R0000000nYfWAI",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsets/PoolScratchOrgInstance_ReadOnly.permissionset",
                "fullName": "PoolScratchOrgInstance_ReadOnly",
                "id": "0PS3R000000H7vJWAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsets/PoolScratchOrgInstance_Edit.permissionset",
                "fullName": "PoolScratchOrgInstance_Edit",
                "id": "0PS3R000000H7vIWAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsets/GitHubWorkflowRun_ReadOnly.permissionset",
                "fullName": "GitHubWorkflowRun_ReadOnly",
                "id": "0PS3R000000H7vHWAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:15:14.000Z",
                "deleted": false,
                "fileName": "permissionsets/DTC_Release_Hub_ReadOnly.permissionset",
                "fullName": "DTC_Release_Hub_ReadOnly",
                "id": "0PS3R000000H7vFWAS",
                "success": true
                }
            ],
            "runTestResult": {
                "numFailures": 0,
                "numTestsRun": 0,
                "totalTime": 0,
                "codeCoverage": [],
                "codeCoverageWarnings": [],
                "failures": [],
                "flowCoverage": [],
                "flowCoverageWarnings": [],
                "successes": []
            },
            "componentFailures": []
            },
            "done": true,
            "id": "0Af3R00000QDHggSAH",
            "ignoreWarnings": false,
            "lastModifiedDate": "2023-06-12T21:15:15.000Z",
            "numberComponentErrors": 0,
            "numberComponentsDeployed": 41,
            "numberComponentsTotal": 41,
            "numberTestErrors": 0,
            "numberTestsCompleted": 0,
            "numberTestsTotal": 0,
            "rollbackOnError": true,
            "runTestsEnabled": false,
            "startDate": "2023-06-12T21:15:07.000Z",
            "status": "Succeeded",
            "success": true,
            "deployedSource": [
            {
                "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
                "type": "Layout",
                "state": "Changed",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
                "type": "Layout",
                "state": "Changed",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.BranchName__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\BranchName__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.GitHubUser__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\GitHubUser__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.IsModule__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\IsModule__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.JobName__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\JobName__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.RepositoryName__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\RepositoryName__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.RunTimeMilliseconds__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\RunTimeMilliseconds__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.SalesforceOrg__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\SalesforceOrg__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.StartDate__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\StartDate__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.StartTime__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\StartTime__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.WasSuccessful__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WasSuccessful__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.WorkflowName__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WorkflowName__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.WorkflowRunId__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WorkflowRunId__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.WorkflowRunLink__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\fields\\WorkflowRunLink__c.field-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.All",
                "type": "ListView",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\listViews\\All.listView-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c.DTC_Release_Workflow_Metrics",
                "type": "RecordType",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\recordTypes\\DTC_Release_Workflow_Metrics.recordType-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c",
                "type": "CustomObject",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\GitHubWorkflowRun__c.object-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\BranchCreatedFrom__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ClaimedBy__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DataPopulated__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DependenciesAreInstalled__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ExpirationDate__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\IsClaimed__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ProjectName__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInfoId__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInstanceUrl__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgSignupUsername__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrg_Status__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.All",
                "type": "ListView",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\listViews\\All.listView-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c",
                "type": "CustomObject",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\PoolScratchOrgInstance__c.object-meta.xml"
            },
            {
                "fullName": "DevHub_Integrator",
                "type": "PermissionSetGroup",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DevHub_Integrator.permissionsetgroup-meta.xml"
            },
            {
                "fullName": "DTC_Release_Hub_Read_Only",
                "type": "PermissionSetGroup",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DTC_Release_Hub_Read_Only.permissionsetgroup-meta.xml"
            },
            {
                "fullName": "CICD_DevHub_Integrator",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\CICD_DevHub_Integrator.permissionset-meta.xml"
            },
            {
                "fullName": "DTC_Release_Hub_ReadOnly",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\DTC_Release_Hub_ReadOnly.permissionset-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun_Edit",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_Edit.permissionset-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun_ReadOnly",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_ReadOnly.permissionset-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance_Edit",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_Edit.permissionset-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance_ReadOnly",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_ReadOnly.permissionset-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c",
                "type": "CustomTab",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\GitHubWorkflowRun__c.tab-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c",
                "type": "CustomTab",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\PoolScratchOrgInstance__c.tab-meta.xml"
            }
            ],
            "outboundFiles": []
        }
        ]
    },
    "warnings": [
        "We plan to deprecate this command in the future. Try using the \"project deploy start\" command instead.",
        "The \"--targetusername\" flag has been deprecated. Use \"--target-org | -u\" instead."
    ]
}
    

"@

    $fake_validate_only_result_json

}

function get_fake_failed_validate_only {

    $fake_failed_validate_only = @"
{
    "status": 1,
    "result": {
        "checkOnly": true,
        "completedDate": "2023-06-12T21:23:34.000Z",
        "createdBy": "0053R000002J7Bo",
        "createdByName": "User User",
        "createdDate": "2023-06-12T21:23:30.000Z",
        "details": {
        "componentFailures": [
            {
            "changed": false,
            "columnNumber": 25,
            "componentType": "CustomObject",
            "created": false,
            "createdDate": "2023-06-12T21:23:30.000Z",
            "deleted": false,
            "fileName": "objects/GitHubWorkflowRun__c.object",
            "fullName": "GitHubWorkflowRun__c",
            "lineNumber": 177,
            "problem": "Error parsing file: 'hat' is not a valid value for the enum 'FieldType'",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "Layout",
            "created": false,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "layouts/GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout",
            "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
            "problem": "Parent entity failed to deploy",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "CustomTab",
            "created": false,
            "createdDate": "2023-06-12T21:23:32.000Z",
            "deleted": false,
            "fileName": "tabs/GitHubWorkflowRun__c.tab",
            "fullName": "GitHubWorkflowRun__c",
            "problem": "In field: fullName - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "PermissionSet",
            "created": false,
            "createdDate": "2023-06-12T21:23:33.000Z",
            "deleted": false,
            "fileName": "permissionsets/GitHubWorkflowRun_ReadOnly.permissionset",
            "fullName": "GitHubWorkflowRun_ReadOnly",
            "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "PermissionSet",
            "created": false,
            "createdDate": "2023-06-12T21:23:33.000Z",
            "deleted": false,
            "fileName": "permissionsets/GitHubWorkflowRun_Edit.permissionset",
            "fullName": "GitHubWorkflowRun_Edit",
            "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "PermissionSet",
            "created": false,
            "createdDate": "2023-06-12T21:23:33.000Z",
            "deleted": false,
            "fileName": "permissionsets/DTC_Release_Hub_ReadOnly.permissionset",
            "fullName": "DTC_Release_Hub_ReadOnly",
            "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "PermissionSet",
            "created": false,
            "createdDate": "2023-06-12T21:23:33.000Z",
            "deleted": false,
            "fileName": "permissionsets/CICD_DevHub_Integrator.permissionset",
            "fullName": "CICD_DevHub_Integrator",
            "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "PermissionSetGroup",
            "created": false,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "permissionsetgroups/DevHub_Integrator.permissionsetgroup",
            "fullName": "DevHub_Integrator",
            "problem": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_Edit",
            "problemType": "Error",
            "success": false
            },
            {
            "changed": false,
            "componentType": "PermissionSetGroup",
            "created": false,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "permissionsetgroups/DTC_Release_Hub_Read_Only.permissionsetgroup",
            "fullName": "DTC_Release_Hub_Read_Only",
            "problem": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_ReadOnly",
            "problemType": "Error",
            "success": false
            }
        ],
        "componentSuccesses": [
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
            "id": "00N3R000005K6oZUAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
            "id": "00N3R000005K6oaUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
            "id": "00N3R000005K6obUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
            "id": "00N3R000005K6ocUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
            "id": "00N3R000005K6oeUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
            "id": "00N3R000005K6ofUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
            "id": "00N3R000005K6ogUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
            "id": "00N3R000005K6ohUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
            "id": "00N3R000005K6oiUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
            "id": "00N3R000005K6oYUAS",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomField",
            "created": true,
            "createdDate": "2023-06-12T21:23:31.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
            "id": "00N3R000005K6odUAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "Layout",
            "created": false,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "layouts/PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout",
            "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
            "id": "00h3R000001Ni9fQAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomTab",
            "created": true,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "tabs/PoolScratchOrgInstance__c.tab",
            "fullName": "PoolScratchOrgInstance__c",
            "id": "01r3R000000J4x6QAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "permissionsets/PoolScratchOrgInstance_Edit.permissionset",
            "fullName": "PoolScratchOrgInstance_Edit",
            "id": "0PS3R000000H7wkWAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "PermissionSet",
            "created": true,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "permissionsets/PoolScratchOrgInstance_ReadOnly.permissionset",
            "fullName": "PoolScratchOrgInstance_ReadOnly",
            "id": "0PS3R000000H7wlWAC",
            "success": true
            },
            {
            "changed": true,
            "componentType": "ListView",
            "created": true,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c.All",
            "id": "00B3R000002k5fOUAQ",
            "success": true
            },
            {
            "changed": true,
            "componentType": "",
            "created": false,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "package.xml",
            "fullName": "package.xml",
            "success": true
            },
            {
            "changed": true,
            "componentType": "CustomObject",
            "created": true,
            "createdDate": "2023-06-12T21:23:34.000Z",
            "deleted": false,
            "fileName": "objects/PoolScratchOrgInstance__c.object",
            "fullName": "PoolScratchOrgInstance__c",
            "id": "01I3R000000kYYUUA2",
            "success": true
            }
        ],
        "runTestResult": {
            "numFailures": 0,
            "numTestsRun": 0,
            "totalTime": 0,
            "codeCoverage": [],
            "codeCoverageWarnings": [],
            "failures": [],
            "flowCoverage": [],
            "flowCoverageWarnings": [],
            "successes": []
        }
        },
        "done": true,
        "id": "0Af3R00000QDS2DSAX",
        "ignoreWarnings": false,
        "lastModifiedDate": "2023-06-12T21:23:34.000Z",
        "numberComponentErrors": 9,
        "numberComponentsDeployed": 17,
        "numberComponentsTotal": 26,
        "numberTestErrors": 0,
        "numberTestsCompleted": 0,
        "numberTestsTotal": 0,
        "rollbackOnError": true,
        "runTestsEnabled": false,
        "startDate": "2023-06-12T21:23:30.000Z",
        "status": "Failed",
        "success": false,
        "deployedSource": [
        {
            "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
            "type": "Layout",
            "state": "Failed",
            "error": "Parent entity failed to deploy",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
            "type": "Layout",
            "state": "Changed",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c",
            "type": "CustomObject",
            "state": "Failed",
            "error": "Error parsing file: 'hat' is not a valid value for the enum 'FieldType' (177:25)",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\GitHubWorkflowRun__c.object-meta.xml",
            "lineNumber": 177,
            "columnNumber": 25
        },
        {
            "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\BranchCreatedFrom__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ClaimedBy__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DataPopulated__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DependenciesAreInstalled__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ExpirationDate__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\IsClaimed__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ProjectName__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInfoId__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInstanceUrl__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgSignupUsername__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
            "type": "CustomField",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrg_Status__c.field-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c.All",
            "type": "ListView",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\listViews\\All.listView-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c",
            "type": "CustomObject",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\PoolScratchOrgInstance__c.object-meta.xml"
        },
        {
            "fullName": "DevHub_Integrator",
            "type": "PermissionSetGroup",
            "state": "Failed",
            "error": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_Edit",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DevHub_Integrator.permissionsetgroup-meta.xml"
        },
        {
            "fullName": "DTC_Release_Hub_Read_Only",
            "type": "PermissionSetGroup",
            "state": "Failed",
            "error": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_ReadOnly",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DTC_Release_Hub_Read_Only.permissionsetgroup-meta.xml"
        },
        {
            "fullName": "CICD_DevHub_Integrator",
            "type": "PermissionSet",
            "state": "Failed",
            "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\CICD_DevHub_Integrator.permissionset-meta.xml"
        },
        {
            "fullName": "DTC_Release_Hub_ReadOnly",
            "type": "PermissionSet",
            "state": "Failed",
            "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\DTC_Release_Hub_ReadOnly.permissionset-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun_Edit",
            "type": "PermissionSet",
            "state": "Failed",
            "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_Edit.permissionset-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun_ReadOnly",
            "type": "PermissionSet",
            "state": "Failed",
            "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_ReadOnly.permissionset-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance_Edit",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_Edit.permissionset-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance_ReadOnly",
            "type": "PermissionSet",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_ReadOnly.permissionset-meta.xml"
        },
        {
            "fullName": "GitHubWorkflowRun__c",
            "type": "CustomTab",
            "state": "Failed",
            "error": "In field: fullName - no CustomObject named GitHubWorkflowRun__c found",
            "problemType": "Error",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\GitHubWorkflowRun__c.tab-meta.xml"
        },
        {
            "fullName": "PoolScratchOrgInstance__c",
            "type": "CustomTab",
            "state": "Created",
            "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\PoolScratchOrgInstance__c.tab-meta.xml"
        }
        ],
        "outboundFiles": [],
        "deploys": [
        {
            "checkOnly": true,
            "completedDate": "2023-06-12T21:23:34.000Z",
            "createdBy": "0053R000002J7Bo",
            "createdByName": "User User",
            "createdDate": "2023-06-12T21:23:30.000Z",
            "details": {
            "componentFailures": [
                {
                "changed": false,
                "columnNumber": 25,
                "componentType": "CustomObject",
                "created": false,
                "createdDate": "2023-06-12T21:23:30.000Z",
                "deleted": false,
                "fileName": "objects/GitHubWorkflowRun__c.object",
                "fullName": "GitHubWorkflowRun__c",
                "lineNumber": 177,
                "problem": "Error parsing file: 'hat' is not a valid value for the enum 'FieldType'",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "Layout",
                "created": false,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "layouts/GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout",
                "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
                "problem": "Parent entity failed to deploy",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "CustomTab",
                "created": false,
                "createdDate": "2023-06-12T21:23:32.000Z",
                "deleted": false,
                "fileName": "tabs/GitHubWorkflowRun__c.tab",
                "fullName": "GitHubWorkflowRun__c",
                "problem": "In field: fullName - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "PermissionSet",
                "created": false,
                "createdDate": "2023-06-12T21:23:33.000Z",
                "deleted": false,
                "fileName": "permissionsets/GitHubWorkflowRun_ReadOnly.permissionset",
                "fullName": "GitHubWorkflowRun_ReadOnly",
                "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "PermissionSet",
                "created": false,
                "createdDate": "2023-06-12T21:23:33.000Z",
                "deleted": false,
                "fileName": "permissionsets/GitHubWorkflowRun_Edit.permissionset",
                "fullName": "GitHubWorkflowRun_Edit",
                "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "PermissionSet",
                "created": false,
                "createdDate": "2023-06-12T21:23:33.000Z",
                "deleted": false,
                "fileName": "permissionsets/DTC_Release_Hub_ReadOnly.permissionset",
                "fullName": "DTC_Release_Hub_ReadOnly",
                "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "PermissionSet",
                "created": false,
                "createdDate": "2023-06-12T21:23:33.000Z",
                "deleted": false,
                "fileName": "permissionsets/CICD_DevHub_Integrator.permissionset",
                "fullName": "CICD_DevHub_Integrator",
                "problem": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "PermissionSetGroup",
                "created": false,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "permissionsetgroups/DevHub_Integrator.permissionsetgroup",
                "fullName": "DevHub_Integrator",
                "problem": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_Edit",
                "problemType": "Error",
                "success": false
                },
                {
                "changed": false,
                "componentType": "PermissionSetGroup",
                "created": false,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "permissionsetgroups/DTC_Release_Hub_Read_Only.permissionsetgroup",
                "fullName": "DTC_Release_Hub_Read_Only",
                "problem": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_ReadOnly",
                "problemType": "Error",
                "success": false
                }
            ],
            "componentSuccesses": [
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
                "id": "00N3R000005K6oZUAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
                "id": "00N3R000005K6oaUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
                "id": "00N3R000005K6obUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
                "id": "00N3R000005K6ocUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
                "id": "00N3R000005K6oeUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
                "id": "00N3R000005K6ofUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
                "id": "00N3R000005K6ogUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
                "id": "00N3R000005K6ohUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
                "id": "00N3R000005K6oiUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
                "id": "00N3R000005K6oYUAS",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomField",
                "created": true,
                "createdDate": "2023-06-12T21:23:31.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
                "id": "00N3R000005K6odUAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "Layout",
                "created": false,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "layouts/PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout",
                "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
                "id": "00h3R000001Ni9fQAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomTab",
                "created": true,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "tabs/PoolScratchOrgInstance__c.tab",
                "fullName": "PoolScratchOrgInstance__c",
                "id": "01r3R000000J4x6QAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "permissionsets/PoolScratchOrgInstance_Edit.permissionset",
                "fullName": "PoolScratchOrgInstance_Edit",
                "id": "0PS3R000000H7wkWAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "PermissionSet",
                "created": true,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "permissionsets/PoolScratchOrgInstance_ReadOnly.permissionset",
                "fullName": "PoolScratchOrgInstance_ReadOnly",
                "id": "0PS3R000000H7wlWAC",
                "success": true
                },
                {
                "changed": true,
                "componentType": "ListView",
                "created": true,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c.All",
                "id": "00B3R000002k5fOUAQ",
                "success": true
                },
                {
                "changed": true,
                "componentType": "",
                "created": false,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "package.xml",
                "fullName": "package.xml",
                "success": true
                },
                {
                "changed": true,
                "componentType": "CustomObject",
                "created": true,
                "createdDate": "2023-06-12T21:23:34.000Z",
                "deleted": false,
                "fileName": "objects/PoolScratchOrgInstance__c.object",
                "fullName": "PoolScratchOrgInstance__c",
                "id": "01I3R000000kYYUUA2",
                "success": true
                }
            ],
            "runTestResult": {
                "numFailures": 0,
                "numTestsRun": 0,
                "totalTime": 0,
                "codeCoverage": [],
                "codeCoverageWarnings": [],
                "failures": [],
                "flowCoverage": [],
                "flowCoverageWarnings": [],
                "successes": []
            }
            },
            "done": true,
            "id": "0Af3R00000QDS2DSAX",
            "ignoreWarnings": false,
            "lastModifiedDate": "2023-06-12T21:23:34.000Z",
            "numberComponentErrors": 9,
            "numberComponentsDeployed": 17,
            "numberComponentsTotal": 26,
            "numberTestErrors": 0,
            "numberTestsCompleted": 0,
            "numberTestsTotal": 0,
            "rollbackOnError": true,
            "runTestsEnabled": false,
            "startDate": "2023-06-12T21:23:30.000Z",
            "status": "Failed",
            "success": false,
            "deployedSource": [
            {
                "fullName": "GitHubWorkflowRun__c-GitHubWorkflowRun Layout",
                "type": "Layout",
                "state": "Failed",
                "error": "Parent entity failed to deploy",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\GitHubWorkflowRun__c-GitHubWorkflowRun Layout.layout-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout",
                "type": "Layout",
                "state": "Changed",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\layouts\\PoolScratchOrgInstance__c-PoolScratchOrgInstance Layout.layout-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c",
                "type": "CustomObject",
                "state": "Failed",
                "error": "Error parsing file: 'hat' is not a valid value for the enum 'FieldType' (177:25)",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\GitHubWorkflowRun__c\\GitHubWorkflowRun__c.object-meta.xml",
                "lineNumber": 177,
                "columnNumber": 25
            },
            {
                "fullName": "PoolScratchOrgInstance__c.BranchCreatedFrom__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\BranchCreatedFrom__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ClaimedBy__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ClaimedBy__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.DataPopulated__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DataPopulated__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.DependenciesAreInstalled__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\DependenciesAreInstalled__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ExpirationDate__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ExpirationDate__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.IsClaimed__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\IsClaimed__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ProjectName__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ProjectName__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInfoId__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInfoId__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgInstanceUrl__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgInstanceUrl__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrgSignupUsername__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrgSignupUsername__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.ScratchOrg_Status__c",
                "type": "CustomField",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\fields\\ScratchOrg_Status__c.field-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c.All",
                "type": "ListView",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\listViews\\All.listView-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c",
                "type": "CustomObject",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\objects\\PoolScratchOrgInstance__c\\PoolScratchOrgInstance__c.object-meta.xml"
            },
            {
                "fullName": "DevHub_Integrator",
                "type": "PermissionSetGroup",
                "state": "Failed",
                "error": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_Edit",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DevHub_Integrator.permissionsetgroup-meta.xml"
            },
            {
                "fullName": "DTC_Release_Hub_Read_Only",
                "type": "PermissionSetGroup",
                "state": "Failed",
                "error": "Cannot create permission set group components since the following permission set names are invalid: GitHubWorkflowRun_ReadOnly",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsetgroups\\DTC_Release_Hub_Read_Only.permissionsetgroup-meta.xml"
            },
            {
                "fullName": "CICD_DevHub_Integrator",
                "type": "PermissionSet",
                "state": "Failed",
                "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\CICD_DevHub_Integrator.permissionset-meta.xml"
            },
            {
                "fullName": "DTC_Release_Hub_ReadOnly",
                "type": "PermissionSet",
                "state": "Failed",
                "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\DTC_Release_Hub_ReadOnly.permissionset-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun_Edit",
                "type": "PermissionSet",
                "state": "Failed",
                "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_Edit.permissionset-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun_ReadOnly",
                "type": "PermissionSet",
                "state": "Failed",
                "error": "In field: object - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\GitHubWorkflowRun_ReadOnly.permissionset-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance_Edit",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_Edit.permissionset-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance_ReadOnly",
                "type": "PermissionSet",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\permissionsets\\PoolScratchOrgInstance_ReadOnly.permissionset-meta.xml"
            },
            {
                "fullName": "GitHubWorkflowRun__c",
                "type": "CustomTab",
                "state": "Failed",
                "error": "In field: fullName - no CustomObject named GitHubWorkflowRun__c found",
                "problemType": "Error",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\GitHubWorkflowRun__c.tab-meta.xml"
            },
            {
                "fullName": "PoolScratchOrgInstance__c",
                "type": "CustomTab",
                "state": "Created",
                "filePath": "C:\\git_VA\\dtc-dx\\dtc-release-hub\\sfdx-source\\dtc-release-hub\\tabs\\PoolScratchOrgInstance__c.tab-meta.xml"
            }
            ],
            "outboundFiles": []
        }
        ]
    },
    "warnings": [
        "We plan to deprecate this command in the future. Try using the \"project deploy start\" command instead.",
        "The \"--targetusername\" flag has been deprecated. Use \"--target-org | -u\" instead."
    ]
    }
"@

    $fake_failed_validate_only
    
}