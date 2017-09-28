---
title: Git REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) Git REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Git
---

# Git API
Use these APIs to work with Git repositories in Visual Studio Team Services (VSTS).
Repositories contain objects representing core Git concepts:

- blobs (files)
- trees (folders)
- commits
- refs (branches, lightweight tags)

and other resources that represent the history of those items or act on their state.

There are [code samples](https://github.com/Microsoft/vsts-dotnet-samples/blob/master/ClientLibrary/Snippets/Microsoft.TeamServices.Samples.Client/Git) available for this area.

## Common tasks

* [Git Repositories](./repositories.md)
    * Get a list of [repositories](./repositories/list.md) in a team project.
    * [Add a repository](./repositories/create.md) to a team project.
    * [Delete a repository](./repositories/delete.md) from a team project.
* [Pull Requests](./pullrequests.md)
    * [Complete pull requests](./pullrequests/create.md)
    * Get a [list of pull requests](./pullrequests/getpullrequestsbyproject.md)
    * [Create a pull request](./pullrequests/create.md)
    * [Update a pull request](./pullrequests/update.md)
* [Commits](./commits.md)
    * Get a [list of commits](./commits/list.md)
    * You can also get the [differences](./diffs.md) between the commited version and the previous version.
* [Refs](./refs.md) (branches and tags)
    * Get all [branches](./refs/list.md).
    * [Create, update, or delete](./refs/update.md) a branch.
* [Pushes](./pushes.md)
    * Get a list of [pushes](./pushes/list.md).
    * [Create a branch](./pushes/create.md) (Create a push/initial commit)