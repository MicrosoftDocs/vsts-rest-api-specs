---
title: Overview | REST API Reference for Visual Studio Team Services 
description: Work with Governance service in programmatic manner using the REST APIs for Visual Studio Online.
ms.assetid: D5E892A4-118C-4991-99A0-015FC97C9391
ms.prod: vs-devops-alm
ms.technology: vs-devops-integrate
---

# Governance

Using the Governance service, you can register the usage of an existing or new open source component in a given [product](xref:vsts.governance.products). You can explore [registrations](xref:vsts.governance.registrations) of open source components and various versions being used by [products](xref:vsts.governance.products) in your organization.

You can also explore the [history](xref:vsts.governance.snapshots) of a [product](xref:vsts.governance.products) to understand how [registrations](xref:vsts.governance.registrations) changed over time.

Get [alerts](xref:vsts.governance.alerts) for your [products](xref:vsts.governance.products) to find out about vulnerable components and action items to resolve them.


* [Products](xref:vsts.governance.products)
* [Policies](xref:vsts.governance.policies)
* [Registrations](xref:vsts.governance.registrations)

## Common tasks

### Get a list of products
1. Get all [products](xref:vsts.governance.products.list) in your organization.

### Create a product
1. Create a new [product](xref:vsts.governance.products.create) with initial policies.

### Add a policy to a product
1. Get available [policies](xref:vsts.governance.policies.list).
2. Add a [policy](xref:vsts.governance.policyReferences.add) to a product.

### Register components used by a product
1. Create new component [registrations](xref:vsts.governance.registrationRequests.create).

### Get a list of registered components in a product
1. Get all [registrations](xref:vsts.governance.registrations.list) in a product.
