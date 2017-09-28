---
title: Dashboards and widgets REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) dashboards REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Dashboards and Widgets
---

# Dashboards

Each team in Visual Studio Team Services (VSTS) can have one or more dashboards. Each dashboard contains one or more widgets. 


## Data versioning
<a name="dataversioning" />

The rest APIs have multi-user concurrency support for a list of widgets and for each widget, separately. This prevents one user of the API from overwriting changes of another user.

Lists of widgets are versioned using the eTag header in the list APIs. You must retrieve current eTag, and then provide that same eTag when updating the list.

The widget contract also contains the eTag property and works same way. This versions the settings of a single widget. This version is separate from the list version and you must provide it when updating a single widget.

## Common tasks

### Create a new dashboard

[Add a team dashboard](./dashboards/create.md).

### Add a new widget to a dashboard

[Add](./widgets/create.md) or [delete](./widgets/delete.md) a widget from a given dashboard.