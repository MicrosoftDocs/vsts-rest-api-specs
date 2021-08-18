---
title: Permissions Report REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services permissions Report
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: marcpop
ms.author: marcpop
ms.date: 01/30/2020
ms.devlang: rest-api
---

# Permissions Report

Permissions reports can help administrators determine the **effective permissions** of users and groups upon securable resources in Azure DevOps. Generating a report for a resource (Git repository, branch, etc.) will list the **effective permissions**, upon that resource, for each user who has logged into the Azure DevOps organization and each group in the Azure DevOps organization. 

**Effective permissions**
* Effective permissions represent the true permissions a user or group has on a resource after considering directly assigned permissions upon the resource, any inherited permissions from the group hierarchy, and any inherited permissions from the resource hierachy. [Learn more about inherited permissions.](https://aka.ms/azure-devops-inheritance-and-security-groups )


## Common tasks

### Get permissions report status

1. [List](xref:vsts.permissionsreport.permissionsreport.list) the status for all available permissions reports
2. [Get](xref:vsts.permissionsreport.permissionsreport.get) the status for a specific permissions report by ID

### Create permissions report

1. [Queue](xref:vsts.permissionsreport.permissionsreport.create) a new permissions report to be created. Specify the specific resource details and the user/group descriptors to include in the report.  Specifying an empty descriptor list will list all users and groups in the organization.

### Download permissions report

1. [Download](xref:vsts.permissionsreport.permissionsreportdownload.download) a json permissions report that includes the users and groups specified at creation time for a specific resource node.  Use powerBI to view the data or write a tool to parse and filter the data.  Inherited permissions come from a parent group which can be viewed in the UI.
