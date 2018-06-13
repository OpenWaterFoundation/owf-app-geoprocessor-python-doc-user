# Learn GeoProcessor / Command / OpenDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `OpenDataStore` command creates a new generic [DataStore](../../introduction#DataStore) to provide
data access from:

* a database
* a web service

DataStore features in the GeoProcessor currently focus on relational databases that can
be queried to return tabular datasets.
In the future, support for web services will be added.
See also the [`CloseDataStore`](../CloseDataStore/CloseDataStore) command to close a DataStore.

This command can be used to control DataStore connections in a workflow.
The GeoProcessor is being enhanced to open DataStores at software startup,
for cases where a DataStore needs to be available for the entire software session.

For security reasons, the account name and password used for the connection should generally **not** be directly
included in the command parameters.  This is less of an issue for read-only `guest` accounts.
To allow flexibility, use the `${env:Property}` notation to specify that the parameter value
is taken from an environment variable, and set the environment variable dynamically in the
run-time environment.

Database DataStores are implemented using Pandas Python package Data Frame and appropriate database driver software.
The following are supported database dialects:

**<p style="text-align: center;">
Supported Database Dialects
</p>**

|**`DatabaseDialect` Parameter**|
|--|
|`PostgreSQL`|

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
|`OpenMode` <br>**_required_**|The method used to open the DataStore. Must choose one of the three options.<br><br>1. `NewByParameters`: Open a **new** DataStore by entering *parameters* in the required fields.<br>2 `NewByFile`: Open a **new** DataStore by supplying a *file* that has the required configurations.<br>3. `ExistingByID`: Open an **existing but closed** DataStore by entering the *DataStore ID*.<br><br>*The `NewByFile` mode is currently disabled.*|None - must be specified.|
||**IF THE `NewByParameters` MODE IS SELECTED ... **||
|`DatabaseDialect`<br>**_required_**| The database dialect, used to format the database connection URL for the matching database driver software. <br><br>Currently the following are supported: `PostgreSQL`.| None - must be specified.|
|`DatabaseServer`<br>**_required_**| The database server name or IP address.  Can be specified using `${Property}`.| None - must be specified.|
|`DatabaseName`<br>**_required_**| The name of the database.  Can be specified using `${Property}`.|None - must be specified.|
|`DatabaseUser`<br>**_required_**|The database user.  A read-only "guest" (or similar) account should be used for read-only operations, if possible.  Can be specified using `${Property}`.|None - must be specified.|
|`DatabasePassword`<br>**_required_**|The database password.  Can be specified using `${Property}`.|None - must be specified.|
|`DatabasePort`<br> *optional*|The database port.<br><br>**Default Ports**<br>PostgreSQL: `5432`|Will default to the default port used for `DatabaseDialect` software.|
|`DataStoreID`<br> *optional*|Identifier to assign to the DataStore. This allows the DataStore to be used with other commands. A new DataStore will be created.  If the identifier matches an existing opened DataStore, the old DataStore is closed before opening the new DataStore.  Can be specified using `${Property}`.|`DatabaseName` value is used as the `DataStoreID`.|
|`IfDataStoreIDExists`<br> *optional*|The action that occurs if the `DataStoreID` already exists within the GeoProcessor. <br><br> `Replace` : The existing DataStore within the GeoProcessor is overwritten with the new DataStore. No warning is logged.<br><br> `ReplaceAndWarn`: The existing DataStore within the GeoProcessor is overwritten with the new DataStore. A warning is logged. <br><br> `Warn` : The new DataStore is not created. A warning is logged. <br><br> `Fail` : The new DataStore is not created. A fail message is logged. | `Replace` | 
||**IF THE `NewByFile` MODE IS SELECTED ... **||
|`File` <br>**_required_**|The path (relative or absolute) to the file containing the database configurations.|None - must be specified.|
|`DataStoreID`<br> *optional*|Identifier to assign to the DataStore. This allows the DataStore to be used with other commands. A new DataStore will be created.  If the identifier matches an existing opened DataStore, the old DataStore is closed before opening the new DataStore.  Can be specified using `${Property}`.|`DatabaseName` value is used as the `DataStoreID`.|
|`IfDataStoreIDExists`<br> *optional*|The action that occurs if the `DataStoreID` already exists within the GeoProcessor. <br><br> `Replace` : The existing DataStore within the GeoProcessor is overwritten with the new DataStore. No warning is logged.<br><br> `ReplaceAndWarn`: The existing DataStore within the GeoProcessor is overwritten with the new DataStore. A warning is logged. <br><br> `Warn` : The new DataStore is not created. A warning is logged. <br><br> `Fail` : The new DataStore is not created. A fail message is logged. | `Replace` | 
||**IF THE `ExistingByID` MODE IS SELECTED ... **||
|`DataStoreID`<br>**_required_**|Identifier of the existing DataStore to open. Can be specified using `${Property}`.|None - must be specified.|

## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/OpenDataStore).

## Troubleshooting ##

## See Also ##

* [`CloseDataStore`](../CloseDataStore/CloseDataStore) - close a DataStore
* [`ReadTableFromDataStore`](../ReadTableFromDataStore/ReadTableFromDataStore) - read a table from a DataStore
* [`WriteTableToDataStore`](../WriteTableToDataStore/WriteTableToDataStore) - write a table to a DataStore
