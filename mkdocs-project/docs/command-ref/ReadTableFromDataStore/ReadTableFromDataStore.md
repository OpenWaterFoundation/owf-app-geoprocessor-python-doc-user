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

1. **Specify a single database table or view to query**
	* Specify a table within the DataStore database. 
	* Currently, all columns from the selected table/view will be read into the Table. 
	* Parameters will added in the future to select specific columns within a database table/view.
	* Use the `Top` parameter to limit the number of rows read from the DataStore table. 
	* Use the `IntNullHandleMethod` and the `IntNullValue` parameters to gracefully handle *null* values in integer columns.
2. **Specify a SQL select statement**
	* SQL must be valid for the database (syntax may vary based on database software).
	* SQL syntax is not checked for validity and error messages from the database
	may be difficult to interpret.
3. **Specify an SQL select statement in a file**
	* Similar to the above option; however, the SQL statement is read from a file. 
	* This is useful if the SQL statement is also used by other tools, is long, or contains special characters such as
	double quotes that have meaning in command syntax.
	
Limitations 

* Pandas DataFrame objects cannot gracefully handle *null* values in columns representing integer or Boolean data. 
	- [Tables](../../introduction#table) are built on [pandas DataFrame objects](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html). 
The pandas DataFrame object cannot handle *null* values in integer columns or Boolean columns. 
To solve this issue, pandas software casts the integer and Boolean columns with *null* values into other column types that can gracefully handle *null* values. 
See [Pandas - Missing data casting rules and indexing](https://pandas.pydata.org/pandas-docs/stable/missing_data.html#missing-data-casting-rules-and-indexing) for more information.
		- *integer* columns are cast to *float* columns	
		- *Boolean* columns are cast to *string/object* columns
	- The GeoProcessor allows two methods to handle integer columns with *null* values. The first, `ToFloat` method, mirrors the default Pandas solution by casting the integer columns to float columns. 
	The second, `UseIntNullValue` method, keeps the column an integer type but replaces the *null* values with a set integer value to represent *null values*. 
	See the `IntNullHandleMethod` parameter description in the below Command Parameters table for more information.
	- The GeoProcesssor currently adapts the default Pandas solution to handle Boolean columns with *null* values. 
	The default solution is to cast the Boolean columns with *null* values into string/object columns.
	In the future, the GeoProcessor will be enhanced to add greater flexibility in handling *null* values for Boolean columns.
	
		

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
|`DataStoreID` <br> **_required_**| The ID of a database DataStore to read. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
||**MUST SELECT `1` OF THE FOLLOWING `3` PARAMETERS ... **||
|`DataStoreTable` | The name of the database table to read when querying a single table. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `Sql` or `SqlFile`.|None|
|`Sql`|The SQL string that will be used to query the database. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br> If specified, do not specify `DataStoreTable` or `SqlFile`.|None|
|`SqlFile`|The name of the file containing an SQL string to execute. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.<br><br>If specified, do not specify `DataStoreTable` or `Sql`.|None|
|`TableID` <br> **_required_**| A Table identifier for the table to be created to contain results. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.  Refer to [documentation](../../best-practices/table-identifiers.md) for best practices on naming Table identifiers.|None - must be specified. |
|`Top` <br> *optional*| An integer to indicate the number of rows that should be returned. Must be a positive integer. <br><br> *This parameter is only used when `DataStoreTable` is specified. The `Top` value is ignored if the `Sql` or `SqlFile` parameters are specified.*|All rows are returned.|
|`IntNullHandleMethod` <br> *optional*| The method to use if the DataStoreTable has one or more integer columns containing *null* values. Must be one of the following: <br><br> `ToFloat`: Convert all integer columns with null values into float data. Null values are retained. This is the default Pandas behavior.<br><br>`UseIntNullValue`: Convert all null values in the integer column to the value specified by the `IntNullValue` parameter. Column data type (int) is retained. <br><br> *This parameter is only used when `DataStoreTable` is enabled. The `IntNullHandleMethod` value is ignored if the `Sql` or `SqlFile` parameters are enabled. See the example for how to specify SQL to achieve similar results to the `UseIntNullValue` selection.*|`ToFloat`|
|`IntNullValue` <br> *optional*|Integer value (positive or negative) used to represent null values when `IntNullHandleMethod` is set to `UseIntNullValue`. <br><br>  *This parameter is only used when `IntNullHandleMethod` is set to `UseIntNullValue`.*|`-9999999999`<br> (`-1E+10`)|
|`IfTableIDExists`<br> *optional*|The action that occurs if the `TableID` already exists within the GeoProcessor. <br><br> `Replace` : The existing Table within the GeoProcessor is overwritten with the new Table. No warning is logged.<br><br> `ReplaceAndWarn`: The existing Table within the GeoProcessor is overwritten with the new Table. A warning is logged. <br><br> `Warn` : The new Table is not created. A warning is logged. <br><br> `Fail` : The new Table is not created. A fail message is logged. | `Replace` | 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadTableFromDataStore).

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

### Specify SQL Statement to Achieve `UseIntNullValue` Results

As mentioned, the pandas DataFrame object cannot currently represent *null* values in integer or Boolean columns. 
By default, the pandas software casts any integer columns with one or more *null* values into float columns. 
The GeoProcessor allows a second method to handle the integer columns with *null* values. 
The `UseIntNullValue` `IntNullHandleMethod` keeps the integer columns as integer columns but replaces the null values with an integer value representing a *null* value. 
The integer value representing a *null* value, by default, is set to `-9999999999` but can be set with the `IntNullValue` parameter. 


The `UseIntNullValue` `IntNullHandleMethod` is only available for the `DataStoreTable` method. 
To achieve similar results to the `UseIntNullValue` selection when using the `Sql` or `SqlFile` method, design your SQL statement with the following structure:

```
SELECT 
[non-integer columns], 
[integer columns] 
FROM [table]
```

where:

|SQL Segment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|Description|
|-|-|
|`[non-integer columns]`|comma-separated list of the non-integer columns to read<br><br>Example:<br>`product_name, product_status, product_department`|
|`[integer columns]`|comma-separated list of [COALESCE](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql?view=sql-server-2017) statements each representing an integer column to read and the integer value to use if the column value is set to *null*<br><br>Example:<br>`COALESCE(product_id, -9999999999), COALESCE(product_inventory_count, -9999999999), COALESCE(product_sold_count, -9999999999)` |
|`[table]`|name of the DataStore table to read<br><br>Example:<br>`products`|

	
Full SQL Statement Example:

```
SELECT 
product_name, product_status, product_department, 
COALESCE(product_id, -9999999999), COALESCE(product_inventory_count, -9999999999), COALESCE(product_sold_count, -9999999999)
FROM products
```

## Troubleshooting ##

## See Also ##

* [OpenDataStore](../OpenDataStore/OpenDataStore.md)
* [WriteTableToDataStore](../WriteTableToDataStore/WriteTableToDataStore.md)
