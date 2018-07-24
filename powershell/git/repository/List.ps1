# REPLACE WITH YOUR PAT (PERSONAL ACCESS TOKEN)
$Token = "PERSONAL ACCESS TOKEN"

# REPLACE WITH ACCOUNT NAME (accountName)
$accountName = ""

# REPLACE WITH PROJECT NAME (projectNAME)
$projectName = "servicenow"

$Authentication = [Text.Encoding]::ASCII.GetBytes(":$Token")
$Authentication = [System.Convert]::ToBase64String($Authentication)
$Headers = @{
    Authorization = ("Basic {0}" -f $Authentication)
}
$Uri = "https://$accountName.visualstudio.com/$projectName/_apis/git/repositories?api-version=4.1"
$Result = Invoke-RestMethod -Method Get -Uri $Uri -ContentType 'application/json' -Headers $Headers
$Result.value