# Learn GeoProcessor / Command / ReadTableFromDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadTableFromDataStore` command reads a [Table](../../introduction#table) from a [DataStore](../../introduction#datastore).

Selection criteria must be entered to determine which data from the DataStore should be read into the Table. 
You can choose from one of the three selection methods:

1. **Specify a single DataStore table to query**
	* Specify a table within the DataStore. 
	* For the time being, all columns from the selected table will be read into the Table. 
	* With future development, parameters will become available that allow users to select specific columns within a database table.
2. **Specify a SQL select statement**
	* SQL must be valid for the database (syntax may vary based on database software)
	* SQL syntax is not checked for validity and therefore error messages from the database
may be more difficult to interpret.
3. **Specify an SQL select statement in a file**
	* Similar to the above option; however, the SQL statement is read from a file. 
	* This is useful if the SQL statement is also used by other tools

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ReadTableFromDataStore(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`DataStoreID` <br> **_required_**| The ID of a database datastore to read. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
||**MUST SELECT `1` OF THE FOLLOWING `3` PARAMETERS ... **||
|`DataStoreTable` | The name of the database table to read when querying a single table. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `Sql` or `SqlFile`.|None|
|`Sql`|The SQL string that will be used to query the database. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br> If specified, do not specify `DataStoreTable` or `SqlFile`.|None|
|`SqlFile`|The name of the file containing an SQL string to execute. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `DataStoreTable` or `Sql`.|None|
|`TableID` <br> **_required_**| A Table identifier. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.  Refer to [documentation](../../best-practices/table-identifiers.md) for best practices on naming Table identifiers. |None - must be specified. |
|`IfTableIDExists`<br> *optional*|The action that occurs if the `TableID` already exists within the GeoProcessor. <br><br> `Replace` : The existing Table within the GeoProcessor is overwritten with the new Table. No warning is logged.<br><br> `ReplaceAndWarn`: The existing Table within the GeoProcessor is overwritten with the new Table. A warning is logged. <br><br> `Warn` : The new Table is not created. A warning is logged. <br><br> `Fail` : The new Table is not created. A fail message is logged. | `Replace` | 

## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadTableFromDataStore).

## Troubleshooting ##

## See Also ##

- See parallel GeoProcessor command [WriteTableToDataStore](../WriteTableToDataStore/WriteTableToDataStore.md)

