# Status API

The Status API provides the ability to query status information for Azure DevOps all-up, or status information scoped to a service and/or geography of Azure DevOps. You can use the Status API to query status information and drive personalized workflows, and/or surface it in your internal tools.

Status API results are cached for 60 seconds, so we recommend calling the Status API at most once per minute.

## Common tasks

### Get service health information

1. Get all-up [service health information](xref:vsts.status.health.get#get-service-health).
2. Get [service health information](xref:vsts.status.health.get#get-service-health-for-one-or-more-geographies) for a particular geography.
3. Get [service health information](xref:vsts.status.health.get#get-service-health-for-one-or-more-services-and-one-or-more-geographies) for a particular service and geography.
