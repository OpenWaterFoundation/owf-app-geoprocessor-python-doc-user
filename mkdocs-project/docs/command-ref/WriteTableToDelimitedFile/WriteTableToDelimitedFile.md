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
* Can specify which Table columns to write to the delimited file. 
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
| `OutputFile` <br> **_required_**| The output delimited file (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`Delimiter` <br> *optional*| The delimiter of the output delimited file. Must be a single character. |`,`|
|`ColumnsToInclude`<br> *optional*| A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to include in the delimited file. <br><br> See [Determining Which Columns to Write](#determining-which-columns-to-write).| `*` <br><br> All columns are written. |  
|`ColumnsToExclude`<br> *optional*| A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which columns to exclude in the delimited file. <br><br> See [Determining Which Columns to Write](#determining-which-columns-to-write).| `'' (empty string)` <br><br> All columns are written. |
|`WriteIndexColumn`<br> *optional*| Boolean. <br><br> If `TRUE`, the Table's index column is *included* in the output delimited file. <br> If `FALSE`, the Table's index column is *not included* in the output delimited file.|`TRUE`|

### Determining Which Columns to Write

* The `ColumnsToInclude` parameter is always processed first. The`ColumnsToExclude` parameter is always processed second. 
	* The `ColumnsToInclude` *selects* all of the Table's columns that follow the given patterns. By default (`*`) all of the Table's columns are included. 
	* The `ColumnsToExclude` *removes* all of the columns *previously selected from the `ColumnsToInclude` parameter* that follow the given patterns. 

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
,Id,Color,Landmark
0,1,Blue,River Crossing
1,2,Blue,Courthouse
2,3,Red,Farmhouse
3,4,Blue,Bakery
```
---

---
**ExampleFile1_semicolon.csv File Content**

```
;Id;Color;Landmark
0;1;Blue;River Crossing
1;2;Blue;Courthouse
2;3;Red;Farmhouse
3;4;Blue;Bakery
```
---

### Example 2: Write a Table to a Delimited File (Exclude Index Column)

```
WriteTableToDelimitedFile(TableID = "ExampleTable", OutputFile = "ExampleOutputFolder/ExampleFile1", WriteIndexColumn="False")
```

After running the commands the following delimited file is written to the `ExampleOutputFolder` folder. 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|Delimiter|
|------|---|
|ExampleFile1.csv|`,`|

---
**ExampleFile1.csv File Content**

```
Id,Color,Landmark
1,Blue,River Crossing
2,Blue,Courthouse
3,Red,Farmhouse
4,Blue,Bakery
```
---

### Example 3: Write a Table to a Delimited File (Write a Subset of Columns)

```
WriteTableToDelimitedFile(TableID = "ExampleTable", OutputFile = "ExampleOutputFolder/ExampleFile1_ID", WriteIndexColumn="False", ColumnsToInclude="Id")
WriteTableToDelimitedFile(TableID = "ExampleTable", OutputFile = "ExampleOutputFolder/ExampleFile2_noID", WriteIndexColumn="False", ColumnsToExclude="Id")
```

After running the commands the following delimited files are written to the `ExampleOutputFolder` folder. 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|Delimiter|
|------|---|
|ExampleFile1_ID.csv|`,`|
|ExampleFile2_noID.csv|`,`|

---
**ExampleFile1_ID.csv File Content**

```
Id
1
2
3
4
```
---

---
**ExampleFile2_noID.csv File Content**

```
Color,Landmark
Blue,River Crossing
Blue,Courthouse
Red,Farmhouse
Blue,Bakery
```
---

## Troubleshooting ##

## See Also ##

- The Tables are written using the [`Pandas Python library`](https://pandas.pydata.org/). 
- See parallel GeoProcessor command [ReadTableFromDelimitedFile](../ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md)
