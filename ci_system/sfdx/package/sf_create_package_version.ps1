param(
    $devhub_alias,
    $package_alias
)


sf package version create --target-dev-hub $devhub_alias --package $package_alias --code-coverage --installation-key-bypass --wait 120 --json --verbose -dev-debug --preserve
