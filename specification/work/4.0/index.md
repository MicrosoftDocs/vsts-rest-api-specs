---
title: Work REST API for Visual Studio Team Services (VSTS) | Microsoft Docs
description: Reference for the Visual Studio Team Services (VSTS) work REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.service: VSTS
ms.devlang: rest-api
service_description: Work
---

# Work

## Common tasks with the board API

### Add a column to a board
1. Look up the [boards](./boards/list.md) for a team.
2. Get [column settings](./columns/list.md) for a board.
3. Add [a column](./columns/update.md) to a board by including the new column's data to existing columns received in get column settings.

### Update board row settings
1. Look up the [boards](./boards/list.md) for a team.
2. Get [row settings](./rows/list.md) for a board.
3. Update [row settings](./rows/list.md) for a board.

### Update card fields on a board
1. Get [card fields](./cardfields/list.md) for a board.
2. Update [card fields](./cardfields/update.md) for a board.

### Update card style rules on a board
1. Get [card styling rules](./cardrules/list.md) for a board.
2. Update [card styling rules](./cardrules/list.md) for a board.

### Update chart settings
1. List all the [charts](./charts/list.md) for a board.
2. Get a [specific chart](./charts/get.md) by name a board.
3. Update [chart settings](./charts/update.md) for a specific chart.

## Team settings

[Team projects](../tfs/projects.md) have one or more [teams](../tfs/teams.md) that contribute to that project. This API enables editing of team settings (not project or process settings). 

| Setting Name  | Description | Reference
|:-----------   |:---------   |:---------
| backlogIteration | The base iteration used for portfolio backlogs. | [Team Settings](./teamsettings.md)
| bugsBehavior  | Change the way bugs behave on the boards and in the backlogs (AsRequirements, AsTasks, Off). | [Team Settings](./teamsettings.md)
| workingDays   | The days of the week that a team's members work. | [Team Settings](./teamsettings.md)
| backlogVisibilities | Which backlogs are visible in the team's backlog navigation. | [Team Settings](./teamsettings.md)
| teamFieldValues | The list of the team field values selected by a team. This defines what items are owned by a team. | [Team Field Values](./team-field-values.md)
| defaultValue  | The default value for the team field. | [Team Field Values](./team-field-values.md)
| iterations    | The list of iterations to which the team is subscribed. | [Team Iterations](./iterations.md)
| teamDaysOff   | The a team's days off within an iteration. | [Team Days Off](./team-days-off.md)
| capacities    | The list of team members' capacity information. | [Team Capacity](./capacities/list.md)
| activity      | The type of work being done by a team member. | [Team Capacity](./capacities/get.md)
| capacityPerDay| The amount of work a team member can do in a day (per activity). | [Team Capacity](./capacities.md/get.md)
| daysOff       | The days in a sprint that a team member is taking off. | [Team Capacity](./capacities/get.md)


## Common tasks with the Team Settings API

### Change the bug behavior for the team

1. Get a list of [teams](../core/projects.md) in a team project.
2. Get the [team settings](./teamsettings/get.md) of a team.
3. Set the [team settings](./teamsettings/update.md) of a team.



### Get the list of areas or team field values that a team owns

1. Get a list of [teams](../core/projects.md) in a team project.
2. Get the [areas or team field values](./teamfieldvalues/get.md) of a team.



### Change a team's ownership of areas or team field values

1. Get a list of [teams](../core/projects.md) in a team project.
2. Get a list of [areas or team field values](./team-field-values.md) of a team.
3. Set the [areas or team field values](./teamfieldvalues/update.md) of a team.



### Add an iteration to the set of team iterations

1. Get a list of [teams](../core/projects.md) in a team project.
2. Get a list of [iterations](./iterations.md) of a team.
3. Set the [iterations](./iterations/add.md) of a team.



### Change a team member's capacity per day

1. Get a list of [teams](../core/projects.md) in a team project.
2. Get a list of [iterations](./iterations.md) of a team.
3. Get the [capacity](./capacities/get.md) information for that iteration.
3. Set the [capacity](./capacities/update.md) of one team member for that iteration.



## Common tasks with the Process Configuration API

### Investigate what field maps to "Effort" in the agile experiences
1. Get a list of [team projects](../core/projects.md) in a collection
2. Get the [process configuration](./process-configuration.md) for a team project.
3. Find the typeField mapping for "Effort".
