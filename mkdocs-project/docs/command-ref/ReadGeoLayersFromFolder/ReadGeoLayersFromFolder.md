# Learn GeoProcessor / Command / ReadGeoLayerFromFolder #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)

-------------------------

## Overview ##

The `ReadGeoLayerFromFolder` command reads one or many [GeoLayer(s)](../../introduction#geolayer) from a local folder. 

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

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `SpatialDataFolder` | The folder to read. | None - must be specified. |
| `GeoLayerID_prefix` | The prefix included in the GeoLayerID.| No prefix is used. The GeoLayerID is the spatial data filename (without the `.shp` or `.geojson` extension). |
| `Subset_Pattern` 	  | The glob-style pattern of spatial data files to read from the folder.| No pattern is used. All spatial data files (`.shp` and `.geojson`) within the folder are read.|



## Examples ##

**EGILES 2018-01-04 Need to include examples of how the `GeoLayerID_prefix` and the `Subset_Pattern` parameters are used**

## Troubleshooting ##
