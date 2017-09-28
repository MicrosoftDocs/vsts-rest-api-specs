---
title: Build REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) Build REST API
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Build
---

# Visual Studio Team Services Build REST API

## Common tasks

### Run a build

1. Get the ID of the build [definition](./definitions/list.md) that you want to use.
2. Create a [build](./builds/queue.md).
3. Get the ID of the build from the response so you can use it later.
4. Get the [build](./builds/get.md) using the ID.

### Get a build

1. Get a list of [builds](./builds.md) and find the ID of the build you're interested in.
2. Get the [details](./builds/get.md) about the build.

### Tag a build

1. Add the [tag](./tags/addbuildtag.md) to the build.
2. View the [tags](./tags/getbuildtags.md) associated with the build.
3. You can search [builds](./builds/list.md) by tags
4. You can also see all [tags](./tags/gettags.md) across all builds.