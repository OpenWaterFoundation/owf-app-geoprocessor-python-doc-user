# GeoProcessor / Command / WriteTableToExcel #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteTableToExcel` command writes a [Table](../../introduction/introduction.md#table) to an Excel file. 

* The Table is written as a worksheet in an Excel workbook file. 
* Can write to a new Excel workbook file or to an existing Excel workbook file. 
* An Excel worksheet will be overwritten if the `OutputWorksheet` parameter value is the same as an existing worksheet name. 
* Can specify which Table columns to write to the output Excel file. 
* Can specify whether to include or exclude the Table's index column from the output Excel file.
* Can write to `.xlsx` or `.xls` file format. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
WriteTableToExcel(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `TableID` <br>  **_required_**| The identifier of the Table to write.| None - must be specified. |
| `OutputFile` <br>  **_required_**| The name of the Excel workbook to write to (relative or absolute path). [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. <br><br> Can be an existing or non-existing Excel file. If non-existing, the Excel workbook file (`.xlsx`) is created. | None - must be specified. |
| `OutputWorksheet` <br>  **_required_**| The name of the worksheet that the Table will be written to. Can be an existing or non-existing worksheet. If existing, the worksheet will be overwritten with the Table data. |None - must be specified. |
|`ColumnsToInclude`<br> *optional*| A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to include in the Excel workbook file. <br><br> See [Determining Which Columns to Write](#determining-which-columns-to-write).| `*` <br><br> All columns are written. |  
|`ColumnsToExclude`<br> *optional*| A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to exclude in the Excel workbook file. <br><br> See [Determining Which Columns to Write](#determining-which-columns-to-write).| `'' (empty string)` <br><br> All columns are written. |
|`WriteIndexColumn`<br> *optional*| Boolean. <br><br> If `TRUE`, the Table's index column is *included* in the output Excel file. <br> If `FALSE`, the Table's index column is *not included* in the output Excel file.|`TRUE`|

### Determining Which Columns to Write

* The `ColumnsToInclude` parameter is always processed first. The`ColumnsToExclude` parameter is always processed second. 
	* The `ColumnsToInclude` *selects* all of the Table's columns that follow the given patterns. By default (`*`) all of the Table's columns are included. 
	* The `ColumnsToExclude` *removes* all of the columns *previously selected from the `ColumnsToInclude` parameter* that follow the given patterns. 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteTableToExcel).

The following Table data are used in the examples[^1]. 
[^1]: The examples assume that the `ExampleTable1` and `ExampleTable2` Tables have *already* been read into the GeoProcessor.

**<p style="text-align: left;">
Example Table Data
</p>**

| Table ID|
| ---- | 
| ExampleTable1  | 
| ExampleTable2	| 

**<p style="text-align: left;">
ExampleFolder
</p>**

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products|

### Example 1: Write a Table to an Existing Excel Workbook (New Worksheet) ###

```
WriteTableToExcel(TableID = "ExampleTable1", OutputFile = "ExampleFolder/ExampleFile1.xlsx", OutputWorksheet = "Locations")
```

After running the command, the following Excel workbook files are within the ExampleFolder. 

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products, Locations|

### Example 2: Write a Table to an Existing Excel Workbook (Existing Worksheet) ###

```
WriteTableToExcel(TableID = "ExampleTable2", OutputFile = "ExampleFolder/ExampleFile1.xlsx", OutputWorksheet = "Products")
```

After running the command, the following Excel workbook files exist in the ExampleFolder. Note that the `Products` worksheet is overwritten with the data from the `ExampleTable2` table.

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products|

### Example 3: Write a Table to an New Excel Workbook ###

```
WriteTableToExcel(TableID = "ExampleTable1", OutputFile = "ExampleFolder/ExampleFile2.xlsx", OutputWorksheet = "Locations")
```

After running the command, the following Excel workbook files exist in the ExampleFolder. 

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products|
| ExampleFile2.xlsx|Excel Workbook|Locations|

## Troubleshooting ##

At the current time, you **cannot** write a table to an *existing* Excel workbook file in `.xls` format. 
You **can** write a table to an *existing* Excel workbook file in `.xlsx` format. 
The capability to write a table to an *existing* Excel workbook file in `.xls` format will be enabled in the future. 

## See Also ##

- The Tables are written using the [`Pandas Python library`](https://pandas.pydata.org/). 
- See parallel GeoProcessor command [ReadTableFromExcel](../ReadTableFromExcel/ReadTableFromExcel.md)
