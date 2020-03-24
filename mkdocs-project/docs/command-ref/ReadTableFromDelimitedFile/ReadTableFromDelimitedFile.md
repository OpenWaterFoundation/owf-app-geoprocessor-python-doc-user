# GeoProcessor / Command / ReadTableFromDelimitedFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadTableFromDelimitedFile` command reads a [Table](../../introduction/introduction.md#table)
from a [delimited file](https://en.wikipedia.org/wiki/Delimiter-separated_values).

* All rows and columns from the delimited file are read into the Table.
* Use the `Delimiter` parameter to specify the delimiter of the delimited file. 
* Use the `HeaderLines` parameter to specify the number of initial lines representing non-data comments. 
* Use the `NullValues` parameter to specify the string values within the delimited file that should
be converted to `NULL` values. The Python `None` will be used internally.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![ReadTableFromDelimitedFile](ReadTableFromDelimitedFile.png)
</p>**

**<p style="text-align: center;">
`ReadTableFromDelimitedFile` Command Editor (<a href="../ReadTableFromDelimitedFile.png">see full-size image</a>)
</p>**

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
|`InputFile` <br>**required**| The delimited file (relative or absolute path) to read. [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`TableID` <br> **required**| A Table identifier. Refer to [documentation](../../best-practices/table-identifiers.md) for best practices on naming Table identifiers.|None - must be specified. |
|`Delimiter` | The delimiter character of the input delimited file.|`,` (*comma*)|
|`HeaderLines` |The number of rows representing non-data comments. These columns are not included in the output Table data values.|`0`|
|`NullValues` |A list of values within the delimited file that should be converted to `NULL` values. The Python `None` will be used internally.|Empty table cell is assumed to be an empty string for string columns and `None` for other data types.|
|`IfTableIDExists` |The action that occurs if the `TableID` already exists within the GeoProcessor.<ul><li>`Replace` - The existing Table within the GeoProcessor is replaced with the new Table. No warning is logged.</li><li>`ReplaceAndWarn` - The existing Table within the GeoProcessor is replaced with the new Table. A warning is logged.</li><li>`Warn` - The new Table is not created. A warning is logged.</li><li>`Fail` - The new Table is not created. A fail message is logged.</li></ul> | `Replace` | 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadTableFromDelimitedFile).

## Troubleshooting ##

## See Also ##

* [`WriteTableToDelimitedFile`](../WriteTableToDelimitedFile/WriteTableToDelimitedFile.md) command
