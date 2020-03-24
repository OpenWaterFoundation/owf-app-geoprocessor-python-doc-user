# GeoProcessor / Command / OpenDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `OpenDataStore` command creates a generic [DataStore](../../introduction/introduction.md#datastore) to provide
data access from:

* a database
* a web service

<a name="parameters"></a>
<a name="configfile"></a>

The `OpenDataStore` command can also be used to open an existing
DataStore previously closed with the [`CloseDataStore`](../CloseDataStore/CloseDataStore.md) command. 

* Set the `DataStoreID` parameter to the ID of the closed DataStore. 
* Set the `IfDataStoreIDExists` parameter to `Open`. 

A new DataStore can be opened in 2 ways: 

1. Parameters configure datastore
	* the DataStore configurations (*Database Dialect, Database Server, etc.*) are set via command parameters  
	* the `DataStoreID`, `DatabaseServer`, `DatabaseDialect`, `DatabaseName`, `DatabaseUser` and `DatabasePassword` parameters are **required**
	* the `IfDataStoreIDExists` and `DatabasePort` parameters are optional
2. Configuration file configures datastore 
	* the DataStore configurations (*Database Dialect, Database Server, etc.*) are set via a configuration file
	* the `DataStoreID` and `ConfigFile` parameters are **required**
	* the `IfDataStoreIDExists` parameter is optional

DataStore features in the GeoProcessor currently focus on relational databases that can
be queried to return tabular datasets.
In the future, support for web services will be added.
See also the [`CloseDataStore`](../CloseDataStore/CloseDataStore.md) command to close a DataStore.

This command can be used to control DataStore connections in a workflow.
The GeoProcessor is being enhanced to open DataStores at software startup,
for cases where a DataStore needs to be available for the entire software session.

For security reasons, the account name and password used for the connection should generally **not** be directly
included in the command parameters.  This is less of an issue for read-only `guest` accounts.
To allow flexibility, use the `${env:Property}` notation to specify that the parameter value
is taken from an environment variable, and set the environment variable dynamically in the run-time environment.

Database DataStores are implemented using [Pandas Python](https://pandas.pydata.org/)  package
[Data Frame](http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html#pandas.DataFrame), 
[SQLAlchemy](https://www.sqlalchemy.org/) package and appropriate database driver software.

### SQLAlchemy Database Dialects ###

**The following are the available SQLAlchemy database dialects:**

|`DatabaseDialect` Parameter|Default Port|Supported in the GeoProcessor?|
|-|:-:|-|
|[`PostgreSQL`](http://docs.sqlalchemy.org/en/latest/dialects/postgresql.html)|5432|Supported|
|[`Firebird`](http://docs.sqlalchemy.org/en/latest/dialects/firebird.html)|3050|Not Supported|
|[`Microsoft SQL Server`](http://docs.sqlalchemy.org/en/latest/dialects/mssql.html)|1433|Not Supported|
|[`MySQL`](http://docs.sqlalchemy.org/en/latest/dialects/mysql.html)|3306|Not Supported|
|[`Oracle`](http://docs.sqlalchemy.org/en/latest/dialects/oracle.html)|-|Not Supported|
|[`SQLite`](http://docs.sqlalchemy.org/en/latest/dialects/sqlite.html)|-|Not Supported|
|[`Sybase`](http://docs.sqlalchemy.org/en/latest/dialects/sybase.html)|5000|Not Supported|

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

|**Parameter Scope**|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|----| --------------|-----------------|----------------- |
|All|`DataStoreID`<br>**required**|Identifier to assign to the DataStore. This allows the DataStore to be used with other commands. Can be specified using `${Property}`.|None - must be specified.|
|All|`IfDataStoreIDExists`|The action that occurs if the `DataStoreID` already exists within the GeoProcessor:<ul><li>`Replace` - The existing DataStore within the GeoProcessor is replaced with the new DataStore. No warning is logged.</li><li>`Open` - The existing DataStore is opened if closed. No warning is logged.</li><li>`ReplaceAndWarn` - The existing DataStore within the replaced is replaced with the new DataStore. A warning is logged.</li><li>`Warn` - The new DataStore is not created. A warning is logged.</li><li>`Fail` - The new DataStore is not created. A fail message is logged.</li></ul> | `Replace` | 
|[Parameters configure datastore](#parameters)|`DatabaseServer`<br>**required**| The database server name or IP address.  Can be specified using `${Property}`.| None - must be specified.|
|[Parameters configure datastore](#parameters)|`DatabaseDialect`<br>**required**| The database dialect, used to format the database connection URL for the matching database driver software. <br><br>See the [table](#sqlalchemy-database-dialects) above for a list of supported dialects.| None - must be specified.|
|[Parameters configure datastore](#parameters)|`DatabaseName`<br>**required**| The name of the database.  Can be specified using `${Property}`.|None - must be specified.|
|[Parameters configure datastore](#parameters)|`DatabaseUser`<br>**required**|The database user.  A read-only "guest" (or similar) account should be used for read-only operations, if possible.  Can be specified using `${Property}`.|None - must be specified.|
|[Parameters configure datastore](#parameters)|`DatabasePassword`<br>**required**|The database password.  Can be specified using `${Property}`.|None - must be specified.|
|[Parameters configure datastore](#parameters)|`DatabasePort`<br>*optional*|The database port.<br><br>See the [table](#sqlalchemy-database-dialects) above for the database default ports.|The default port for the `DatabaseDialect`.|
|[Configuration file configures datastore](#configfile)|`ConfigFile`<br>**required**|The path (relative or absolute) to the file containing the database configurations.|None - must be specified.|

## Examples ##

**The automated tests for this command have not yet been created.**

**Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/OpenDataStore).

## Troubleshooting ##

## See Also ##

* [`CloseDataStore`](../CloseDataStore/CloseDataStore.md) - close a DataStore
* [`ReadTableFromDataStore`](../ReadTableFromDataStore/ReadTableFromDataStore.md) - read a table from a DataStore
* [`WriteTableToDataStore`](../WriteTableToDataStore/WriteTableToDataStore.md) - write a table to a DataStore
