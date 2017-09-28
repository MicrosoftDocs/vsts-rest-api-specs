---
title: Packaging REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) packaging REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Packaging
---

# Packaging

You can create [feeds](./feeds.md) and store [packages](./packages.md) in those feeds.
Feeds have [permissions](./permissions.md) which control who can read from, push to, and manage feeds.

You can also access [NuGet specific operations](./nuget.md) such as delete and delist.

## Common tasks

### Get a list of feeds
1. Look up the [feeds](./feeds.md#getfeeds) that you want to use.

### Create a feed
1. Create a new [feed](./feeds.md#createafeed).