# Learn GeoProcessor / Command / OpenDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `OpenDataStore` command creates a new generic [DataStore](../../introduction#datastore) to provide
data access from:

* a database
* a web service

Datastore features in the GeoProcessor currently focus on relational databases that can
be queried to return tabular datasets.
In the future, support for web services will be added.
See also the [`CloseDataStore`](../CloseDataStore/CloseDataStore) command to close a datastore.

This command can be used to control datastore connections in a workflow.
The GeoProcessor is being enhanced to open datastores at software startup,
for cases where a datastore needs to be available for the entire software session.

For security reasons, the account name and password used for the connection should generally **not** be directly
included in the command parameters.  This is less of an issue for read-only `guest` accounts.
To allow flexibility, use the `${env:Property}` notation to specify that the parameter value
is taken from an environment variable, and set the environment variable dynamically in the
run-time environment.

Database datastores are implemented using Pandas Python package Dataframe and appropriate database driver software.
The following are supported database types:

**<p style="text-align: center;">
Supported Database Types
</p>**

|**`DatabaseType` Parameter**|**Notes**|
|--|--|
|`PostgreSQL`|Requires ?? to be installed.  See [installation instructions](../../install/#install-additional-python-packages).|

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
OpenDataStore(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
| --------------|-----------------|----------------- |
|`DatabaseType`<br>**_required_**| The database type, used to format the database connection URL for the matching database driver software.  Currently the following are supported: `PostgreSQL`.| None - must be specified.|
|`DatabaseServer`<br>**_required_**| The database server name or IP address.  Can be specified using `${Property}`.| None - must be specified.|
|`DatabaseName`<br>**_required_**| The name of the database.  Can be specified using `${Property}`.|None - must be specified.|
|`DatabaseUser`<br>**_required_**|The database user.  A read-only "guest" (or similar) account should be used for read-only operations, if possible.  Can be specified using `${Property}`.|None - must be specified.|
|`DatabasePassword`<br>**_required_**|The database password.  Can be specified using `${Property}`.|None - must be specified.|
|`DatabasePort`<br> *optional*|The database port.<br><br>**Default Ports**<br>PostgreSQL: `5432`|Will default to the default port used for `DatabaseType` software.|
|`DataStoreID`<br> *optional*|Identifier to assign to the DataStore. This allows the DataStore to be used with other commands. A new DataStore will be created.  If the identifier matches an existing opened datastore, the old datastore is closed before opening the new datastore.  Can be specified using `${Property}`.|`DatabaseName` value is used as the `DataStoreID`.|

## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/OpenDataStore).

## Troubleshooting ##

## See Also ##

* [`CloseDataStore`](../CloseDataStore/CloseDataStore) - close a datastore
* [`ReadTableFromDataStore`](../ReadTableFromDataStore/ReadTableFromDataStore) - read a table from a datastore
* [`WriteTableToDataStore`](../WriteTableToDataStore/WriteTableToDataStore) - write a table to a datastore
