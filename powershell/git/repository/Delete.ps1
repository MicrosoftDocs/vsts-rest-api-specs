# REPLACE WITH YOUR PAT (PERSONAL ACCESS TOKEN)
$Token = "PERSONAL ACCESS TOKEN"

# REPLACE WITH ACCOUNT NAME (accountName)
$accountName = "ACCOUNT NAME"

# REPLACE WITH PROJECT NAME (projectNAME)
$projectName = "PROJECT NAME"

# REPLACE WITH REPOSITORY ID (repositoryID)
$repositoryID = "REPOSITORY UUID"

$Authentication = [Text.Encoding]::ASCII.GetBytes(":$Token")
$Authentication = [System.Convert]::ToBase64String($Authentication)
$Headers = @{
    Authorization = ("Basic {0}" -f $Authentication)
}
$Uri = "https://$accountName.visualstudio.com/$projectName/_apis/git/repositories/$($repositoryID)?api-version=4.1"
Invoke-RestMethod -Method Delete -Uri $Uri -ContentType 'application/json' -Headers $Headers