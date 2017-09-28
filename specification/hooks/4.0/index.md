---
title: Service hooks REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) service hooks REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Service Hooks
---


# Service hooks

The service hook [publishers](./publishers.md) define a set of events. You create [subscriptions](./subscriptions.md) based on an event and select the 
service hook [consumer](./consumers.md) and action to take in response to that event from the publisher.

## Common tasks

### Set up a subscription

TODO: NEEDS UPDATING TO CONSUMER AND ACTIONS LINK
1. If you haven't already, set up your [consumer and actions](../../get-started/service-hooks/create-subscription.md).
2. Create a [subscription](./subscriptions/create.md) that invokes one of your actions when a particular event occurs.

### Get a list of publishers

Get the list of event [publishers](./publishers/list.md) for Visual Studio Team Services.