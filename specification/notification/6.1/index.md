---
title: Notifications REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services notifications REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Notifications
---

# Notification

Notifications help teams stay informed about activity in their Azure DevOps projects. With notifications, users and teams are notified when changes occur to work items, code reviews, pull requests, source control files, and builds. For example, you can get notified whenever a bug that you opened is resolved or a work item is assigned to you. The primary delivery channel for notifications today is email. [Learn more](https://aka.ms/vstsmanagenotifications) about notifications.

The Notification APIs primarily provide the ability to create and manage subscriptions. A subscription defines the conditions by which a user or team should be notified, and where notifications should be sent. A subscription can be just for you, or if you are a team admin, can be shared by everyone in the team. 
