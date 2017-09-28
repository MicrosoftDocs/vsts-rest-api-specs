---
title: Projects and teams REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) projects and teams REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Projects and Teams
---

# Projects and teams

A Visual Studio Team Services account has one or more team projects. Each team project has one or more teams that contribute to that project.

## Common tasks

### Get a list of team projects

Get the [team projects](./projects.md) in the account.

### Get a project's source control provider

Get a [team project's capabilities](./projects/list.md) to see whether it uses Git or TFVC for source control.

### Get the teams in a team project

1. Get a list of [teams](./teams.md) in a team project.
2. Get the [members](./members.md) of a team.

### Get the project collection

Each team project is in a project collection.
Right now, a Visual Studio Team Services account just has one project collection named "DefaultCollection" so you can use that assumption when you call other APIs.
You can also look up the [collection](./project-collections.md).

### Create a team project

Create a [team project](./projects/create.md) in a Visual Studio Team Services account. Currently, this is only supported on Visual Studio Team Services, but not on Team Foundation Server.

### Update a team project

Team projects can be updated:

1. Update the team project [description](./projects/update.md) or [name](./projects/update.md)
2. The update is asynchronous, so use the returned [operation](./projects/get.md)
to get the status of the update.

An operation can be in one of the following states:

| State Name    | Explanation
|:--------------|:-----------------
| Queued           | Team project update has been queued to run. 
| InProgress | Team project update currently being executed. 
| Succeeded      | Team project update was successfully completed. 
| Failed    | Team project updated did not succeed. 