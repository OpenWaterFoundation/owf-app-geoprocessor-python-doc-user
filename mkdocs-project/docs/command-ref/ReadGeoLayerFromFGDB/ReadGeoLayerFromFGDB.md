# Learn GeoProcessor / Command / ReadGeoLayerFromFGDB #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayerFromFGDB` command reads one [GeoLayer)](../../introduction#geolayer) from an [Esri File Geodatabase](../../spatial-data-format-ref/EsriFileGeodatabase/EsriFileGeodatabase). 

* The feautre class to read must be specified. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ReadGeoLayerFromFGDB(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| **Default** |
| --------------|-----------------|----------------- |
| `SpatialDataFolder` <br>  **_required_**| The file geodatabase with the feature class to read (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.| None - must be specified. |
| `Feature Class` <br>  **_required_**| The name of the feature class within the file geodatabase to read. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.| None - must be specified. |
| `GeoLayerID`  <br> **_required_**| A GeoLayer identifier. [Formatting characters](../../introduction/#geolayer-property-format-specifiers) and [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) are recognized. Refer to [documentation](../../best-practices/geolayer-identifiers.md) for best practices on naming GeoLayer identifiers.| None - must be specified. |
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `GeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Warn` : The new GeoLayer is not created. A warning is logged. <br><br> `Fail` : The new GeoLayer is not created. A fail message is logged. | `Replace` | 

## Examples ##

The following folder, `ExampleFolder`[^1], and its contents are used for the examples. 

[^1]: *The `ExampleFolder` is not an actual existing folder. It is used in this documentation to explain how the `ReadGeoLayerFromFGDB` command interacts with similar, existing folders on your local machine.*

**<p style="text-align: left;">
ExampleFolder
</p>**

|Filename|File Type|
| ---- | ----|
| ExampleFileGDB.gdb    | Esri File Geodatabase	|

**<p style="text-align: left;">
ExampleFileGDB.gdb
</p>**

|Feature Class|
| ---- |
|ExampleFeatureClass1|
|ExampleFeatureClass2|
|ExampleFeatureClass3|

### Example 1: Read A Feature Class from a File Geodatabase ###

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadGeoLayerFromFGDB).

```
ReadGeoLayerFromFGDB(SpatialDataFolder = "ExampleFolder/ExampleFileGDB.gdb", Feature Class="ExampleFeatureClass1", GeoLayerID="LayerOne")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|LayerOne|


## Troubleshooting ##

- Requires GDAL/OGR 1.11.0+
- Requires [ESRI FileGDB driver](http://www.gdal.org/drv_filegdb.html) to be installed within QGIS environment
- TODO egiles 2018-01-12 Link to QGIS install instructions that clarify how to install OGR_FileGDB library from [this resource](https://gis.stackexchange.com/questions/26285/file-geodatabase-gdb-support-in-qgis) -- this should be in the install/deploy instructions


## See Also ##

- The GeoLayers are read using the [`QGIS QgsVectorLayer Class`](https://qgis.org/api/classQgsVectorLayer.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/loadlayer.html#vector-layers) for examples on utilizing the `QgsVectorLayer` class in the PyQGIS environment.
- Use the [`ReadGeoLayersFromFGDB`](../ReadGeoLayersFromFGDB/ReadGeoLayersFromFGDB) command to read more than one GeoLayer from a file geodatabase. 