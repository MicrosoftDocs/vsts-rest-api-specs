---
title: Graph REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services graph REST API
ms.assetid: 70F8A8F8-474C-4664-A26C-A5DC714E6242
ms.manager: douge
ms.author: elbatk
ms.date: 02/13/2018
ms.devlang: rest-api
service_description: Graph
---

# Graph

The Azure DevOps Services Graph API allows you to manage users, groups, and group memberships.

## Descriptors

VSIDs uniquely identity a user or group within an account. They do not uniquely identify users or groups in cross-account scenarios. Descriptors uniquely identify users and groups across all accounts. This is a very important distinction because our consumers are demanding more and more features that require pleasant experiences across multiple accounts. Using VSIDs leads to confusion, strange errors, and incorrect or unexpected behavior.

Descriptors provide a much better experience for cross account user/group management. Over time, we will be changing guidance and APIs to support VSIDs only for storage of a unique identifier to a user or group. Descriptors will be used to reference the user/group for a running system.

We do not recommend persisting descriptors because there are several scenarios where they can change overtime: editing the user in the AAD backing store and linking/unlinking an account will result in the user getting a new descriptor.

## Retrieving a descriptor from another identifiers

Some REST APIs, such as work item tracking or git, may reference return identifiers other than descriptors. We're working to change this long term but in the meantime, we offer a set of mechanisms to convert these identifiers to descriptors.

## Storage Keys

Storage Keys (previously known as VSIDs) are a GUID representation of a user or group that is unique in the scope of an account, but not across an organization. When storing information about a user, use the [StorageKeys](xref:vsts.graph.storagekeys) resource to translate the Descriptor returned by a given Graph API call into a Storage Key and store the resulting GUID. When retrieving data about a user, use the [Descriptors](xref:vsts.graph.descriptors) resource to translate a storage key into a descriptor for use in subsequent Graph API calls.

## Searching by UPN or Display Name

Often, identities are represented simply as display names such as _Jamal Hartnett_ or UPNs such as _jamal@contoso.com_. Use the [Subject Query](xref:vsts.graph.subjectquery) api to search for specify users by display name or UPN.

## Working with AAD users and groups

For Azure DevOps Services customers backing their accounts with Azure Active Directory (AAD), management of AAD users and groups should be performed with the [Azure AD Graph API Reference](https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/api-catalog).

The Azure DevOps Services Graph API can reference AAD user and groups but cannot be used ot modify them.