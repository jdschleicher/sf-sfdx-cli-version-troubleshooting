function get_fake_github_cli_releases {

    $fake_github_cli_releases = @(
        'v0.851.918.1.published  v0.851.918.1 2023-03-06T15:35:54Z',
        'v0.293.315.6.published	 v0.293.315.6 2023-03-03T15:37:56Z',
        'v0.946.498.5.prerelease.perf Draft v0.946.498.5 2023-03-02T20:38:47Z',
        'v0.293.315.1.published  v0.293.315.1 2023-03-02T20:14:00Z',
        'v0.946.498.3.published  v0.946.498.3 2023-03-02T20:07:13Z',
        'v0.961.157.1.published  v0.961.157.1 2023-03-02T16:33:03Z',
        'v0.946.498.1.published  v0.946.498.1 2023-03-02T14:48:45Z',
        'v0.518.128.1.published  v0.518.128.1 2023-02-28T21:13:43Z',
        'v0.465.127.1.published  v0.465.127.1 2023-02-28T20:56:13Z',
        'v0.765.357.1.published  v0.765.357.1 2023-02-28T19:14:09Z',
        'v0.653.471.1.published  v0.653.471.1 2023-02-28T14:42:31Z',
        'v0.946.498.11.prerelease.perf Draft v0.946.498.11 2023-03-02T20:39:47Z',
        'v0.946.498.12.prerelease.perf Draft v0.946.498.12 2023-04-02T20:38:47Z',
        'v0.956.135.1.published  v0.956.135.1 2023-02-28T14:39:33Z',
        'v0.834.274.1.published  v0.834.274.1 2023-02-28T14:29:38Z',
        'v0.326.832.1.published  v0.326.832.1 2023-02-28T14:27:31Z',
        'v0.192.714.1.published  v0.192.714.1 2023-02-28T14:01:39Z',
        'v0.354.396.2.published  v0.354.396.2 2023-02-27T22:21:01Z',
        'v0.721.738.4.published  v0.721.738.4 2023-01-19T15:35:29Z',
        'v0.721.738.2.published  v0.721.738.2 2023-01-15T01:17:51Z',
        'v0.139.513.2.published  v0.139.513.2 2023-01-14T16:37:00Z',
        'v0.395.216.2.published  v0.395.216.2 2023-01-13T22:02:26Z',
        'v0.764.179.2.published  v0.764.179.2 2023-01-13T21:25:13Z',
        'v0.973.126.2.published  v0.973.126.2 2023-01-13T19:03:25Z',
        'v0.391.378.2.published  v0.391.378.2 2023-01-13T15:31:19Z',
        'v0.853.412.2.published  v0.853.412.2 2022-12-22T17:44:13Z',
        'v0.278.567.2.published  v0.278.567.2 2022-12-22T17:09:25Z',
        'v0.111.111.2.published  v0.111.111.2 2022-12-21T17:16:31Z',
        'v0.467.236.2.published  v0.467.236.2 2022-12-02T22:30:54Z',
        'v0.764.325.2.published  v0.764.325.2 2022-12-02T21:04:22Z',
        'v0.0.999.3.published  v0.0.999.3 2022-11-18T16:10:21Z',
        'v1.1.0.3.published	 v1.1.0.3 2022-10-25T21:04:20Z',
        'v1.0.0.9.published	 v1.0.0.9 2022-10-25T17:46:35Z',
        'v1.0.0.3.published	Latest v1.0.0.3 2022-10-18T02:19:28Z'
    )

<# Get Example Body to easily reproduce CLI call
1. Adjust lines so they mimic the correct split result
2. Adjust or add a new array line to the fake cli return that also has draft included as the state, so we have one more result to test out the functionality that pulls in the latest
3. 4+ new Unit tests (test new and existing) 
#>
    $fake_github_cli_releases_array = $fake_github_cli_releases -replace "`n" , ''
    $fake_github_cli_releases_array = $fake_github_cli_releases_array.split("`r")

    $fake_github_cli_releases_array

}

function get_fake_github_draft_string_releases {
    $fake_github_draft_string_releases = @(
        'v0.851.918.1.published  v0.851.918.1 2023-03-06T15:35:54Z',
        "v0.946.498.11.prerelease.perf Draft v0.946.498.11 3/2/2023 3:39:47 PM",
        "v0.946.498.12.prerelease.perf Draft v0.946.498.12 4/2/2023 4:38:47 PM"
    )

    $fake_github_draft_string_releases
    
}

function get_fake_converted_github_releases {
    $fake_converted_github_releases = @(
        "v0.851.918.1.published               v0.851.918.1        3/6/2023 10:35:54 AM",
        "v0.293.315.6.published               v0.293.315.6        3/3/2023 10:37:56 AM",
        "v0.946.498.5.prerelease.perf  Draft  v0.946.498.5        3/2/2023 3:38:47 PM",
        "v0.293.315.1.published               v0.293.315.1        3/2/2023 3:14:00 PM",
        "v0.946.498.3.published               v0.946.498.3        3/2/2023 3:07:13 PM",
        "v0.961.157.1.published               v0.961.157.1        3/2/2023 11:33:03 AM",
        "v0.946.498.1.published               v0.946.498.1        3/2/2023 9:48:45 AM",
        "v0.518.128.1.published               v0.518.128.1        2/28/2023 4:13:43 PM",
        "v0.465.127.1.published               v0.465.127.1        2/28/2023 3:56:13 PM",
        "v0.765.357.1.published               v0.765.357.1        2/28/2023 2:14:09 PM",
        "v0.653.471.1.published               v0.653.471.1        2/28/2023 9:42:31 AM",
        "v0.946.498.11.prerelease.perf Draft  v0.946.498.11       3/2/2023 3:39:47 PM",
        "v0.946.498.12.prerelease.perf Draft  v0.946.498.12       4/2/2023 4:38:47 PM",
        "v0.956.135.1.published               v0.956.135.1        2/28/2023 9:39:33 AM",
        "v0.834.274.1.published               v0.834.274.1        2/28/2023 9:29:38 AM",
        "v0.326.832.1.published               v0.326.832.1        2/28/2023 9:27:31 AM",
        "v0.192.714.1.published               v0.192.714.1        2/28/2023 9:01:39 AM",
        "v0.354.396.2.published               v0.354.396.2        2/27/2023 5:21:01 PM",
        "v0.721.738.4.published               v0.721.738.4        1/19/2023 10:35:29 AM",
        "v0.721.738.2.published               v0.721.738.2        1/14/2023 8:17:51 PM",
        "v0.139.513.2.published               v0.139.513.2        1/14/2023 11:37:00 AM",
        "v0.395.216.2.published               v0.395.216.2        1/13/2023 5:02:26 PM",
        "v0.764.179.2.published               v0.764.179.2        1/13/2023 4:25:13 PM",
        "v0.973.126.2.published               v0.973.126.2        1/13/2023 2:03:25 PM",
        "v0.391.378.2.published               v0.391.378.2        1/13/2023 10:31:19 AM",
        "v0.853.412.2.published               v0.853.412.2        12/22/2022 12:44:13 PM",
        "v0.278.567.2.published               v0.278.567.2        12/22/2022 12:09:25 PM",
        "v0.111.111.2.published               v0.111.111.2        12/21/2022 12:16:31 PM",
        "v0.467.236.2.published               v0.467.236.2        12/2/2022 5:30:54 PM",
        "v0.764.325.2.published               v0.764.325.2        12/2/2022 4:04:22 PM",
        "v0.0.999.3.published                 v0.0.999.3          11/18/2022 11:10:21 AM",
        "v1.1.0.3.published                   v1.1.0.3            10/25/2022 5:04:20 PM",
        "v1.0.0.9.published                   v1.0.0.9            10/25/2022 1:46:35 PM",
        "v1.0.0.3.published            Latest v1.0.0.3            10/17/2022 10:19:28 PM"
    )
  
    $fake_converted_github_releases

}

function get_fake_github_draft_releases_by_tag {
   $fake_github_draft_releases_by_tag = @(
    "v0.946.498.11.prerelease.perf Draft v0.946.498.11 3/2/2023 3:39:47 PM",
    "v0.946.498.12.prerelease.perf Draft v0.946.498.12 4/2/2023 4:38:47 PM"
   )

   $fake_github_draft_releases_by_tag
}

function get_fake_github_release_object {

    $fake_github_release_object = @(
        "v0.946.498.12.prerelease.perf Draft v0.946.498.12 4/2/2023 4:38:47 PM"
    )

    $fake_github_release_object

}

function get_fake_github_releases {

    $fake_github_releases = @"
    [
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228284",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228284/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228284/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-39782e0c5c38b58da0ec",
          "id": 117228284,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_ML8",
          "tag_name": "v1.888.888",
          "target_commitish": "master",
          "name": "v1.888.888",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-08-14T21:04:09Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228397",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228397/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228397/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-24e0beceed27f92a329d",
          "id": 117228397,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_MNt",
          "tag_name": "v1.876.876",
          "target_commitish": "master",
          "name": "v1.876.876",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-08-14T21:04:46Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228261",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228261/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228261/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-0f95455335bf45da7ed8",
          "id": 117228261,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_MLl",
          "tag_name": "v1.99.99.3",
          "target_commitish": "master",
          "name": "v1.99.99.3",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-08-14T21:03:54Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228321",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228321/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117228321/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-3ddfa0d2db3ac9794859",
          "id": 117228321,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_MMh",
          "tag_name": "v0.333.22",
          "target_commitish": "master",
          "name": "v0.333.22",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-08-14T21:04:27Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329146",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329146/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329146/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-959d7f42f92b91b1347f",
          "id": 117329146,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_kz6",
          "tag_name": "v1.2.0.6",
          "target_commitish": "master",
          "name": "v1.2.0.6",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-07-13T14:19:21Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329229",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329229/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329229/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-756537d8c8914c2b97a6",
          "id": 117329229,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_k1N",
          "tag_name": "v1.1.1.1",
          "target_commitish": "master",
          "name": "v1.1.1.1",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-07-11T14:23:12Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329271",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329271/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329271/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-517b678a36341f60948b",
          "id": 117329271,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_k13",
          "tag_name": "v1.0.0.64",
          "target_commitish": "master",
          "name": "v1.0.0.64",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-07-07T19:41:01Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329332",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329332/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329332/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-ff32c1fd5c91e4f08006",
          "id": 117329332,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_k20",
          "tag_name": "v1.0.0.41",
          "target_commitish": "master",
          "name": "v1.0.0.41",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-06-13T17:48:18Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329367",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329367/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329367/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-0be71dbfcb3ca93d40b0",
          "id": 117329367,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_k3X",
          "tag_name": "v1.0.0.19",
          "target_commitish": "master",
          "name": "v1.0.0.19",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-06-08T14:24:57Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        },
        {
          "url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329458",
          "assets_url": "https://api.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329458/assets",
          "upload_url": "https://uploads.github.com/repos/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/117329458/assets{?name,label}",
          "html_url": "https://github.com/department-of-veterans-affairs/dtc-dx-qa-sit-flow-repo/releases/tag/untagged-c86f762cc4bda5ecdd46",
          "id": 117329458,
          "author": {
            "login": "ethanjohnson20",
            "id": 106770405,
            "node_id": "U_kgDOBl0v5Q",
            "avatar_url": "https://avatars.githubusercontent.com/u/106770405?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ethanjohnson20",
            "html_url": "https://github.com/ethanjohnson20",
            "followers_url": "https://api.github.com/users/ethanjohnson20/followers",
            "following_url": "https://api.github.com/users/ethanjohnson20/following{/other_user}",
            "gists_url": "https://api.github.com/users/ethanjohnson20/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ethanjohnson20/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ethanjohnson20/subscriptions",
            "organizations_url": "https://api.github.com/users/ethanjohnson20/orgs",
            "repos_url": "https://api.github.com/users/ethanjohnson20/repos",
            "events_url": "https://api.github.com/users/ethanjohnson20/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ethanjohnson20/received_events",
            "type": "User",
            "site_admin": false
          },
          "node_id": "RE_kwDOIGZ3Sc4G_k4y",
          "tag_name": "v0.615.596.2",
          "target_commitish": "master",
          "name": "v0.615.596.2",
          "draft": true,
          "prerelease": false,
          "created_at": "2023-06-01T14:24:01Z",
          "published_at": null,
          "assets": [],
          "tarball_url": null,
          "zipball_url": null,
          "body": null
        }
      ]
      
"@

$fake_github_releases

}
