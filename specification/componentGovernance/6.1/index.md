---
title: Overview | REST API Reference for Visual Studio Team Services 
description: Work with Governance service in programmatic manner using the REST APIs for Visual Studio Online.
ms.assetid: D5E892A4-118C-4991-99A0-015FC97C9391
ms.prod: vs-devops-alm
ms.technology: vs-devops-integrate
---

# Governance

Using the Governance service, you can register the usage of an existing or new open source component in a given [governed repository](xref:vsts.componentGovernance.governedRepositories). You can explore [registrations](xref:vsts.componentGovernance.registrations) of open source components and various versions being used by [governed repositories](xref:vsts.componentGovernance.governedRepositories) in your organization.

You can also explore the [history](xref:vsts.componentGovernance.snapshots) of a [governed repository](xref:vsts.componentGovernance.governedRepositories) to understand how [registrations](xref:vsts.componentGovernance.registrations) changed over time.

Get [alerts](xref:vsts.componentGovernance.alerts) for your [governed repositories](xref:vsts.componentGovernance.governedRepositories) to find out about vulnerable components and action items to resolve them.


* [Governed Repositories](xref:vsts.componentGovernance.governedRepositories)
* [Policies](xref:vsts.componentGovernance.policies)
* [Registrations](xref:vsts.componentGovernance.registrations)

## Common tasks

### Get a list of governed repositories
1. Get all [governed repositories](xref:vsts.componentGovernance.governedRepositories.list) in your organization.

### Create a governed repository
1. Create a new [governed repository](xref:vsts.componentGovernance.governedRepository.create) with initial policies.

### Add a policy to a governed repository
1. Get available [policies](xref:vsts.componentGovernance.policies.list).
2. Add a [policy](xref:vsts.componentGovernance.policyReferences.add) to a governed repository.

### Register components used by a governed repository
1. Create new component [registrations](xref:vsts.componentGovernance.registrationRequests.create).

### Get a list of registered components in a governed repository
1. Get all [registrations](xref:vsts.componentGovernance.registrations.list) in a governed repository.
