---
title: Symbol Service Rest API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services Symbol Service REST API
ms.assetid: 7B36F354-2094-4295-862E-8F232EC2F81A
ms.manager: mariorod
ms.author: mizho
ms.date: 11/08/2017
ms.devlang: rest-api
service_description: Symbol
---

# Symbol Service

Use these APIs to work with a Team Foundation managed Symbol Service.

## Resources

The Symbol Service contains the following REST resources:
* An Availability resource to inform the user whether the symbol service is enabled for the account.
* A SymbolRequest (or simply, request) resource which contains a list of groups of related debug entries, which describe symbolic debug information resources.
* A DebugEntries resource groups cross-request debug entries, facilitating entry querying across all requests.
* The SymSrv resource is a special resource to support Microsoft's SymSrv protocol, which is implemented by many existing clients (including, but not limited to, all Microsoft debuggers). One client-end implementation is symsrv.dll.  All information from this resource is also available through DebugEntries, which should be preferred by any new clients.  This resource is subject to deprecation at a future date.

## Common tasks

* Check availability of Symbol Service for the current account.
    * Query the [availability](xref:vsts.symbol.availability.checkavailability) for the current VSTS account.

* Perform regular operations on symbol requests.
    * Create a new [symbol request](xref:vsts.symbol.requests.createrequests). This is usually followed by updating debug entries to the same request.
	* Update a batch of [debug entries](xref:vsts.symbol.requests.createrequestsrequestiddebugentries) to a non-sealed symbol request.
    * Update a symbol request either [by name](xref:vsts.symbol.requests.updaterequestsrequestname) or [by identifier](xref:vsts.symbol.requests.updaterequestsrequestid). This is usually used to seal the request.
    * Get a symbol request either [by name](xref:vsts.symbol.requests.getrequestsrequestname) or [by identifier](xref:vsts.symbol.requests.getrequestsrequestid).
    * Delete a symbol request either [by name](xref:vsts.symbol.requests.deleterequestsrequestname) or [by identifier](xref:vsts.symbol.requests.deleterequestsrequestid).
	
* Perform symbol queries with Microsoft SymSrv protocol.
    * Get a list of [debug entries that match a client key](xref:vsts.symbol.symsrv.get)

* Get an executable file (possibly in an archived format) from the Symbol Service. The executable can be used to perform all the tasks listed above.
	* Get executable's [version](xref:vsts.symbol.client.headclient).
	* Get executable's [binaries](xref:vsts.symbol.client.get).