# GeoProcessor / Command / CompareFiles #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CompareFiles` command compares text files to determine differences.
For example, the command can be used to compare expected and new files produced by a software process.
This command is suitable for comparing files that are generally similar,
but is not suitable for comparing files that are very different,
although it may be enhanced in the future to provide more sophisticated comparison features.

Each line in the file is compared. By default, lines beginning with `#` are treated as comment lines and are
ignored (see `CommentLineChar` to specify the comment indicator).
Therefore, only non-comment lines are compared.
Comment lines in the middle of the file are simply discarded.
If the file lengths are different, each line that exists in one file but not the other counts as a difference.

Differences and simple statistics are printed to the log file.
A warning can be generated if a difference is detected or if no differences are detected.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.
If both input files exist and the `C:\Program Files\KDiff3\kdiff3.exe` program exists,
the ***View Diff*** button will be enabled to display a visual difference.
The KDiff3 software is one option for a visual difference program.
In the future, a `DiffProgram` property will be used with GeoProcessor configuration file (future feature).

**<p style="text-align: center;">
![CompareFiles](CompareFiles.png)
</p>**

**<p style="text-align: center;">
`CompareFiles` Command Editor (<a href="../CompareFiles.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CompareFiles(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `InputFile1`<br>**required** | The name of the first file to read for comparison.  Can be specified using `${Property}`. | None - must be specified. |
| `InputFile2`<br>**required** | The name of the second file to read for comparison.  Can be specified using `${Property}`. | None - must be specified. |
| `CommentLineChar` | The character(s) that if found at the start of a line indicate comment lines. Comment lines are ignored in the comparison because they typically may include information such as date/time that changes even if the remainder of the file contents is the same. | `#` |
| `MatchCase` | If `True`, lines must match exactly.  If `False`, case is ignored for the comparison. | `True` |
| `IgnoreWhitespace` | If `True`, then each line is trimmed to remove leading and trailing whitespace characters (spaces, tabs, etc.) before doing the comparison.  If `False`, then whitespace is retained for the comparison. | `False` |
| `AllowedDiffCount` | The number of lines allowed to be different, when checking for differences.  This is useful, for example, when a non-comment line contains the date/time when the file was generated, and other dynamic data. | `0` |
| `IfDifferent` | Indicate the action if the source files are different:<ul><li>`Ignore` - ignore differences and do not warn</li><li>`Warn` - generate a warning message</li><li>`Fail` - generate a failure message</li></ul> | `Ignore` |
| `IfSame` | Indicate the action if the source files are the same:<ul><li>`Ignore` - ignore if same and do not warn</li><li>`Warn` - generate a warning message</li><li>`Fail` - generate a failure message</li></ul>| `Ignore` |
| `LineDiffCountProperty` | The name of a processor property to set to the count of different lines.  Can be specified using `${Property}`. | |
| `FileDiffProperty` | The name of a processor property to set `True` or `False` boolean to indicate if the files are different.  Can be specified using `${Property}`. | |

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/CompareFiles).

## Troubleshooting ##

## See Also ##
