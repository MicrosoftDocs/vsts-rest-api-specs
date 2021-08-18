---
title: Work item tracking REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services work item tracking REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: WIT
---

# Work item tracking

## Work item tracking resources

Get, create, and update bugs, tasks, and other work items for your team.
Queries allow you to use the full power of the work item query language to search for and filter work items.
You can use the work item query language to get to each work item that satisfies the query.
Work items retain a full history, and you can get each full revision of the work item, or just the updates that were made in each revision. Work items can also be tagged.

## Common tasks

### Get work items using a query
1. Look up the [query](xref:vsts.wit.queries) that you want to use.
2. Get the [results](xref:vsts.wit.wiql) for that query.
3. Get each of the [work items by ID](xref:vsts.wit.workitems.list).

### Update WorkItems in batch
Use [Batch WorkItem Update apis](https://aka.ms/witbatchupdate) to update your workitems in batch.

### Update a work item's fields
1. Get the ID of the [work item](xref:vsts.wit.workitems.list) that you want to update.
2. [Update the fields](xref:vsts.wit.workitems.update) of the work item.


### Link two work items
1. Get the ID of the [work items](xref:vsts.wit.workitems.list) that you want to link.
2. [Add a link](xref:vsts.wit.workitems.update) between the work items.

### Create two work items and link them
Use the [create a work item](xref:vsts.wit.workitems.create) and [add a link](xref:vsts.wit.workitems.update) APIs in a batch call.

### Attach a file to a work item
1. Get the ID of the [work item](xref:vsts.wit.workitems.list) that you want to update.
2. [Upload the attachment](xref:vsts.wit.attachments.create) to the attachment store.
3. [Add the attachment](xref:vsts.wit.workitems.update) to the work item.

### Create a work item
[Create a work item](xref:vsts.wit.workitems.create).
Make sure you provide at least a title. Some types of work items will require values for other fields.

### Get a work item's full history
1. Get the ID of the [work item](xref:vsts.wit.workitems.list).
2. Get a list of [updates](xref:vsts.wit.updates.list) made to a work item.
3. Get the whole work item as it appeared in any [revision](xref:vsts.wit.revisions).

### Delete a work item
1. Get the ID of the [work item](xref:vsts.wit.workitems.list).
2. [Delete the work item](xref:vsts.wit.workitems.delete).

### Get the fields used in a team project
1. Get the [types of work items](xref:vsts.wit.workitemtypes.list) used in a team project.
2. Get each [work item type](xref:vsts.wit.workitemtypes.get) to see the fields that it uses. (Skip past the xmlform to fieldinstances.)

### Get categories of work items
Use [categories of work items](xref:vsts.wit.workitemtypecategories.list) to get the types of work items used in a team project for different functions.
For example, to see the work items that appear on the backlog, get the requirements [category](xref:vsts.wit.workitemtypecategories.get).

### Get areas and iterations
Get the [area hierarchy or iteration hierarchy](xref:vsts.wit.classificationnodes.get) for your team project.

### Get types of work item relations
Get the available [types of work item links](xref:vsts.wit.workitemrelationtypes.list) that are available in your project collection.

## Work item metadata resources

Work items are governed by metadata.
Some of the metadata is scoped to a specific team project, and other metadata is scoped to a project collection (like your Azure DevOps Services account's default collection).

### Project-scoped metadata

Your team project has a set of [work item types](xref:vsts.wit.workitemtypes). Each work item type may belong to a [category](xref:vsts.wit.workitemtypecategories) such as "requirement" or 
"bug" to define its role in the project.
[Classification nodes](xref:vsts.wit.classificationnodes) define the set of values that can be used in the area and iteration fields for the work items in the team project.

* [Categories](xref:vsts.wit.workitemtypecategories)
* [Classification nodes](xref:vsts.wit.classificationnodes) (areas and iterations)
* [Work Item Types](xref:vsts.wit.workitemtypes)

### Collection-scoped metadata

Work item types share [fields](xref:vsts.wit.fields) and [relation types (links and attachments)](xref:vsts.wit.workitemrelationtypes) with other types of work items.

* [Fields](xref:vsts.wit.fields)
* [Relation types](xref:vsts.wit.workitemrelationtypes)
