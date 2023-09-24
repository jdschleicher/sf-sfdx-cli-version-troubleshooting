
echo "DELETING SCRATCH ORG"

echo "DEVHUB ORG LIMITS BEFORE"
sfdx force:limits:api:display -u $DEVHUB_ALIAS > sfdx_force_limits_api_display.txt
head -n 1 sfdx_force_limits_api_display.txt 
cat sfdx_force_limits_api_display.txt | grep Scratch
cat sfdx_force_limits_api_display.txt | grep Package

echo "DELETING SCRATCH ORG"
echo "y" | sfdx force:org:delete -u $SCRATCH_ORG_ALIAS

echo "LISTING AUTHORIZED ORGS"
sfdx auth:list

echo "DEVHUB ORG LIMITS AFTER"
sfdx force:limits:api:display -u $DEVHUB_ALIAS > sfdx_force_limits_api_display.txt
head -n 1 sfdx_force_limits_api_display.txt 
cat sfdx_force_limits_api_display.txt | grep Scratch
cat sfdx_force_limits_api_display.txt | grep Package
