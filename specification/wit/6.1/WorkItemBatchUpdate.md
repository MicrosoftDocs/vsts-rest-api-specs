---
title: Work item Batch Updates | Microsoft Docs
---

# Work Item Batch Update

**Service** : Work Item Tracking
**API Version** : 4.1
Performs multiple Work Item Update requests. Response contains individual responses for each of the requests in the batch. Failed requests do not affect subsequent requests in the batch.

---

## Work Item Structure

A work item can be visualized in a following file structure

```
WorkItem(id, rev)
|__Fields
|   |__ReferenceName
|__Relations
    |__WorkItemLinkReferenceNames
    |__ArtifactLink
    |__AttachedFile
    |__Hyperlink
```

---

## REST API SEMANTICS

```sh
PATCH : https://dev.azure.com/{organization}/_apis/wit/$batch?api-version=4.1
```

### URI Parameters

| Name                      | In    | Required | Type    | Description                                                                            |
| ------------------------- | ----- | -------- | ------- | -------------------------------------------------------------------------------------- |
| **accountName**           | Path  | True     | string  | The name of the Azure DevOps Services account.                                         |
| **api-version**           | query |          | string  | Version of the API to use. This should be set to '4.1' to use this version of the api. |
| **bypassRules**           | query |          | boolean | Do not enforce the work item type rules on this update.                                |
| **suppressNotifications** | query |          | boolean | Do not fire any notifications for this change.                                         |

### Request Body

**Media Type** : &quot;application/json-patch+json&quot;
Every request is a collection of individual requests on different work items. Each individual request consists of three main keys.

1. **op:** operation to be performed on a work item (can be add/remove/update etc.)
2. **path:** where the operation should be performed on a work item file structure.
3. **value:** value of the given operation.

**Operation**
The patch operation

| Name    | Type   |
| ------- | ------ |
| copy    | string |
| move    | string |
| remove  | string |
| replace | string |
| test    | string |

## **Examples**

1. [Add/Update a field.](#addorupdateafield)
2. [Add a work item link.](#addaworkitemlink)
3. [Add a hyperlink.](#addahyperlink)
4. [Add an attached file.](#addanattachedfile)
5. [Add an artifactlink.](#addanartifactlink)_(for eg. build, pullrequest, commit etc.)_
6. [Remove a work item link.](#removeaworkitemlink)
7. [Remove an artifact link.](#removeanartifactlink)
8. [Remove a hyperlink.](#removeahyperlink)
9. [Remove a remotelink.](#removearemotelink)
10. [Remove an attachment.](#removeanattachment)
11. [Case where single request in batch api fails.](#casewheresinglerequestinbatchapifails)
12. [Create multiple work items.](#createmultipleworkitems)
    <!--
13. [Use bypass rules.](#usebypassrules) [To Do]
14. [Add a tag.](#addatag) [To Do]
    -->

---

### Add/Update a Field <a name="addorupdateafield" />

Adding or updating a field is the most common operation. Here in this example where the fields priority and story points will be edited for work items with Id = 1,

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "test",
        "path": "/rev",
        "value": 3
      },
      {
        "op": "add",
        "path": "/fields/Microsoft.VSTS.Common.Priority",
        "value": "1"
      },
      {
        "op": "add",
        "path": "/fields/Microsoft.VSTS.Scheduling.StoryPoints",
        "value": "4"
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?bypassRules=true&api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/fields/Microsoft.VSTS.Common.Priority",
        "value": "3"
      },
      {
        "op": "add",
        "path": "/fields/Microsoft.VSTS.Scheduling.StoryPoints",
        "value": "1"
      }
    ]
  }
]
```

Important points to note:

1.  The request body here is an array of two requests. One for work item id = 1 and other for work item id = 2.
2.  The **uri** key in each request has the work item id.
3.  For add or update a field operation, we have **op : add**.
4.  To determine which field to add, we have reference name of the field in the **path** .
5.  In addition to **op:add** we also have **op:test** for work item 1 in the first request. Here **path: /rev** makes sure that an update is made to the work item only if current revision of the work item equals **value**.

**Response**

Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Add a work item link <a name="addaworkitemlink" />

Work Item links can be of different types. Few of them are listed below for reference.

| Link Types                          | Name         |
| ----------------------------------- | ------------ |
| System.LinkTypes.Related            | Related      |
| System.LinkTypes.Hierarchy-Forward  | Child        |
| System.LinkTypes.Hierarchy-Reverse  | Parent       |
| System.LinkTypes.Dependency-Forward | successor    |
| System.LinkTypes.Dependency-Reverse | predecessor  |
| System.LinkTypes.Duplicate-Forward  | duplicate    |
| System.LinkTypes.Duplicate-Reverse  | duplicate of |

In this example we will add a successor link from work item 1 -> 3 and a child link from work item 2 -> 3

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "System.LinkTypes.Dependency-forward",
          "url": "https://dev.azure.com/fabrikam/_apis/wit/workItems/3",
          "attributes": {
            "comment": "Adding a successor link"
          }
        }
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "System.LinkTypes.Hierarchy-forward",
          "url": "https://dev.azure.com/fabrikam/_apis/wit/workItems/3",
          "attributes": {
            "comment": "Adding a child link."
          }
        }
      }
    ]
  }
]
```

Here value attribute is the of type [WorkItemRelation](#workitemrelationtype)

**Response**

Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Add a hyperlink. <a name="addahyperlink" />

Hyperlink is the link to any other resource on the internet. In this example we add a hyperlink to workitem 1 & 2.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "Hyperlink",
          "url": "https://msdn.microsoft.com/en-us/library/hh750210.aspx"
        }
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "Hyperlink",
          "url": "https://msdn.microsoft.com/en-us/library/hh750210.aspx"
        }
      }
    ]
  }
]
```

**Response**

Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Add an attached file <a name="addanattachedfile" />

To add an attachment to a work item, attachment file url is needed. If the file is not already uploaded on server, upload it using attachment REST endpoint.

Adding an attachment to work item 1&2

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "AttachedFile",
          "url": "https://dev.azure.com/fabrikam/_apis/wit/attachments/098a279a-60b9-40a8-868b-b7fd00c0a439?fileName=Spec.txt",
          "attributes": {
            "comment": "Spec for the work"
          }
        }
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "AttachedFile",
          "url": "https://dev.azure.com/fabrikam/_apis/wit/attachments/098a279a-60b9-40a8-868b-b7fd00c0a439?fileName=Spec.txt",
          "attributes": {
            "comment": "Spec for the work"
          }
        }
      }
    ]
  }
]
```

**Response**

Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Add an Artifact Link <a name="addanartifactlink"/>

Pull request, branch, change set, build etc.. are some of the common artifact link types.
Example below adds a pull request link to work item 1&2.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "ArtifactLink",
          "url": "vstfs:///Git/PullRequestId/b6051940-0b88-4b98-947a-ee9c82c0fc9a%2fc628df44-f16e-4e31-9e5f-849cd2176ec2%2f1",
          "attributes": {
            "name": "Pull Request"
          }
        }
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "ArtifactLink",
          "url": "vstfs:///Git/PullRequestId/b6051940-0b88-4b98-947a-ee9c82c0fc9a%2fc628df44-f16e-4e31-9e5f-849cd2176ec2%2f1",
          "attributes": {
            "name": "Pull Request"
          }
        }
      }
    ]
  }
]
```

To construct a url for pull request link, below format is used.

```
 vstfs:///Git/PullRequestId/{project_id}%2F{repository_id}%2F{pull_request_id}
```

1. **vstfs:///Git/PullRequestId** is the hostname
2. **b6051940-0b88-4b98-947a-ee9c82c0fc9a** is the projectId for which pull request belongs to.
3. **c628df44-f16e-4e31-9e5f-849cd2176ec2** is the repository Id associated with given pull request.
4. **1** is the pull request id.

**Response**
Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Remove a work item link <a name="removeaworkitemlink"/>

Below example removing successor & child link from work item 1&2 respectively.
**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/System.LinkTypes.Dependency-Forward/3",
        "value": null
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/System.LinkTypes.Hierarchy-Forward/3",
        "value": null
      }
    ]
  }
]
```

Here

1. **path** = relations/{linkType}/{LinkedWorkitemId}
2. **value** is null.

**Response**
Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Remove an artifact link <a name="removeanartifactlink"/>

Example removing pull request link from work item 1&2 respectively.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/artifactLink/4",
        "value": null
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/artifactLink/5",
        "value": null
      }
    ]
  }
]
```

Here

1. **path** = relations/artifactLink/{ResourceId}
2. **value** is null.
3. **ResourceId** can be obtained by making a GET call to work item with expand relations options and reading attributes of relations.

**Response**
Responses are of below type.

4. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
5. Single response is returned per request.
6. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Remove a hyperlink <a name="removeahyperlink"/>

Example removing hyperlink link from work item 1&2 respectively.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/hyperlink/2",
        "value": null
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/hyperlink/2",
        "value": null
      }
    ]
  }
]
```

Here

1. **path** = relations/hyperlink/{ResourceId}
2. **value** is null.
3. **ResourceId** can be obtained by making a GET call to work item with expand relations options and reading attributes of relations.

**Response**

Responses are of below type.

4. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
5. Single response is returned per request.
6. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Remove an attachment <a name="removeanattachment"/>

Example removing an attachedfile from work item 1&2 respectively.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/attachedfile/6",
        "value": null
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/attachedfile/7",
        "value": null
      }
    ]
  }
]
```

Here

1. **path** = relations/attachedfile/{ResourceId}
2. **value** is null.
3. **ResourceId** can be obtained by making a GET call to work item with expand relations options and reading attributes of relations.

**Response**

Responses are of below type.

4. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
5. Single response is returned per request.
6. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Remove a remote link <a name="removearemotelink"/>

In addition to remote link types, the API also needs remote host id in the path attribute.
Removing remote link from work item 1&2 respectively.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/1?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/System.LinkTypes.Remote.Related/e45e157d-9225-4f56-9f20-d8c75f2c8d5b/3",
        "value": null
      }
    ]
  },
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/2?api-version=4.1",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": [
      {
        "op": "remove",
        "path": "/relations/System.LinkTypes.Hierarchy-Forward/e45e157d-9225-4f56-9f20-d8c75f2c8d5b/3",
        "value": null
      }
    ]
  }
]
```

1.  Guid **e45e157d-9225-4f56-9f20-d8c75f2c8d5b** is the remote host id.
1.  It can be obtained by making a REST GET Work Item call with expanding relations and reading HostId attribute.

**Response**

Responses are of below type.

1. **body** attribute is a serialized [Work Item Object on which update was attempted](#workitemobjecttype).
1. Single response is returned per request.
1. **Code** attribute in the response determines whether the update was successful or not.

```
{
  "count": 2,
  "value": [
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    },
    {
      "code": 200,
      "headers": {
        "Content-Type": "application/json; charset=utf-8"
      },
      "body": "{work item object}"
    }
  ]
}
```

---

### Case where single request in batch api fails <a name="casewheresinglerequestinbatchapifails"/>

If a single request fails then the whole batch api will get failed.

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[
  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/12?api-version=4.1",
    "headers": {
	 "Content-Type": "application/json-patch+json"
    },
    "body":[
    	{
        	"op": "add",
        	"path": "/fields/System.History",
        	 "value": "@Jose Rady, I've attached somnew changes 1"
      },
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "Hyperlink",
          "url": "https://msdn.microsoft.com/en-us/library/hh750210.aspx"
        }
      }
    ]
  },

  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/13?api-version=4.1",
    "headers": {
	 "Content-Type": "application/json-patch+json"
    },
    "body":[
    	{
        	"op": "add",
        	"path": "/fields/System.History",
        	 "value": "@Jose Rady, I've attached somnew changes 2"
      },
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "Hyperlink",
          "url": "https://msdn.microsoft.com/en-us/library/hh750210.aspx"
        }
      }
    ]
  },

  {
    "method": "PATCH",
    "uri": "/_apis/wit/workitems/14?api-version=4.1",
    "headers": {
	 "Content-Type": "application/json-patch+json"
    },
    "body":[
    	{
        	"op": "add",
        	"path": "/fields/System.History",
        	 "value": "@Jose Rady, I've attached somnew changes 3 "
      },
      {
        "op": "add",
        "path": "/relations/-",
        "value": {
          "rel": "Hyperlink",
          "url": "https://msdn.microsoft.com/en-us/library/hh750210.aspx"
        }
      }
    ]
  }

]
```

**Response**

```
{
    "count": 3,
    "value": [
        {
            "code": 400,
            "headers": {
                "Content-Type": "application/json; charset=utf-8"
            },
            "body": "{\"count\":1,\"value\":{\"Message\":\"Relation already exists.\"}}"
        },
        {
            "code": 500,
            "headers": {
                "Content-Type": "application/json; charset=utf-8"
            },
            "body": "{\"count\":1,\"value\":{\"Message\":\"TF401321: Whole Bulk failed.\"}}"
        },
        {
            "code": 500,
            "headers": {
                "Content-Type": "application/json; charset=utf-8"
            },
            "body": "{\"count\":1,\"value\":{\"Message\":\"TF401321: Whole Bulk failed.\"}}"
        }
    ]
}
```

---

### Create multiple work items <a name="createmultipleworkitems"/>

**Request**

```
PATCH https://dev.azure.com/fabrikam/_apis/wit/$batch?api-version=4.1
```

**Request Body**

```
[{
		"method": "PATCH",
		"uri": "/mytestprojectname/_apis/wit/workitems/$Bug?api-version=4.1",
		"headers": {
			"Content-Type": "application/json-patch+json"
		},
		"body": [{
				"op": "add",
				"path": "/id",
				"value": "-1"
			},
			{
				"op": "add",
				"path": "/fields/System.Title",
				"from": null,
				"value": "Sample 1"
			}
		]
	},
	{
		"method": "PATCH",
		"uri": "/mytestprojectname/_apis/wit/workitems/$Bug?api-version=4.1",
		"headers": {
			"Content-Type": "application/json-patch+json"
		},
		"body": [{
				"op": "add",
				"path": "/id",
				"value": "-2"
			},
			{
				"op": "add",
				"path": "/fields/System.Title",
				"from": null,
				"value": "Sample 2"
			}
		]
	}
]
```

**Response**

```
{
	"count": 2,
	"value": [{
			"code": 200,
			"headers": {
				"Content-Type": "application/json; charset=utf-8"
			},
			"body": {
				"id": 5155248,
				"rev": 1,
				"fields": {
					"System.AreaPath": "mytestprojectname",
					"System.TeamProject": "mytestprojectname",
					"System.IterationPath": "mytestprojectname",
					"System.WorkItemType": "Bug",
					"System.State": "New",
					"System.Reason": "New",
					"System.CreatedDate": "2018-06-15T06:42:30.217Z",
					"System.CreatedBy": "My Name<fabikram@microsoft.com>",
					"System.ChangedDate": "2018-06-15T06:42:30.217Z",
					"System.ChangedBy": "My Name<fabikram@microsoft.com>",
					"System.Title": "Sample",
					"Microsoft.VSTS.Common.Severity": "3 - Medium",
					"Microsoft.VSTS.Common.StateChangeDate": "2018-06-15T06:42:30.217Z",
					"Microsoft.VSTS.Common.Priority": 2,
					"Microsoft.VSTS.Common.ValueArea": "Business"
				},
				"_links": {
					"self": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155248"
					},
					"workItemUpdates": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155248/updates"
					},
					"workItemRevisions": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155248/revisions"
					},
					"workItemComments": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155248/comments"
					},
					"html": {
						"href": "https://fabikram.visualstudio.com/web/wi.aspx?pcguid=409b46ee-338d-4001-a354-97892d514d95&id=5155248"
					},
					"workItemType": {
						"href": "https://fabikram.visualstudio.com/b8d62f8d-72b3-486a-b05d-e9571cb7a2bb/_apis/wit/workItemTypes/Bug"
					},
					"fields": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/fields"
					}
				},
				"url": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155248"
			}
		},
		{
			"code": 200,
			"headers": {
				"Content-Type": "application/json; charset=utf-8"
			},
			"body": {
				"id": 5155249,
				"rev": 1,
				"fields": {
					"System.AreaPath": "mytestprojectname",
					"System.TeamProject": "mytestprojectname",
					"System.IterationPath": "mytestprojectname",
					"System.WorkItemType": "Bug",
					"System.State": "New",
					"System.Reason": "New",
					"System.CreatedDate": "2018-06-15T06:42:30.217Z",
					"System.CreatedBy": "My Name<fabikram@microsoft.com>",
					"System.ChangedDate": "2018-06-15T06:42:30.217Z",
					"System.ChangedBy": "My Name<fabikram@microsoft.com>",
					"System.Title": "Sample",
					"Microsoft.VSTS.Common.Severity": "3 - Medium",
					"Microsoft.VSTS.Common.StateChangeDate": "2018-06-15T06:42:30.217Z",
					"Microsoft.VSTS.Common.Priority": 2,
					"Microsoft.VSTS.Common.ValueArea": "Business"
				},
				"_links": {
					"self": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155249"
					},
					"workItemUpdates": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155249/updates"
					},
					"workItemRevisions": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155249/revisions"
					},
					"workItemComments": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155249/comments"
					},
					"html": {
						"href": "https://fabikram.visualstudio.com/web/wi.aspx?pcguid=409b46ee-338d-4001-a354-97892d514d95&id=5155249"
					},
					"workItemType": {
						"href": "https://fabikram.visualstudio.com/b8d62f8d-72b3-486a-b05d-e9571cb7a2bb/_apis/wit/workItemTypes/Bug"
					},
					"fields": {
						"href": "https://fabikram.visualstudio.com/_apis/wit/fields"
					}
				},
				"url": "https://fabikram.visualstudio.com/_apis/wit/workItems/5155249"
			}
		}
	]
}
```

<!--

#### Add a tag <a name="#addatag" />

#### Create and update multiple workitems <a name="createandupdatemultipleworkitems"/>

#### Use bypass rules <a name="usebypassrules"/>

-->

## Types

### Work Item Relation <a name="workitemrelationtype"/>

| Name       | Type                   | Description                    |
| ---------- | ---------------------- | ------------------------------ |
| attributes | &lt;string, object&gt; | Collection of link attributes. |
| rel        | string                 | Relation type.                 |
| url        | string                 | Link url.                      |

### Work Item Object <a name="workitemobjecttype"/>

| Name      | Type                   | Description                                |
| --------- | ---------------------- | ------------------------------------------ |
| \_links   | [ReferenceLinks]       | Link references to related REST resources. |
| fields    | &lt;string, object&gt; | Map of field and values for the work item. |
| id        | integer                | The work item ID.                          |
| relations | WorkItemRelation       | Relations of the work item.                |
| rev       | integer                | Revision number of the work item.          |
| url       | string                 | url to this work item                      |
