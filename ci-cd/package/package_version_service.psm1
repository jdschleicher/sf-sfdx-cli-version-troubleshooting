
function create_full_validation_package_version_and_get_result {
    param($package_detail, $devhub_alias)
    $package_creation_result_json = create_full_validation_package_version_by_devhub_and_package_details -package_detail $package_detail -devhub_alias $devhub_alias
    Write-Host "package creation result: $package_creation_result_json"
    $package_version_creation_result = $package_creation_result_json | ConvertFrom-Json
    $package_version_creation_result
}

function create_full_validation_package_version_by_devhub_and_package_details {
    param($package_detail, $devhub_alias)

    Write-Host "package tag: $($package_detail.package_tag)"
    Write-Host "sf package version create --target-dev-hub $devhub_alias --package "$($package_detail.package_name)" --tag "$($package_detail.package_tag)" --code-coverage --installation-key-bypass --wait 120 --json --verbose --dev-debug --preserve"
    $package_creation_result_json = $( sf package version create --target-dev-hub $devhub_alias --package "$($package_detail.package_name)" --code-coverage --installation-key-bypass --wait 120 --json --verbose --dev-debug --preserve) 

    $package_creation_result_json
    
}

function create_skip_validation_package_version_and_get_result {
    param($package_detail, $devhub_alias)
    $package_creation_result_json = create_skipvalidation_validation_package_version_by_devhub_and_package_details -package_detail $package_detail -devhub_alias $package_version_creation_details.devhub_alias
    $package_version_creation_result = $package_creation_result_json | ConvertFrom-Json
    $package_version_creation_result
}

function create_skipvalidation_validation_package_version_by_devhub_and_package_details {
    param($package_detail, $devhub_alias)
    
    Write-Host "sf package version create --target-dev-hub $devhub_alias --package "$($package_detail.package_name)" --tag "$($package_detail.package_tag)" --skip-validation --installation-key-bypass --wait 10 --json --verbose --dev-debug --preserve"
    $package_creation_result_json = $( sf package version create --target-dev-hub $devhub_alias --package "$($package_detail.package_name)" --tag "$($package_detail.package_tag)" --skip-validation --installation-key-bypass --wait 10 --json --verbose --dev-debug --preserve)  
    
    $package_creation_result_json

}

function get_package_version_report_by_subscriberversionid_and_devhub {
    param($subscriber_package_version_id, $devhub_alias)

    Write-Host "sfdx force:package:version:report -p $subscriber_package_version_id -v $devhub_alias --json "
    $package_version_report_json = $( sfdx force:package:version:report -p $subscriber_package_version_id -v $devhub_alias --json  )
    $package_version_report = $package_version_report_json | ConvertFrom-Json

    $package_version_report

}

function set_ghactions_outputs_for_skipvalidation_package_details {
    param($package_tag_output, $subscriber_package_version_id, $package_version, $slack_message_package_info)

    # THE BELOW SYNTAX OF ">> $env:GITHUB_OUTPUT" ALLOWS FOR GH ACTIONS TO CAPTURE THESE VALUES AND AVAILABLE FOR
    # ANY NECESSARY SEQUENTIAL JOB OR STEP WHERE THE VALUES WOULD NOT BE AVAILABLE IN THE NEW CONTEXT
    "packageSubscriberId=$subscriber_package_version_id" >> $env:GITHUB_OUTPUT
    "packageVersion=$package_version" >> $env:GITHUB_OUTPUT
    "packageTag=$package_tag_output" >> $env:GITHUB_OUTPUT

    $slack_message_package_info_json = $slack_message_package_info | ConvertTo-Json -Compress
    "slack_message_package_info=$slack_message_package_info_json" >> $env:GITHUB_OUTPUT

}

function set_ghactions_output_from_fullvalidation_job {
    param($github_tag, $package_version_report, $slack_message_package_info)    
    
    # THE BELOW SYNTAX OF ">> $env:GITHUB_OUTPUT" ALLOWS FOR GH ACTIONS TO CAPTURE THESE VALUES AND AVAILABLE FOR
    # ANY NECESSARY SEQUENTIAL JOB OR STEP WHERE THE VALUES WOULD NOT BE AVAILABLE IN THE NEW CONTEXT
    "github_tag=$github_tag" >> $env:GITHUB_OUTPUT

    # Need to compress json to one line in order to be captured in GitHub Actions output
    $package_version_report_json = $package_version_report | ConvertTo-Json -Compress
    "package_version_report=$package_version_report_json" >> $env:GITHUB_OUTPUT

    $slack_message_package_info_json = $slack_message_package_info | ConvertTo-Json -Compress
    "slack_message_package_info=$slack_message_package_info_json" >> $env:GITHUB_OUTPUT
}

