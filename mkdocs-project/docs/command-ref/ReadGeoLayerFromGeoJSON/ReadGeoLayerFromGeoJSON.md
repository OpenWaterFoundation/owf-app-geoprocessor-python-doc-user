# Learn GeoProcessor / Command / ReadGeoLayerFromGeoJSON #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayerFromGeoJSON` command reads a [GeoLayer](../../introduction#geolayer) from a file in [GeoJSON format](../../spatial-data-format-ref/GeoJSON/GeoJSON). The coordinate reference system and the attribute field 
names of the GeoJSON file are retained within the GeoLayer.

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
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `GeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor will be overwritten with the new GeoLayer. No warning will be logged.<br><br> `Warn` : The existing GeoLayer within the GeoProcessor will be overwritten with the new GeoLayer. A warning will be logged. <br><br> `Fail` : The new GeoLayer will not be read. A fail message will be logged. | `Replace` | 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadGeoLayerFromGeoJSON).

For the following examples, the contents of a mock data folder `C:/Users/User/Example` are listed below.

**<p style="text-align: left;">
C:/Users/User/Example
</p>**

|Filename|File Type|
| ---- | ----|
| ExampleFile1.geojson  | GeoJSON	|
| ExampleFile2.geojson	| GeoJSON	|

### Example 1: Read a GeoLayer from a GeoJSON File ###

```
ReadGeoLayerFromGeoJSON(SpatialDataFile = "C:/Users/User/Example/ExampleFile1.geojson")
```

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|

### Example 2: Assign a Unique GeoLayer ID###

```
ReadGeoLayerFromGeoJSON(SpatialDataFile = "C:/Users/User/Example/ExampleFile1.geojson", GeoLayerID = "StateBoundary")
```

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|StateBoundary|


## Troubleshooting ##

## See Also ##

- The GeoLayers are read using the [`QGIS QgsVectorLayer Class`](https://qgis.org/api/classQgsVectorLayer.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/loadlayer.html#vector-layers) for examples on utilizing the `QgsVectorLayer` class in the PyQGIS environment.
- See parallel GeoProcessor command [WriteGeoLayerToGeoJSON](../WriteGeoLayerToGeoJSON/WriteGeoLayerToGeoJSON.md)
