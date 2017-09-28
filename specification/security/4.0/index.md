---
title: Security REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) security REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Security
---

# Security

Data stored in security namespaces are used to determine whether an user has permissions to perform a specific action on a specific resource.

Typically, each family of resources (work items, Git repositories, etc.) is secured using a different namespace.
Each security namespace contains zero or more access control lists.
Each access control list contains a token, an inherit flag and a set of zero or more access control entries. 
Each access control entry contains an identity descriptor, an allowed permissions bitmask and an denied permissions bitmask.

## Common tasks

### Get security namespaces

Get a list of [security namespaces](./securitynamespaces/list.md).

### Change the inherit flag for a token

Set the [inherit flag](./securitynamespaces/setinheritflag.md) for an access control list.

### Get, add, and remove access control lists

1. [Get](./accesscontrollists/get.md) a list of access control lists in a security namespace.
2. [Add](./accesscontrollists/add.md) a list of access control lists to a security namespace.
2. [Remove](./accesscontrollists/remove.md) a list of access control lists from a security namespace.

### Add and remove access control entries

1. [Add](./accesscontrolentries/add.md) a list of access control entries to an access control list.
2. [Remove](./accesscontrolentries/remove.md) a list of access control entries from an access control list.

### Evaluate effective permissions

Determine if an identity has the [requested permissions](./permissions/haspermissions.md) on a token or a list of tokens.

### Selectively remove permissions

[Remove permissions](./permissions/removepermission.md) from an access control entry.