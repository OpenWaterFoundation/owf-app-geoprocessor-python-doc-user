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

Selection criteria must be specified to indicate which data from the DataStore should be read into the Table. 
One of the following three selection methods can be specified:

1. **Specify a single database table to query**
	* Specify a table within the DataStore database. 
	* Currently, all columns from the selected table will be read into the Table. 
	* Parameters will added in the future to select specific columns within a database table.
	* Use the `Top` parameter to limit the number of rows added to the Table. 
2. **Specify a SQL select statement**
	* SQL must be valid for the database (syntax may vary based on database software).
	* SQL syntax is not checked for validity and error messages from the database
	may be difficult to interpret.
3. **Specify an SQL select statement in a file**
	* Similar to the above option; however, the SQL statement is read from a file. 
	* This is useful if the SQL statement is also used by other tools, is long, or contains special characters such as
	double quotes that have meaning in command syntax.
	
Limitations 

* pandas DataFrame objects cannot gracefully handle *null* values in columns representing integer or Boolean data. 
	- [Tables](../../introduction#table) are built on [pandas DataFrame objects](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html). 
The pandas DataFrame object cannot handle *null* values in integer columns or Boolean columns. 
To solve this issue, pandas software casts the integer and Boolean columns with *null* values into other column types that can gracefully handle *null* values. 
See [Pandas - Missing data casting rules and indexing](https://pandas.pydata.org/pandas-docs/stable/missing_data.html#missing-data-casting-rules-and-indexing) for more information.
		- integer columns are casted to float columns	
		- Boolean columns are casted to string/object columns
	- **NEED to include information about how the GeoProcessor provides flexibility to this issue with the `IntNullHandleMethod` parameter**
	- **NEED to include that there is not yet a solution built within the GeoProcessor to gracefully handle the Boolean columns with *null* values**
	
		

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
|`DataStoreID` <br> **_required_**| The ID of a database DataStore to read. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
||**MUST SELECT `1` OF THE FOLLOWING `3` PARAMETERS ... **||
|`DataStoreTable` | The name of the database table to read when querying a single table. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `Sql` or `SqlFile`.|None|
|`Sql`|The SQL string that will be used to query the database. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br> If specified, do not specify `DataStoreTable` or `SqlFile`.|None|
|`SqlFile`|The name of the file containing an SQL string to execute. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `DataStoreTable` or `Sql`.|None|
|`TableID` <br> **_required_**| A Table identifier for the table to be created to contain results. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.  Refer to [documentation](../../best-practices/table-identifiers.md) for best practices on naming Table identifiers.|None - must be specified. |
|`Top` <br> *optional*| An integer to indicate the number of rows that should be returned. Must be a positive integer. <br><br> *This parameter is only used when `DataStoreTable` is enabled. The `Top` value is ignored if the `Sql` or `SqlFile` parameters are enabled.*|All rows are returned.|
|`IntNullHandleMethod` <br> *optional*| The method to use if the DataStoreTable has one or more integer columns containing *null* values. Must be one of the following: <br><br> `ToFloat`: Convert all integer columns with null values into float data. Null values are retained. <br><br>`UseMissingIntValue`: Convert all null values in the integer column to `-9999`. Column data type (int) is retained. <br><br> *This parameter is only used when `DataStoreTable` is enabled. The `IntNullHandleMethod` value is ignored if the `Sql` or `SqlFile` parameters are enabled.*|`ToFloat`|
|`IfTableIDExists`<br> *optional*|The action that occurs if the `TableID` already exists within the GeoProcessor. <br><br> `Replace` : The existing Table within the GeoProcessor is overwritten with the new Table. No warning is logged.<br><br> `ReplaceAndWarn`: The existing Table within the GeoProcessor is overwritten with the new Table. A warning is logged. <br><br> `Warn` : The new Table is not created. A warning is logged. <br><br> `Fail` : The new Table is not created. A fail message is logged. | `Replace` | 

## Examples ##

**NEED to give an example of how to use the `COALESCE` function in a user-provide SQL statement (`Sql` or `SqlFile`) to immitate the `IntNullHandleMethod=UseMissingIntValue` paramter setting. **

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadTableFromDataStore).

## Troubleshooting ##

## See Also ##

* [OpenDataStore](../OpenDataStore/OpenDataStore.md)
* [WriteTableToDataStore](../WriteTableToDataStore/WriteTableToDataStore.md)
