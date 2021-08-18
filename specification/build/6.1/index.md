---
title: Build REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services Build REST API
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Build
---

# Azure DevOps Services Build REST API

* [Builds](xref:vsts.build.builds)
* [Definitions](xref:vsts.build.builds)
* [Definition Templates](xref:vsts.build.templates)

## Common tasks

### Run a build

1. Get the ID of the build [definition](xref:vsts.build.definitions.list) that you want to use.
2. Create a [build](xref:vsts.build.builds.queue).
3. Get the ID of the build from the response so you can use it later.
4. Get the [build](xref:vsts.build.builds.get) using the ID.

### Get a build

1. Get a list of [builds](xref:vsts.build.builds.list) and find the ID of the build you're interested in.
2. Get the [details](xref:vsts.build.builds.get) about the build.

### Tag a build

1. Add the [tag](xref:vsts.build.tags.addbuildtag) to the build.
2. View the [tags](xref:vsts.build.tags.getbuildtags) associated with the build.
3. You can search [builds](xref:vsts.build.builds.list) by tags
4. You can also see all [tags](xref:vsts.build.tags.gettags) across all builds.