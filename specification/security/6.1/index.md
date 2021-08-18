---
title: Security REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services security REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Security
---

# Security

Data stored in security namespaces are used to determine whether an user has permissions to perform a specific action on a specific resource.

Typically, each family of resources (work items, Git repositories, etc.) is secured using a different namespace.
Each security namespace contains zero or more access control lists.
Each access control list contains a token, an inherit flag and a set of zero or more access control entries. 
Each access control entry contains an identity descriptor, an allowed permissions bitmask and an denied permissions bitmask.

Tokens are arbitrary strings representing resources in Azure DevOps. Token format differs per resource type, however **hierarchy** and **separator characters** are common between all tokens.

**Hierarchy**
* A security namespace can be either hierarchical or flat.
* Tokens in a hierarchical namespace exist in a hierarchy with effective permissions being inherited from parent tokens to child tokens.
* Tokens in a flat namespace have no concept of a parent-child relationship between any two tokens.

**Separator character**
* Tokens in a hierarchical namespace either have a fixed length for each path part, or variable length.
* If the tokens have variable-length path parts, then a separator character is used to distinguish where one path part ends and another begins.

In addition to **hierarchy** and **separator characters** the contents of tokens vary depending on the needs of the resource.

## Common tasks

### Get security namespaces

Get a list of [security namespaces](xref:vsts.security.securitynamespaces.query).

### Get, add, and remove access control lists

1. [Get](xref:vsts.security.accesscontrollists.setaccesscontrollists) a list of access control lists in a security namespace.
2. [Add](xref:vsts.security.accesscontrollists.setaccesscontrollists) a list of access control lists to a security namespace.
2. [Remove](xref:vsts.security.accesscontrollists.removeaccesscontrollists) a list of access control lists from a security namespace.

### Add and remove access control entries

1. [Add](xref:vsts.security.accesscontrolentries.setaccesscontrolentries) a list of access control entries to an access control list.
2. [Remove](xref:vsts.security.accesscontrolentries.removeaccesscontrolentries) a list of access control entries from an access control list.

### Evaluate effective permissions

Determine if an identity has the [requested permissions](xref:vsts.security.permissions.haspermissions) on a token or a list of tokens.

### Selectively remove permissions

[Remove permissions](xref:vsts.security.permissions.removepermission) from an access control entry.