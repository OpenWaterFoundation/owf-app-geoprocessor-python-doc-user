# GeoProcessor / Command / StartRegressionTestResultsReport #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `StartRegressionTestResultsReport` command starts a report file (and optionally results table) to be written to as regression tests are run.
The [CreateRegressionTestCommandFile](../CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) command automatically
inserts this command and is the preferred way to set up automated tests.
The [RunCommands](../RunCommands/RunCommands.md) commands will write to this file (and optionally results table) if available.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

![StartRegressionTestResultsReport](StartRegressionTestResultsReport.png)

**<p style="text-align: center;">
`StartRegressionTestResultsReport` Command Editor (<a href="../StartRegressionTestResultsReport.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
StartRegressionTestResultsReport(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `OutputFile` | The regression results report file to write, as an absolute path or relative to the command file.  Can use `${Property}`. | None - must be specified. |

## Examples ##

* See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/StartRegressionTestResultsReport).

## Troubleshooting ##

## See Also ##

* [CreateRegressionTestCommandFile](../CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) command
* [RunCommands](../RunCommands/RunCommands.md) command
* [WriteCommandSummaryToFile](../WriteCommandSummaryToFile/WriteCommandSummaryToFile.md) command
