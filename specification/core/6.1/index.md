---
title: Projects and teams REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services projects and teams REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Projects and Teams
---

# Projects and teams

An Azure DevOps Services organization has one or more team projects. Each team project has one or more teams that contribute to that project.

## Common tasks

### Get a list of team projects

Get the [team projects](xref:vsts.core.projects.list) in the account.

### Get a project's source control provider

Get a [team project's capabilities](xref:vsts.core.projects.list) to see whether it uses Git or TFVC for source control.

### Get the teams in a team project

1. Get a list of [teams](xref:vsts.core.teams.getallteams) in a team project.
2. Get the [members](xref:vsts.core.teams.getteammemberswithextendedproperties) of a team.