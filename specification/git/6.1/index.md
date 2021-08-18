---
title: Git REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services Git REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Git
---

# Git API
Use these APIs to work with Git repositories in Azure DevOps Services.
Repositories contain objects representing core Git concepts:

- blobs (files)
- trees (folders)
- commits
- refs (branches, lightweight tags)

and other resources that represent the history of those items or act on their state.

There are [code samples](https://github.com/microsoft/azure-devops-dotnet-samples/tree/master/ClientLibrary/Samples/Git) available for this area.

## Common tasks

* [Git Repositories](xref:vsts.git.repositories)
    * Get a list of [repositories](xref:vsts.git.repositories.list) in a team project.
    * [Add a repository](xref:vsts.git.repositories.create) to a team project.
    * [Delete a repository](xref:vsts.git.repositories.delete) from a team project.
* [Pull Requests](xref:vsts.git.pullrequests)
    * [Complete pull requests](xref:vsts.git.pullrequests.create)
    * Get a [list of pull requests](xref:vsts.git.pullrequests.getpullrequestsbyproject)
    * [Create a pull request](xref:vsts.git.pullrequests.create)
    * [Update a pull request](xref:vsts.git.pullrequests.update)
* [Commits](xref:vsts.git.commits)
    * Get a [list of commits](xref:vsts.git.commits.getcommits)
* [Refs](xref:vsts.git.refs) (branches and tags)
    * Get all [branches](xref:vsts.git.refs.list).
    * [Create, update, or delete](xref:vsts.git.refs.updateref) a branch.
* [Pushes](xref:vsts.git.pushes)
    * Get a list of [pushes](xref:vsts.git.pushes.list).
    * [Create a branch](xref:vsts.git.pushes.create) (Create a push/initial commit)