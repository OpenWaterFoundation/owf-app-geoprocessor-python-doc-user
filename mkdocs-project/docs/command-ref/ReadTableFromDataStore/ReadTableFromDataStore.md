# GeoProcessor / Command / ReadTableFromDataStore #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadTableFromDataStore` command reads a [Table](../../introduction/introduction.md#table) from a database 
[DataStore](../../introduction/introduction.md#datastore) using [Structured Query Language](https://en.wikipedia.org/wiki/SQL) (SQL).
Support for web service datastores may be added in the future. 

Selection criteria must be specified to indicate which data from the DataStore should be read into the Table. 
One of the following three selection methods can be specified:

1.  **Specify a single database table or view to query**
    *   Specify a table or view within the DataStore database. 
    *   Use the `IncludeColumns` and the `ExcludeColumns` parameters to specify which columns within the database table/view to read.
    *   Use the `Top` parameter to limit the number of rows read from the DataStore table. 
2.  **Specify an SQL select statement**
    *   SQL must be valid for the database (syntax may vary based on database software).
    *   SQL syntax is not checked for validity and error messages from the database
        may be difficult to interpret.
3.  **Specify an SQL select statement in a file**
    *   Similar to the above option; however, the SQL statement is read from a file. 
    *   This is useful if the SQL statement is also used by other tools, is long, or contains special characters such as
        double quotes that have meaning in command syntax.
    *   Complex SQL statements can be documented with comments in the file. 

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

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`DataStoreID` <br> **required**| The ID of a database DataStore to read. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. | None - must be specified. |
||**MUST SELECT `1` OF THE FOLLOWING `3` PARAMETERS ... **||
|`DataStoreTable` | The name of the database table to read when querying a single table. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `Sql` or `SqlFile`.|None|
|`Sql`|The SQL string that will be used to query the database. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.<br><br> If specified, do not specify `DataStoreTable` or `SqlFile`.|None|
|`SqlFile`|The name of the file containing an SQL string to execute. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `DataStoreTable` or `Sql`.|None|
|`TableID` <br> **required**| A Table identifier for the table to be created to contain results. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.  Refer to [documentation](../../best-practices/table-identifiers.md) for best practices on naming Table identifiers.|None - must be specified. |
|`Top`| An integer to indicate the number of rows that should be returned. Must be a positive integer. <br><br> *This parameter is only used when `DataStoreTable` is specified. The `Top` value is ignored if the `Sql` or `SqlFile` parameters are specified. The SQL to be executed can include `Top` to achieve a similar result.*|All rows are returned.|
|`IncludeColumns`|A list of glob-style patterns to determine the DataStore table columns to read. <br><br> See [Determining which Columns to Read](#determining-which-columns-to-read).<br><br> *This parameter is only used when `DataStoreTable` is specified. The `IncludeColumns` value is ignored if the `Sql` or `SqlFile` parameters are specified.*|`*` <br><br> All columns are read.|
|`ExcludeColumns`|A list of glob-style patterns to determine the DataStore table columns to NOT read. <br><br> See [Determining which Columns to Read](#determining-which-columns-to-read).<br><br> *This parameter is only used when `DataStoreTable` is specified. The `ExcludeColumns` value is ignored if the `Sql` or `SqlFile` parameters are specified.*|No columns are excluded.|
|`IfTableIDExists`|The action that occurs if the `TableID` already exists within the GeoProcessor.<ul><li>`Replace` - The existing Table within the GeoProcessor is replaced with the new Table. No warning is logged.</li><li>`ReplaceAndWarn` - The existing Table within the GeoProcessor is replaced with the new Table. A warning is logged.</li><li>`Warn` - The new Table is not created. A warning is logged.</li><li>`Fail` : The new Table is not created. A fail message is logged.</li></ul> | `Replace` | 

### Determining Which Columns to Read

*   The `IncludeColumns` parameter is always processed first. The`ExcludeColumns` parameter is always processed second. 
    +   The `IncludeColumns` selects all of the DataStore's database table columns that
        follow the given patterns. By default (`*`) all of the database's table columns are read.
    +   The `ExcludeColumns` removes all of the columns previously selected from the `IncludeColumns` parameter that follow the given patterns. 
        By default, none of the *previously selected* columns are removed.

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/main/test/commands/ReadTableFromDataStore).

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

## Troubleshooting ##

## See Also ##

*   [`OpenDataStore`](../OpenDataStore/OpenDataStore.md) command
*   [`WriteTableToDataStore`](../WriteTableToDataStore/WriteTableToDataStore.md) command
