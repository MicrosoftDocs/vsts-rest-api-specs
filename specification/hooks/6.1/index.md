---
title: Service hooks REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services service hooks REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Service Hooks
---


# Service hooks

The service hook [publishers](xref:vsts.hooks.publishers) define a set of events. You create [subscriptions](xref:vsts.hooks.subscriptions) based on an event and select the 
service hook [consumer](xref:vsts.hooks.consumers) and action to take in response to that event from the publisher.

## Common tasks

### Set up a subscription

1. If you haven't already, set up your [consumer and actions](https://docs.microsoft.com/en-us/vsts/service-hooks/consumers?toc=/vsts/integrate/toc.json&bc=/vsts/integrate/breadcrumb/toc.json).
2. Create a [subscription](xref:vsts.hooks.subscriptions.create) that invokes one of your actions when a particular event occurs.

### Get a list of publishers

Get the list of event [publishers](xref:vsts.hooks.publishers.list) for Azure DevOps Services.