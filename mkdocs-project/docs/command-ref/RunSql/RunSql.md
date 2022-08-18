# GeoProcessor / Command / RunSql#

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The RunSql command executes a [Structured Query Language (SQL)](https://en.wikipedia.org/wiki/SQL)
statement on the specified [DataStore](../../introduction/introduction.md#datastore).

* This command cannot be used with web service datastores because the underlying software relies on a database to execute the SQL statement. 
* This command is useful when a database task needs to be automated in sequence with other GeoProcessor commands. 

The SQL statement can be specified in the following ways:

1. **Specify a SQL select statement**
    * SQL must be valid for the database (syntax may vary based on database software).
    * SQL syntax is not checked for validity and error messages from the database
      may be difficult to interpret.
2. **Specify an SQL select statement in a file**
    * Similar to the above option; however, the SQL statement is read from a file. 
    * This is useful if the SQL statement is also used by other tools, is long, or contains special characters such as
      double quotes that have meaning in command syntax.
3. **Specify a procedure to run**
    * Available procedures are listed and can be selected.
    * This method is **not** currently enabled.

General constraints on executing the statement are as follows:

* The table, views, and procedures being queried must be readable (some databases restrict direct access to data and require using stored procedures).
* Any SQL statement can be run; consequently, suitable authentication and permissions should be in place to protect against unintended changes to the database
* SQL syntax varies between database software so care should be take to use standard SQL if possible.
* Results from the statement such as rows modified currently are not displayed, although status and errors will be shown and added to the log file. 
  Use the [`ReadTableFromDataStore`](../ReadTableFromDataStore/ReadTableFromDataStore.md) command to process statements that return a result set.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
RunProgram(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `DataStoreID`<br>**required** | The ID of a DataStore to process. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. | None - must be specified. |
||**MUST SELECT `1` OF THE FOLLOWING `3` PARAMETERS ... **||
| `Sql` | The SQL statement text that will be executed. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `SqlFile` or `DataStoreProcedure`.|None|
|`SqlFile`|The name of the file containing the SQL statement text to execute. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `DataStoreProcedure` or `Sql`.|None|
|`DataStoreProcedure`|The name of the database procedure to run. *This parameter is currently disabled.* <br><br>If specified, do not specify `Sql` or `SqlFile`.|None|

## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

* See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/RunSql).

## Troubleshooting ##

## See Also ##

* [`OpenDataStore`](../OpenDataStore/OpenDataStore.md) command
* [`ReadTableFromDataStore`](../ReadTableFromDataStore/ReadTableFromDataStore.md) command
* [`WriteTableToDataStore`](../WriteTableToDataStore/WriteTableToDataStore.md) command
* [W3schools SQL Tutorial](https://www.w3schools.com/sql/)
