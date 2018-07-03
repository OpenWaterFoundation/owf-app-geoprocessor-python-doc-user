# Learn GeoProcessor / Command / WriteTableToDelimitedFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteTableToDelimitedFile` command writes a [Table](../../introduction#table) to a [delimited file](https://en.wikipedia.org/wiki/Delimiter-separated_values).

* Can specify the delimiter. See the `Delimiter` parameter. 
* Can specify which Table columns to write to the delimited file. See the `ColumnsToInclude` and the `ColumnsToExclude` parameters.
* Can specify to include or exclude the Table's header row. See the `WriteHeaderRow` parameter. 
* Can specify to include or exclude the Table's index column. See the `WriteIndexColumn` parameter.
* Can sort the Table's records. See the `SortingColumn` and `SortingOrder` parameter. 


## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
WriteTableToDelimitedFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`TableID` <br>  **_required_**| The identifier of the Table to write.| None - must be specified. |
|`OutputFile` <br> **_required_**| The output delimited file (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`Delimiter` <br> *optional*| The delimiter of the output delimited file. Must be a single character. |`,`|
|`ColumnsToInclude`<br> *optional*| A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to include in the delimited file. <br><br> See [Determining Which Columns to Write](#determining-which-columns-to-write).| `*` <br><br> All columns are written. |  
|`ColumnsToExclude`<br> *optional*| A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to exclude in the delimited file. <br><br> See [Determining Which Columns to Write](#determining-which-columns-to-write).| `'' (empty string)` <br><br> All columns are written. |
|`WriteHeaderRow`<br> *optional*|Boolean. <br><br> If `TRUE`, the Table's header row is *included* in the output delimited file. <br> If `FALSE`, the Table's header row is *not included* in the output delimited file.|`TRUE`|
|`WriteIndexColumn`<br> *optional*|Boolean. <br><br> If `TRUE`, the Table's index column is *included* in the output delimited file. <br> If `FALSE`, the Table's index column is *not included* in the output delimited file.|`TRUE`|
|`SortingColumn`<br> *optional*|The name of the Table column used to sort the order that the table records are written to the delimited file|The first Table column.|
|`SortingOrder`<br> *optional*|The order to sort the records based on the values of the `SortingColumn`.<br><br>The available options are: <br>`Ascending` ex: *1,2,3* or *A,B,C* <br>`Descending` ex: *3,2,1* or *C,B,A*|`Ascending`|
|`UseSquareBrackets`<br> *optional*|Boolean. <br><br> If `TRUE`, table column *array* values are written as a string with *square* brackets (`[]`).<br> If `FALSE`, table column *array* values are written as a string with *curly* brackets (`{}`).|`TRUE`|

### Determining Which Columns to Write

* The `ColumnsToInclude` parameter is always processed first. The `ColumnsToExclude` parameter is always processed second. 
	* The `ColumnsToInclude` *selects* all of the Table's columns that follow the given patterns. By default (`*`) all of the Table's columns are included. 
	* The `ColumnsToExclude` *removes* all of the columns *previously selected* from the `ColumnsToInclude` parameter* that follow the given patterns. 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteTableToDelimitedFile).

## Troubleshooting ##

## See Also ##

- See parallel GeoProcessor command [ReadTableFromDelimitedFile](../ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md)
