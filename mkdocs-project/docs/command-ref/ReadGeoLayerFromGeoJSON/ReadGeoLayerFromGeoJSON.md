# Learn GeoProcessor / Command / ReadGeoLayerFromGeoJSON #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)

-------------------------

## Overview ##

The `ReadGeoLayerFromGeoJSON` command reads a [GeoLayer](../../introduction#geolayer) from a file in GeoJSON format. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ReadGeoLayerFromGeoJSON(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `SpatialDataFile` | The GeoJSON file to read. | None - must be specified. |
| `GeoLayerID` | The GeoLayer identifier.| The GeoJSON filename (without the `.geojson` extension). |



## Examples ##

## Troubleshooting ##
