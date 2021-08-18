---
title: Release REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services release REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Release
---

# Release Management

**Using on-premises:** An earlier, and slightly different, version of this Release Management API is available in Team Foundation Server 2015 Update 2. To use, you must specify an API version of **2.2-preview.1**.

New release references a release definition to deploy an application comprising of one/more artifacts.
A release process goes through a set of approval requests.

## Common tasks

### Create a release definition

1. Add one or more environments to release [definition](xref:vsts.release.definitions).
2. Add tasks to each environment.
3. Add [approvals](xref:vsts.release.approvals) or make them automated, for each environment.
4. Save release [definition](xref:vsts.release.definitions)

### Start a release

1. Get the ID of the release [definition](xref:vsts.release.definitions.list) that you want to use.
3. Create a [release](xref:vsts.release.releases.create).
3. Get the ID of the release from the response so you can use it later.
4. If required, abandon a [release](xref:vsts.release.releases).

### Get a release details

1. Get a list of [releases](xref:vsts.release.releases.list) and find the ID of the release you're interested in.
2. Get the [details](xref:vsts.release.releases.getrelease) about the release.
4. Get the [approvals](xref:vsts.release.approvals.list) required for the release.
