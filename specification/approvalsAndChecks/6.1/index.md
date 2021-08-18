---
title: Checks REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services Checks REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: ammohant
ms.author: moanjum
ms.date: 19/11/2020
ms.devlang: rest-api
service_description: Checks
---

# Approvals and Checks

Pipelines rely on resources such as environments, service connections, agent pools, variable groups, and secure files. Checks enable the resource owner to specify conditions that must be satisfied before a stage in any pipeline can consume a resource. [Learn more](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/approvals?view=azure-devops&tabs=check-pass).

Pipeline Checks APIs provide the ability to create and modify checks, manage approvals and query evaluation details.

## Common tasks

### Check configuration on a resource
1. Add Check [configuration](xref:vsts.approvalsandchecks.checkconfigurations.add).
2. List all check [configurations](xref:vsts.approvalsandchecks.checkconfigurations.list) on a resource.

### Approvals
1. Get an [approval](xref:vsts.approvalsandchecks.approvals.get) using Id.
2. Approve an [approval](xref:vsts.approvalsandchecks.approvals.update).

### Permissions
1. Get authorised [pipelines](xref:vsts.approvalsandchecks.pipelinepermissions.get) for a resource.
2. Update pipeline [permissions](xref:vsts.approvalsandchecks.pipelinepermissions) for a resource.

### Check Evaluation
1. Initiate an [evaluation](xref:vsts.approvalsandchecks.checkevaluations.evaluate) for a check in a pipeline.
2. Get details for a specific check [evaluation](xref:vsts.approvalsandchecks.checkevaluations.get).

