# REPLACE WITH YOUR PAT (PERSONAL ACCESS TOKEN)
$Token = "PERSONAL ACCESS TOKEN"

# REPLACE WITH ACCOUNT NAME (accountName)
$accountName = "ACCOUNT NAME"

# REPLACE WITH PROJECT NAME (projectName)
$projectName = "PROJECT NAME"

# REPLACE WITH PROJECT UUID
$projectUUID = "PROJECT UUID"

$Authentication = [Text.Encoding]::ASCII.GetBytes(":$Token")
$Authentication = [System.Convert]::ToBase64String($Authentication)
$Headers = @{
    Authorization = ("Basic {0}" -f $Authentication)
}
$Body = @{
    name    = "AnotherRepositoryFORDEMO"
    project = @{
        id = $projectUUID
    }
} | ConvertTo-Json
$Uri = "https://$accountName.visualstudio.com/$projectName/_apis/git/repositories?api-version=4.1"
$Result = Invoke-RestMethod -Method Post -Uri $Uri -ContentType 'application/json' -Headers $Headers -Body $Body
$Result