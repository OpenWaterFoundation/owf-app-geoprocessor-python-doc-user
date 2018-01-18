# Learn GeoProcessor / Command / ReadGeoLayerFromGeoJSON #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayerFromGeoJSON` command reads a [GeoLayer](../../introduction#geolayer) from a file in [GeoJSON format](../../spatial-data-format-ref/GeoJSON/GeoJSON). 

* The coordinate reference system of the GeoJSON file is retained within the GeoLayer.
* The attributes of the GeoJSON file are retained within the GeoLayer.

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

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `SpatialDataFile` <br>  **_required_**| The GeoJSON file to read (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.| None - must be specified. |
| `GeoLayerID` <br> *optional*| A GeoLayer identifier. [Formatting characters](../../introduction/#geolayer-property-format-specifiers) are recognized. Refer to [documentation](../../best-practices/geolayer-identifiers.md) for best practices on naming GeoLayer identifiers.| The GeoJSON filename without the leading path and without the file extension. (Formatting character `%f`)|
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `GeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `Warn` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Fail` : The new GeoLayer is not read. A fail message is logged. | `Replace` | 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadGeoLayerFromGeoJSON).

The following folder, `ExampleFolder`[^1], and its contents are used for the examples. 

[^1]: *The `ExampleFolder` is not an actual existing folder. It is used in this documentation to explain how the `ReadGeoLayerFromGeoJSON` command interacts with similar, existing folders on your local machine.*

**<p style="text-align: left;">
ExampleFolder
</p>**

|Filename|File Type|
| ---- | ----|
| ExampleFile1.geojson  | GeoJSON	|
| ExampleFile2.geojson	| GeoJSON	|

### Example 1: Read a GeoLayer from a GeoJSON File ###

```
ReadGeoLayerFromGeoJSON(SpatialDataFile = "ExampleFolder/ExampleFile1.geojson")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|

### Example 2: Assign a Unique GeoLayer ID###

```
ReadGeoLayerFromGeoJSON(SpatialDataFile = "ExampleFolder/ExampleFile1.geojson", GeoLayerID = "StateBoundary")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|StateBoundary|


## Troubleshooting ##

## See Also ##

- The GeoLayers are read using the [`QGIS QgsVectorLayer Class`](https://qgis.org/api/classQgsVectorLayer.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/loadlayer.html#vector-layers) for examples on utilizing the `QgsVectorLayer` class in the PyQGIS environment.
- See parallel GeoProcessor command [WriteGeoLayerToGeoJSON](../WriteGeoLayerToGeoJSON/WriteGeoLayerToGeoJSON.md)
