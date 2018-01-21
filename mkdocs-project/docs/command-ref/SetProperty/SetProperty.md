# Learn GeoProcessor / Command / SetProperty #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `SetProperty` command sets the value of a property used by the processor. The
property will be available to subsequent commands that support using `${Property}` notation in
parameters, for example to specify filenames more dynamically or use with `If` commands. This
command should not be confused with the `SetGeoLayerProperty` command, which sets a
property on specific GeoLayer. The following functionality is provided:

* Set a property to a specified value, where the property can be a Python primitive type: `bool`, `float`,
`int`, or `str`.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
SetProperty(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `PropertyName` | The property name. | None - must be specified. |
| `PropertyType` | The property type as `bool`, `float`, `int`, or `str`. | None - must be specified. |
| `PropertyValue` | The property value, as a string that can convert to the given type. | None - must be specified. |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/SetProperty).

## Troubleshooting ##

## See Also ##

* [SetPropertyFromGeoLayer](../SetPropertyFromGeoLayer/SetPropertyFromGeoLayer) command
* [WritePropertiesToFile](../WritePropertiesToFile/WritePropertiesToFile) command
