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

* The entire table is written to the output file.
* The delimiter can be specified.
* Can specify to include or exclude the Table's header row from the output delimited file. 
* Can specify to include or exclude the Table's index column from the output delimited file. 

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
| `TableID` <br>  **_required_**| The identifier of the Table to write.| None - must be specified. |
| `OutputFile` <br> **_required_**| The output delimited file (relative or absolute path). The file extension is not required. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`Delimiter` <br> *optional*| The delimiter of the output delimited file. Must be a single character. |`,`|
|`WriteHeaderRow`<br> *optional*| Boolean. <br><br> If `TRUE`, the Table's header row is *included* in the output delimited file. <br> If `FALSE`, the Table's header row is *not included* in the output delimited file.|`TRUE`|
|`WriteIndexColumn`<br> *optional*| Boolean. <br><br> If `TRUE`, the Table's index column is *included* in the output delimited file. <br> If `FALSE`, the Table's index column is *not included* in the output delimited file.|`TRUE`|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteTableToDelimitedFile).

The following Table data are used in the examples[^1]. 
[^1]: The examples assume that the Tables have *already* been read into the GeoProcessor.

**<p style="text-align: left;">
Example Table Data
</p>**

|TableID|
| ---- |
| ExampleTable  |
| ExampleTable2	|

**<p style="text-align: left;">
ExampleTable 
</p>**

|Id|Color|Landmark|
|---|---|---|
|1|Blue|River Crossing|
|2|Blue|Courthouse|
|3|Red|Farmhouse|
|4|Blue|Bakery|



### Example 1: Write a Table to a Delimited File ###

```
WriteTableToDelimitedFile(TableID = "ExampleTable", OutputFile = "ExampleOutputFolder/ExampleFile1_comma")
WriteTableToDelimitedFile(TableID = "ExampleTable", OutputFile = "ExampleOutputFolder/ExampleFile1_semicolon", Delimiter = ";")
```

After running the commands the following delimited files are written to the `ExampleOutputFolder` folder. 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|Delimiter|
|------|---|
|ExampleFile1_comma.csv|`,`|
|ExampleFile1_semicolon.csv|`;`|

---
**ExampleFile1_comma.csv File Content**

```
Id,Color,Landmark
1,Blue,River Crossing
2,Blue,Courthouse
3,Red,Farmhouse
4,Blue,Bakery
```
---

---
**ExampleFile1_semicolon.csv File Content**

```
Id;Color;Landmark
1;Blue;River Crossing
2;Blue;Courthouse
3;Red;Farmhouse
4;Blue;Bakery
```
---

## Troubleshooting ##

## See Also ##

- The Tables are written using the [`Pandas Python library`](https://pandas.pydata.org/). 
- See parallel GeoProcessor command [ReadTableFromDelimitedFile](../ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md)
