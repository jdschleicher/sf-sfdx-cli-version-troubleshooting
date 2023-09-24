echo "INITIALIZING GITHUB SSH KEY FILE"
echo "$GITHUB_SSH_KEY_BASE64" | base64 -di > ~/.ssh/github_ssh
chmod 400 ~/.ssh/github_ssh

echo "TESTING SSH-AGENT"
eval "$(ssh-agent -s)"

echo "REGISTERING SSH KEY WITH LOCAL SSH AGENT"
ssh-add ~/.ssh/github_ssh

# connect to GitHub repository via SSH 
echo "SETTING GITHUB REMOTE TO USE SSH"
git remote set-url origin git@github.com:jaredatmba/dc-living.git

# verify that git is authenticated
echo "VERIFYING AUTHENTICATION VIA GIT PULL"
echo "git status"
git status
echo "git checkout main"
git checkout main
echo "git pull"
git pull
echo "git status"
git status
