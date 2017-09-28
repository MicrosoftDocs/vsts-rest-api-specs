---
title: Release REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) release REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Release
---

# Release Management

**Using on-premises:** An earlier, and slightly different, version of this Release Management API is available in Team Foundation Server 2015 Update 2. To use, you must specify an API version of **2.2-preview.1**.

New release references a release definition to deploy an application comprising of one/more artifacts.
A release process goes through a set of approval requests.

## Common tasks

### Create a release definition

1. Add one or more environments to release [definition](./definitions.md).
2. Add tasks to each environment.
3. Add [approvals](./approvals.md) or make them automated, for each environment.
4. Save release [definition](./definitions.md)

### Start a release

1. Get the ID of the release [definition](./definitions.md) that you want to use.
3. Create a [release](./releases.md).
3. Get the ID of the release from the response so you can use it later.
4. If required, abandon a [release](./releases.md).

### Get a release details

1. Get a list of [releases](./releases.md) and find the ID of the release you're interested in.
2. Get the [details](./releases/get.md) about the release.
4. Get the [approvals](./approvals.md) required for the release.
