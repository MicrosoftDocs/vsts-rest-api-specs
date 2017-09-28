---
title: Work item tracking REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) work item tracking REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: WIT
---

# Work item tracking

## Work item tracking resources

Get, create, and update bugs, tasks, and other work items for your team.
Queries allow you to use the full power of the work item query language to search for and filter work items.
You can use the work item query language to get to each work item that satisfies the query.
Work items retain a full history, and you can get each full revision of the work item, or just the updates that were made in each revision. Work items can also be tagged.

## Work item metadata resources

Work items are governed by metadata.
Some of the metadata is scoped to a specific team project, and other metadata is scoped to a project collection (like your Visual Studio Team Services account's default collection).

### Project-scoped metadata

Your team project has a set of [work item types](./work-item-types.md). Each work item type may belong to a [category](./categories.md) such as "requirement" or 
"bug" to define its role in the project.
[Classification nodes](./classification-nodes.md) define the set of values that can be used in the area and iteration fields for the work items in the team project.

* [Categories](./categories.md)
* [Classification nodes](./classification-nodes.md) (areas and iterations)
* [Work Item Types](./work-item-types.md)

### Collection-scoped metadata

Work item types share [fields](./fields.md) and [relation types (links and attachments)](./relation-types.md) with other types of work items.

* [Fields](./fields.md)
* [Relation types](./relation-types.md)

## Common tasks

### Get work items using a query
1. Look up the [query](./queries.md) that you want to use.
2. Get the [results](./wiql.md) for that query.
3. Get each of the [work items by ID](./workitems/list.md).

### Update a work item's fields
1. Get the ID of the [work item](./workitems.md) that you want to update.
2. [Update the fields](./workitems/update.md) of the work item.

### Update multiple work items' fields
1. Get the IDs of the [work items](workitems.md) that you want to update.
2. Update the fields using a [batch call](batch/update.md) of the work items.

### Link two work items
1. Get the ID of the [work items](./workitems.md) that you want to link.
2. [Add a link](./workitems/update.md) between the work items.

### Create two work items and link them
Use the [create a work item](workitems/create.md) and [add a link](workitems/update.md) APIs in a [batch](batch.md) call.

### Attach a file to a work item
1. Get the ID of the [work item](./workitems.md) that you want to update.
2. [Upload the attachment](./attachments/create.md) to the attachment store.
3. [Add the attachment](./workitems/update.md) to the work item.

### Create a work item
[Create a work item](./workitems/create.md).
Make sure you provide at least a title. Some types of work items will require values for other fields.

### Get a work item's discussion history
1. Get the ID of the [work item](./workitems.md).
2. Get the work item's [discussion history](./history.md).

### Get a work item's full history
1. Get the ID of the [work item](./workitems.md).
2. Get a list of [updates](./updates.md) made to a work item.
3. Get the whole work item as it appeared in any [revision](./revisions.md).

### Delete a work item
1. Get the ID of the [work item](./workitems.md).
2. [Delete the work item](./workitems/delete.md).

### Restore a work item
1. Get the list of items in the [recycle bin](./recycle-bin.md).
2. [Restore a work item](./recycle-bin.md).

### Tag a work item
1. Get the ID of the [work item](./workitems.md) that you want to update.
2. Get the ID of the [tag](./tags/get.md) that you want to add. If it doesn't exist, [create](./tags/create.md) it.
3. Add the tag to the work item by [updating the tags field](./workitems/update.md).

### Get the fields used in a team project
1. Get the [types of work items](./workitemtypes/list.md) used in a team project.
2. Get each [work item type](./workitemtypes/get.md) to see the fields that it uses. (Skip past the xmlform to fieldinstances.)

### Get categories of work items
Use [categories of work items](./categories/list.md) to get the types of work items used in a team project for different functions.
For example, to see the work items that appear on the backlog, get the requirements [category](./categories/get.md).

### Get areas and iterations
Get the [area hierarchy](classification-nodes/get.md) or [iteration hierarchy](./classification-nodes/get.md) for your team project.

### Get types of work item relations
Get the available [types of work item links](./relation-types/list.md) that are available in your project collection.
