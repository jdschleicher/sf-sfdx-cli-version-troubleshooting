echo "Authenticating Salesforce DevHub Org"

PATH_TO_KEY_FILE="jwtkeyfile.key"

echo "CREATE KEYFILE"
echo $SF_DEVHUB_KEY_BASE64 | base64 -di > $PATH_TO_KEY_FILE

echo "RUN SFDX AUTHENTICATE COMMAND"
# export SFDX_AUDIENCE_URL=https://test.salesforce.com
sfdx auth:jwt:grant --clientid $SF_DEVHUB_CLIENTID --jwtkeyfile $PATH_TO_KEY_FILE --username $DEVHUB_ORG_USERNAME --setalias 'devhub' --instanceurl $SF_DEVHUB_ORG_URL -d -s


# display authorized salesforce orgs
sfdx auth:list
