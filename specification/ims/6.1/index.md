---
title: Identities REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services identities REST API
ms.manager: ramrajesh
ms.author: parsamzand
ms.date: 04/20/2020
ms.devlang: rest-api
service_description: Identities
---

# Identities

Use the Azure DevOps Identities API to find the legacy identity descriptors for users and groups. Identities can be searched for by name, email, id, identity descriptor, and subject descriptor. 

## Identity Descriptors

These legacy identity descriptors have largely been replaced by graph descriptors (VSIDs) but are occasionally used by systems that continue to rely on our legacy identity management service (IMS). For example, you need legacy descriptors to manage permissions with the Azure DevOps security APIs. When searching identities by their identity descriptors, the identity descriptors need to be properly escaped before being passed into the API.

## Working with AAD users and groups

For Azure DevOps Services customers backing their accounts with Azure Active Directory (AAD), management of AAD users and groups should be performed with the [Azure AD Graph API Reference](https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/api-catalog).

The Azure DevOps Services Identities API can reference AAD user and groups but cannot be used to modify them.
