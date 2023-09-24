param(
    [Parameter(Mandatory=$true)]
    $commit_message,
    [Parameter(Mandatory=$true)]
    $default_package_directory
)

Write-Host "commit message : $commit_message"
Write-Host "package directory: $default_package_directory"

git config user.email "dtcsalesforcedevops@va.gov"
git config user.name "salesforce-bot"

Write-Host "ALL CHANGES"
git status --porcelain

$all_package_changes = $( git status $default_package_directory --porcelain )
Write-Host "PACKAGE CHANGES"
Write-Host "all_package_changes: $all_package_changes"

if ( !(Test-Path .gitattributes) ) {

    Write-Host "CREATING GITATTRIBUTES FILE"

    $gitattributes_content = @"
# Ignore line ending changes for all files
* -text
"@

    New-Item -ItemType File -Name .gitattributes -Value $gitattributes_content
    git add .gitattributes
    git commit -m "adding .gitattributes file"
    git push origin
}

if ( $null -ne $all_package_changes -and $all_package_changes.count -gt 0 ) {

    git add $default_package_directory
    git status $default_package_directory
    git commit -m "$commit_message"
    git push origin 

    Write-Host "Updates committed"
    $committed = 'true'
    "committed=$committed" >> $env:GITHUB_OUTPUT

} else {

    Write-Host "NO PACKAGE CHANGES MADE"

}


