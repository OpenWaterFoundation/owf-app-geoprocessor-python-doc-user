# Learn GeoProcessor / Command / WriteTableToExcel #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteTableToExcel` command reads a [Table](../../introduction#table) from an Excel file. 

* Can write to a new Excel workbook file or to an existing Excel workbook file. 
* An Excel worksheet will be overwritten if the `OutputSheetName` is the same as an existing worksheet name. 

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
| `OutputFile` <br>  **_required_**| The name of the Excel workbook to write to (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. <br><br> Can be an existing or non-existing excel file. If non-existing, the Excel workbook file (`.xlsx`) is created. | None - must be specified. |
| `OutputSheetName` <br>  **_required_**| The name of the worksheet that the Table will be written to. Can be an existing or non-existing worksheet. If existing, the worksheet will be overwritten with the Table data. |None - must be specified. |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteTableToExcel).

The following Table data are used in the examples[^1]. 
[^1]: The examples assume that the `ExampleTable1` and `ExampleTable2` Tables have *already* been read into the GeoProcessor.

**<p style="text-align: left;">
Example Table Data
</p>**

|GeoLayerID|
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
WriteTableToExcel(TableID = "ExampleTable1", OutputFile = "ExampleFolder/ExampleFile1.xlsx", OutputSheetName = "Locations")
```

After running the command, the following Excel workbook files are within the ExampleFolder. 

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products, Locations|


### Example 2: Write a Table to an Existing Excel Workbook (Existing Worksheet) ###

```
WriteTableToExcel(TableID = "ExampleTable2", OutputFile = "ExampleFolder/ExampleFile1.xlsx", OutputSheetName = "Products")
```

After running the command, the following Excel workbook files are within the ExampleFolder. Note that the `Products` worksheet is overwritten with the data from the `ExampleTable2` table.

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products|

### Example 3: Write a Table to an New Excel Workbook ###

```
WriteTableToExcel(TableID = "ExampleTable1", OutputFile = "ExampleFolder/ExampleFile2.xlsx", OutputSheetName = "Locations")
```

After running the command, the following Excel workbook files are within the ExampleFolder. 

|Filename|File Type|Worksheets|
| ---- |---|----|
| ExampleFile1.xlsx |Excel Workbook|Clients, Products|
| ExampleFile2.xlsx|Excel Workbook|Locations|


## Troubleshooting ##

## See Also ##

- The Tables are written using the [`Pandas Python library`](https://pandas.pydata.org/). 
- See parallel GeoProcessor command [ReadTableFromExcel](../ReadTableFromExcel/ReadTableFromExcel.md)
