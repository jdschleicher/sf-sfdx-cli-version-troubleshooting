echo "Authenticating GitHub + Git"
# echo "ENVIRONMENT VARIABLES:"
# echo "$GITHUB_ACCESS_TOKEN"
echo "$GITHUB_ACCESS_TOKEN" | gh auth login --with-token

# verify that GitHub authenticated
gh auth status
