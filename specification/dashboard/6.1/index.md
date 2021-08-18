---
title: Dashboards and widgets REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services dashboards REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Dashboards and Widgets
---

# Dashboards

Each team in Azure DevOps Services can have one or more dashboards. Each dashboard contains a set of widgets. 


## Data versioning
<a name="dataversioning" />

The rest APIs have multi-user concurrency support for a list of widgets and for each widget, separately. This prevents one user of the API from overwriting changes of another user.

Lists of widgets are versioned using the eTag header in the list APIs. You must retrieve current eTag, and then provide that same eTag when updating the list.

The widget contract also contains the eTag property and works same way. This versions the settings of a single widget. This version is separate from the list version and you must provide it when updating a single widget.

## Common tasks

### Create a new dashboard

[Add a team dashboard](xref:vsts.dashboard.dashboards.create).

### Add a new widget to a dashboard

[Add](xref:vsts.dashboard.widgets.create) or [delete](xref:vsts.dashboard.widgets.delete) a widget from a given dashboard.