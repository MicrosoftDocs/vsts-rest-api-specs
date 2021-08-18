---
title: Work REST API for Azure DevOps Services | Microsoft Docs
description: Reference for the Azure DevOps Services work REST API
ms.assetid: 2CC3AFF0-D665-407A-AC69-C68C61FB3267
ms.manager: douge
ms.author: elbatk
ms.date: 10/02/2017
ms.devlang: rest-api
service_description: Work
---

# Work

## Common tasks with the board API

### Add a column to a board
1. Look up the [boards](xref:vsts.work.boards.list) for a team.
2. Get [column settings](xref:vsts.work.columns.list) for a board.
3. Add [a column](xref:vsts.work.columns.update) to a board by including the new column's data to existing columns received in get column settings.

### Update board row settings
1. Look up the [boards](xref:vsts.work.boards.list) for a team.
2. Get [row settings](xref:vsts.work.rows.list) for a board.
3. Update [row settings](xref:vsts.work.rows.update) for a board.

### Update card style rules on a board
1. Get [card styling rules](xref:vsts.work.cardrulesettings.get) for a board.
2. Update [card styling rules](xref:vsts.work.cardrulesettings.update) for a board.

### Update chart settings
1. List all the [charts](xref:vsts.work.charts.list) for a board.
2. Get a [specific chart](xref:vsts.work.charts.get) by name a board.
3. Update [chart settings](xref:vsts.work.charts.update) for a specific chart.

## Team settings

**Team projects** have one or more **teams** that contribute to that project. This API enables editing of team settings (not project or process settings). 

| Setting Name  | Description | Reference
|:-----------   |:---------   |:---------
| backlogIteration | The base iteration used for portfolio backlogs. | [Team Settings](xref:vsts.work.teamsettings)
| bugsBehavior  | Change the way bugs behave on the boards and in the backlogs (AsRequirements, AsTasks, Off). | [Team Settings](xref:vsts.work.teamsettings)
| workingDays   | The days of the week that a team's members work. | [Team Settings](xref:vsts.work.teamsettings)
| backlogVisibilities | Which backlogs are visible in the team's backlog navigation. | [Team Settings](xref:vsts.work.teamsettings)
| teamFieldValues | The list of the team field values selected by a team. This defines what items are owned by a team. | [Team Field Values](xref:vsts.work.teamfieldvalues)
| defaultValue  | The default value for the team field. | [Team Field Values](xref:vsts.work.teamfieldvalues)
| iterations    | The list of iterations to which the team is subscribed. | [Team Iterations](xref:vsts.work.iterations)
| teamDaysOff   | The a team's days off within an iteration. | [Team Days Off](xref:vsts.work.teamdaysoff)
| capacities    | The list of team members' capacity information. | [Team Capacity](xref:vsts.work.capacities.list)
| activity      | The type of work being done by a team member. | [Team Capacity](xref:vsts.work.capacities.get)
| capacityPerDay| The amount of work a team member can do in a day (per activity). | [Team Capacity](xref:vsts.work.capacities.get)
| daysOff       | The days in a sprint that a team member is taking off. | [Team Capacity](xref:vsts.work.capacities.get)


## Common tasks with the Team Settings API

### Change the bug behavior for the team

1. Get a list of [teams](xref:vsts.core.teams.getallteams) in a team project.
2. Get the [team settings](xref:vsts.work.teamsettings.get) of a team.
3. Set the [team settings](xref:vsts.work.teamsettings.update) of a team.



### Get the list of areas or team field values that a team owns

1. Get a list of [teams](xref:vsts.core.teams.getallteams) in a team project.
2. Get the [areas or team field values](xref:vsts.work.teamfieldvalues.get) of a team.



### Change a team's ownership of areas or team field values

1. Get a list of [teams](xref:vsts.core.teams.getallteams) in a team project.
2. Get a list of [areas or team field values](xref:vsts.work.teamfieldvalues) of a team.
3. Set the [areas or team field values](xref:vsts.work.teamfieldvalues.update) of a team.



### Add an iteration to the set of team iterations

1. Get a list of [teams](xref:vsts.core.teams.getallteams) in a team project.
2. Get a list of [iterations](xref:vsts.work.iterations.list) of a team.
3. Set the [iterations](xref:vsts.work.iterations.postteamiteration) of a team.



### Change a team member's capacity per day

1. Get a list of [teams](xref:vsts.core.teams.getallteams) in a team project.
2. Get a list of [iterations](xref:vsts.work.iterations.list) of a team.
3. Get the [capacity](xref:vsts.work.capacities.get) information for that iteration.
3. Set the [capacity](xref:vsts.work.capacities.update) of one team member for that iteration.



## Common tasks with the Process Configuration API

### Investigate what field maps to "Effort" in the agile experiences
1. Get a list of [team projects](xref:vsts.core.projects.list) in a collection
2. Get the [process configuration](xref:vsts.work.processconfiguration.get) for a team project.
3. Find the typeField mapping for "Effort".
