
function get_fake_metadatapackage_detail_by_package_name {
    $fake_metadatapackage_detail_json = @"
{
  "status": 0,
  "result": {
    "records": [
      {
        "attributes": {
          "type": "MetadataPackage",
          "url": "/services/data/v58.0/sobjects/MetadataPackage/0333d0000008T69AAE"
        },
        "Id": "0333d0000008T69AAE",
        "Name": "dtc-dx-qa-sit-flow",
        "NamespacePrefix": null,
        "PackageCategory": "Package2",
        "SystemModstamp": "2023-05-28T03:21:06.000+0000"
      }
    ],
    "totalSize": 1,
    "done": true
  },
  "warnings": []
}
    
"@

    $fake_metadatapackage_detail_json
}

function get_fake_package_version_by_version_and_metadatapackage_id_and_build_version {

    $fake_package_version_by_metadatapackage_id_json = @"
{
    "status": 0,
    "result": {
        "records": [
        {
            "attributes": {
            "type": "MetadataPackageVersion",
            "url": "/services/data/v58.0/sobjects/MetadataPackageVersion/04tOE0000000RqLYAU"
            },
            "Id": "04tOE0000000RqLYAU",
            "MetadataPackageId": "0333d0000008T69AAE",
            "Name": "1.0.0",
            "ReleaseState": "Beta",
            "MajorVersion": 1,
            "MinorVersion": 0,
            "PatchVersion": 0,
            "BuildNumber": 37,
            "SystemModstamp": "2023-06-13T15:43:29.000+0000",
            "IsDeprecated": false
        }
        ],
        "totalSize": 1,
        "done": true
    },
    "warnings": []
}
"@

    $fake_package_version_by_metadatapackage_id_json
    
}