---
title: Code policy REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) code policy REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Code Policy
---

# Policy
If you haven’t already, look at the information on getting started with these APIs and our documentation on [branch policies](https://go.microsoft.com/fwlink/?LinkID=615252). Use these APIs to define policies for your projects. 
Configurationsassociate a type, such as "Required reviewers", with specific settings, such as  "For pull requests with files named *.dll targeting the master branch in the Fabrikam Git repository, add the Source-Controlled Binaries Team as a required reviewer". 

## Common tasks

### Get a list of policy configurations

* Get the available [policy types](./types.md) for an account.
* Get the [policy configurations](./configurations.md) for a team project.