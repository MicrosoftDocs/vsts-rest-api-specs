---
title: Test REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) test REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Test Management
---

# Test Management

A test case describes the steps to take when you run a test.
Test suites are groups of test cases, and a test plan is the collection of test suites that need to be run for a particular iteration or release.
Test points are the pairings of test cases with test configurations that need to be run for the test plan.
A test run consists of a set of test points. The results are the outcome of running the tests in the test run.

## Common tasks

### Create a test plan
1. Get the [team project](../core/projects.md) that you're working in.
2. Create the [test plan](./plans/create.md).

### Create a test suite with test cases
You need to have some test cases already created to do this.

1. Create a [test suite](./suites/create.md).
2. Add some [test cases](./suites/add.md) to the suite.

### Get the results from a test run

After you've run some tests...

1. Get a [test run](./runs/list.md).
2. Get the ID of a run from the list, and get the [results](./results/gettestresultbyid.md) for that run.
3. You can also get [statistics](./runs/gettestrunstatistics.md) for the run.

## Licensing Requirements
Test resources are subject to specific licensing and access restrictions. Please refer to the documentation links below for ensuring that the REST APIs are accessed with the appropriate user context.

[Access Levels for Test Manager](https://www.visualstudio.com/en-us/docs/work/connect/change-access-levels#test-manager)

[Test Manager Extension](https://marketplace.visualstudio.com/items?itemName=ms.vss-testmanager-web)
