# Learn GeoProcessor / Command / ReadGeoLayersFromFGDB #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayersFromFGDB` command reads one or more [GeoLayer(s)](../../introduction#geolayer) from an [Esri File Geodatabase](../../spatial-data-format-ref/EsriFileGeodatabase/EsriFileGeodatabase). By default, each feature class within the file geodatabase is read as a single GeoLayer.

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
| `SpatialDataFolder` <br>  **_required_**| The file geodatabse to read (must end in `.gdb`). | None - must be specified. |
| `GeoLayerID_prefix`  <br> *optional* | A GeoLayer identifier prefix. <br><br> GeoLayers read from a file geodatabase have an identifier in the `GeoLayerID_prefix`_`FeatureClass` format.| No prefix is used. The GeoLayerID is the name of the feature class. |
| `Subset_Pattern` 	 <br> *optional*| The [glob-style](https://en.wikipedia.org/wiki/Glob_(programming)) pattern (e.g., `CO_*` or `*_[MC]O`) of feature classes to read from the file geodatabase.| No pattern is used. All feature classes within the file geodatabase are read.|
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `GeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor will be overwritten with the new GeoLayer. No warning will be logged.<br><br> `Warn` : The existing GeoLayer within the GeoProcessor will be overwritten with the new GeoLayer. A warning will be logged. <br><br> `Fail` : The new GeoLayer will not be read. A fail message will be logged. | `Replace` |

## Examples ##

For the following examples, the contents of a mock data folder `C:/Users/User/Example` and the contents of a mock Esri File Geodatabase `ExampleFileGDB.gdb` are listed below.

**<p style="text-align: left;">
C:/Users/User/Example
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

### Example 1: Read All Feature Classes from a File Geodatabse ###

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadGeoLayersFromFGDB).

```
ReadGeoLayersFromFGDB(SpatialDataFolder = "C:/Users/User/Example/ExampleFileGDB.gdb")
```

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|ExampleFeatureClass1|
|ExampleFeatureClass2|
|ExampleFeatureClass3|

### Example 2: Add a Prefix to the GeoLayer IDs ###

```
ReadGeoLayersFromFGDB(SpatialDataFolder = "C:/Users/User/Example/ExampleFileGDB.gdb", GeoLayerID_Prefix = "StateData")
```

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. Each of the registered GeoLayer IDs include the `StateData` prefix.

|Registered GeoLayer IDs|
|------|
|StateData_ExampleFeatureClass1|
|StateData_ExampleFeatureClass2|
|StateData_ExampleFeatureClass3|

### Example 3: Read a Subset of Feature Classes From a File Geodatabase###

`ReadGeoLayersFromFGDB(`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`SpatialDataFolder = "C:/Users/User/Example/ExampleFileGDB.gdb",`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`Subset_Pattern = "*3")`<br>

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. ExampleFeatureClass1 and ExampleFeatureClass2 are not included in the registered GeoLayer IDs becasue the `Subset_Pattern` parameter only includes feature classes that end in `3`. 

|Registered GeoLayer IDs|
|------|
|ExampleFeatureClass3|


## Troubleshooting ##

- Requires GDAL/OGR 1.11.0+
- Requires [ESRI FileGDB driver](http://www.gdal.org/drv_filegdb.html) to be installed within QGIS environment
- TODO egiles 2018-01-12 Link to QGIS install instructions that clarify how to install OGR_FileGDB library from [this resource](https://gis.stackexchange.com/questions/26285/file-geodatabase-gdb-support-in-qgis) -- this should be in the install/deploy instructions


## See Also ##

- The GeoLayers are read using the [`QGIS QgsVectorLayer Class`](https://qgis.org/api/classQgsVectorLayer.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/loadlayer.html#vector-layers) for examples on utilizing the `QgsVectorLayer` class in the PyQGIS environment.