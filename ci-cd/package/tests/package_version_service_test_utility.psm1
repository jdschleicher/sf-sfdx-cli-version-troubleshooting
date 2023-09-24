

function get_fake_package_version_skip_validation_report_json {

    $fake_json_package_version_report = @"
    {
        "status": 0,
        "result": {
          "attributes": {
            "type": "Package2Version",
            "url": "/services/data/v55.0/tooling/sobjects/Package2Version/05i3d000000025mAAA"
          },
          "Package2Id": "0Ho3d000000004cCAA",
          "SubscriberPackageVersionId": "04t3d0000000VcgAAE",
          "Name": "1.0.0",
          "Description": null,
          "Tag": null,
          "Branch": null,
          "AncestorId": "N/A",
          "ValidationSkipped": true,
          "MajorVersion": 1,
          "MinorVersion": 0,
          "PatchVersion": 0,
          "BuildNumber": 334,
          "IsReleased": false,
          "CodeCoverage": "N/A",
          "HasPassedCodeCoverageCheck": "N/A",
          "Package2": {
            "attributes": {
              "type": "Package2",
              "url": "/services/data/v55.0/tooling/sobjects/Package2/0Ho3d000000004cCAA"
            },
            "IsOrgDependent": "No"
          },
          "ReleaseVersion": 55,
          "BuildDurationInSeconds": 2,
          "HasMetadataRemoved": "N/A",
          "Version": "1.0.0.334",
          "AncestorVersion": "N/A"
        }
      }

"@

    $fake_json_package_version_report

}

function get_fake_package_version_full_validation_report_json {

  $fake_json_package_version_report = @"
  {
      "status": 0,
      "result": {
        "attributes": {
          "type": "Package2Version",
          "url": "/services/data/v55.0/tooling/sobjects/Package2Version/05i3d000000025mAAA"
        },
        "Package2Id": "0Ho3d000000004cCAA",
        "SubscriberPackageVersionId": "04t3d0000000VcgAAE",
        "Name": "1.0.0",
        "Description": null,
        "Tag": null,
        "Branch": null,
        "AncestorId": "N/A",
        "ValidationSkipped": false,
        "MajorVersion": 1,
        "MinorVersion": 0,
        "PatchVersion": 0,
        "BuildNumber": 334,
        "IsReleased": false,
        "CodeCoverage": "N/A",
        "HasPassedCodeCoverageCheck": "N/A",
        "Package2": {
          "attributes": {
            "type": "Package2",
            "url": "/services/data/v55.0/tooling/sobjects/Package2/0Ho3d000000004cCAA"
          },
          "IsOrgDependent": "No"
        },
        "ReleaseVersion": 55,
        "BuildDurationInSeconds": 2,
        "HasMetadataRemoved": "N/A",
        "Version": "1.0.0.334",
        "AncestorVersion": "N/A"
      }
    }

"@

  $fake_json_package_version_report

}

function get_fake_package_version_report {
  
  $fake_package_version_report_json = @"

  {
    "status": 0,
    "result": {
      "attributes": {
        "type": "Package2Version",
        "url": "/services/data/v55.0/tooling/sobjects/Package2Version/05i3d000000026pAAA"
      },
      "Package2Id": "0Ho3d000000005BCAQ",
      "SubscriberPackageVersionId": "04t3d0000000Ve8AAE",
      "Name": "1.7.0",
      "Description": null,
      "Tag": "validated_04t3d0000000Ve3AAE_nextversionfix_2022.09.08_15:03_+00:00_2022.09.08_15:08_+00:00",
      "Branch": null,
      "AncestorId": "N/A",
      "ValidationSkipped": false,
      "MajorVersion": 1,
      "MinorVersion": 7,
      "PatchVersion": 0,
      "BuildNumber": 2,
      "IsReleased": false,
      "CodeCoverage": {
        "apexCodeCoveragePercentage": 90
      },
      "HasPassedCodeCoverageCheck": true,
      "Package2": {
        "attributes": {
          "type": "Package2",
          "url": "/services/data/v55.0/tooling/sobjects/Package2/0Ho3d000000005BCAQ"
        },
        "IsOrgDependent": "No"
      },
      "ReleaseVersion": 55,
      "BuildDurationInSeconds": 260,
      "HasMetadataRemoved": "N/A",
      "Version": "1.7.0.2",
      "AncestorVersion": "N/A"
    }
  }

"@

  $fake_package_version_report_json

}

function get_fake_hotfix_package_version_report {
  
  $fake_hotfix_package_version_report_json = @"

  {
    "status": 0,
    "result": {
      "attributes": {
        "type": "Package2Version",
        "url": "/services/data/v55.0/tooling/sobjects/Package2Version/05i3d000000026pAAA"
      },
      "Package2Id": "0Ho3d000000005BCAQ",
      "SubscriberPackageVersionId": "04t3d0000000Ve8AAE",
      "Name": "1.7.2",
      "Description": null,
      "Tag": "validated_04t3d0000000Ve3AAE_nextversionfix_2022.09.08_15:03_+00:00_2022.09.08_15:08_+00:00",
      "Branch": null,
      "AncestorId": "N/A",
      "ValidationSkipped": false,
      "MajorVersion": 1,
      "MinorVersion": 7,
      "PatchVersion": 2,
      "BuildNumber": 2,
      "IsReleased": false,
      "CodeCoverage": {
        "apexCodeCoveragePercentage": 90
      },
      "HasPassedCodeCoverageCheck": true,
      "Package2": {
        "attributes": {
          "type": "Package2",
          "url": "/services/data/v55.0/tooling/sobjects/Package2/0Ho3d000000005BCAQ"
        },
        "IsOrgDependent": "No"
      },
      "ReleaseVersion": 55,
      "BuildDurationInSeconds": 260,
      "HasMetadataRemoved": "N/A",
      "Version": "1.7.2.2",
      "AncestorVersion": "N/A"
    }
  }

"@

  $fake_hotfix_package_version_report_json

}