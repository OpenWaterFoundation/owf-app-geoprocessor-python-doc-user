# Learn GeoProcessor / Command / ReadGeoLayerFromShapefile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)

-------------------------

## Overview ##

The `ReadGeoLayerFromShapefile` command reads a [GeoLayer](../../introduction#geolayer) from a file in shapefile format. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ReadGeoLayerFromShapefile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `SpatialDataFile` | The shapefile (`.shp`) to read . | None - must be specified. |
| `GeoLayerID` | The GeoLayer identifier.| The shapefile filename (without the `.shp` extension). |



## Examples ##

## Troubleshooting ##
