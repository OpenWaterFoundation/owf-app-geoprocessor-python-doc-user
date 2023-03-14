# GeoProcessor / Command / RemoveFile #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `RemoveFile` command removes a file from the file system.
The command is used to remove results files before attempting to regenerate the results and is used extensively in software testing.

A failure will be generated if the file exists and cannot be removed (e.g., due to file permissions or because
the file is being used by another process).

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![RemoveFile](RemoveFile.png)
</p>**

**<p style="text-align: center;">
`RemoveFile` Command Editor (<a href="../RemoveFile.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
RemoveFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `SourceFile`<br>**required** | The name of the file to delete.  Can be specified using `${Property}`. | None - must be specified. |
| `IfSourceFileNotFound` | Indicate an action if the source file is not found:<ul><li> `Ignore` - ignore the missing file and do not warn</li><li>`Warn` - generate a warning message</li><li>`Fail` - generate a failure message</li></ul> | `Warn` |
| `RemoveIfFolder` | Indicates whether folder should be remove:<ul><li>`True` - if the `SourceFile` is a folder/file geodatabase, it will be removed</li><li>`False` - if `SourceFile` is a folder/file geodatabase, it will not be removed.</li></ul> | `False`|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/main/test/commands/RemoveFile).

## Troubleshooting ##

## See Also ##

*   [`CopyFile`](../CopyFile/CopyFile.md) command
