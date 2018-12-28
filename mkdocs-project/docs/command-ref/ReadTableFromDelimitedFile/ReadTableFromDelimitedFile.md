# GeoProcessor / Command / ReadTableFromDelimitedFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadTableFromDelimitedFile` command reads a [Table](../../introduction#table) from a [delimited file](https://en.wikipedia.org/wiki/Delimiter-separated_values).

* All rows and columns from the delimited file are read into the Table.
* Use the `Delimiter` parameter to specify the delimiter of the delimited file. 
* Use the `HeaderLines` parameter to specify the number of initial lines representing non-data comments. 
* Use the `NullValues` parameter to specify the string values within the delimited file that should br converted to `NULL` values. The Python `None` will be used internally.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ReadTableFromDelimitedFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`InputFile` <br> **_required_**| The delimited file (relative or absolute path) to read. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`TableID` <br> *required*| A Table identifier. Refer to [documentation](../../best-practices/table-identifiers.md) for best practices on naming Table identifiers.|None - must be specified. |
|`Delimiter` <br> *optional*| The delimiter character of the input delimited file.|`,` (*comma*)|
|`HeaderLines` <br> *optional*|The number of rows representing non-data comments. These columns are not included in the output Table data values.|`0`|
|`NullValues` <br> *optional*|A list of values within the delimited file that should br converted to `NULL` values. The Python `None` will be used internally.|Empty table cell is assumed to be an empty string for string columns and `None` for other data types.|
|`IfTableIDExists`<br> *optional*|The action that occurs if the `TableID` already exists within the GeoProcessor. <br><br> `Replace` : The existing Table within the GeoProcessor is overwritten with the new Table. No warning is logged.<br><br> `ReplaceAndWarn`: The existing Table within the GeoProcessor is overwritten with the new Table. A warning is logged. <br><br> `Warn` : The new Table is not created. A warning is logged. <br><br> `Fail` : The new Table is not created. A fail message is logged. | `Replace` | 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadTableFromDelimitedFile).

## Troubleshooting ##

## See Also ##

- [WriteTableToDelimitedFile](../WriteTableToDelimitedFile/WriteTableToDelimitedFile.md) command

