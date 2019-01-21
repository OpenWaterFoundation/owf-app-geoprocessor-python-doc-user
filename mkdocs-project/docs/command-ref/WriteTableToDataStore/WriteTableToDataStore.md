# GeoProcessor / Command / WriteTableToDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The WriteTableToDataStore command processes each row in a [Table](../../introduction/introduction.md#table) and executes an SQL statement to insert the row into a database [DataStore](../../introduction/introduction.md#datastore). 
This command can only be used with database DataStores. 
This command is useful, in particular, for bulk data loading such as for database initialization. 

Column mapping is available so that the Table column names do not need to match the database column names.

**General constraints are as follows:**

- the table being written must be writeable by the user specified for the database connection 
- data types for table columns must be compatible with database data columns:
	- internally an SQL statement is created in which data values are formatted as per the data type (e.g., strings are quoted);
	consequently column types must be appropriate to generate correct formatting
	- the full precision of floating point numbers is passed to the database 
		- formatting for display will not apply to values written to the database		
- the specified table columns are written (all are written by default)
- primary keys in the database table do not need to be specified 
	- their values will be assigned automatically
	- an error is thrown when specifying a primary key value 
- table columns that correspond to related tables in the datastore table need to be mapped using the `DataStoreRelatedColumnsMap` command parameter
	- **this is NOT currently enabled**


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

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Default**|
| --------------|-----------------|----------------- |
|`TableID ` <br> **_required_**|The ID of the Table to write. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`IncludeColumns` <br>*optional*|A comma-separated list of the [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to write. <br><br> See [Determining which Columns to Process](#determining-which-columns-to-process).|`*` <br><br> All columns are processed.|
|`ExcludeColumns` <br>*optional*|A comma-separated list of the [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to write. <br><br> See [Determining which Columns to Process](#determining-which-columns-to-process).| `'' (empty string)` <br><br> All columns are processed.|  
|`DataStoreID`<br> **_required_**|The ID of the DataStore to receive the data. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`DataStoreTable` <br> **_required_**|The name of the DataStore table to receive data. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`ColumnMap` <br>*optional*|Specify which columns in the Table have different names in the DataStore table. <br><br> Use the syntax: `ColumnName:DatastoreTableName, ColumnName:DatastoreTableName,...`|DataStore table columns names are assumed to match the Table column names.|
|`DataStoreRelatedColumnsMap` <br>*optional*|Indicate datastore columns that need to match values in a related table in the datastore. <br><br> *This parameter is currently disabled.*|DataStore table columns are assumed to match the column names in TableID, with no need to perform reference table value matching.|
|`WriteMode` <br>*optional*|The method used to write data. <br><br>`NewTableInsert`: a new table is added to the database and all rows of TableID are added to the database table<br><br>`ExistingTableOverwrite`: the existing database table is dropped and another database table is added (with the same name). All rows of TableID are added to the database table <br><br> `ExistingTableInsert`: rows of the TableID that do NOT conflict with any of the rows in the existing database table are appended to the database table.<br><br>`ExistingTableUpdate`: rows of the TableID that do conflict with any of the rows in the existing database table are used to update the existing database rows. The rows that do NOT conflict with any of the rows in the existing database table are NOT appended to the database table.<br><br> `ExistingTableInsertUpdate`: rows of the TableID that do NOT conflict with any of the rows in the existing database table are appended to the database table. Rows of the TableID that do conflict with any of the rows in the existing database table are used to update the existing database rows. |None|

### Determining Which Columns to Process
* The `IncludeColumns` parameter is always processed first. The`ExcludeColumns` parameter is always processed second. 
	* The `IncludeColumns` *selects* all of the Table's columns that follow the given patterns. By default (`*`) all of the Table's columns are included. 
	* The `ExcludeColumns` *removes* all of the columns *previously selected from the `IncludeColumns` parameter* that follow the given patterns. 

## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteTableToDataStore).

## Troubleshooting ##

## See Also ##

* [OpenDataStore](../OpenDataStore/OpenDataStore.md)
* [ReadTableFromDataStore](../ReadTableFromDataStore/ReadTableFromDataStore.md)
