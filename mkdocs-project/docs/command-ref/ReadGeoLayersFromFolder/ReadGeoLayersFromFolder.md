# Learn GeoProcessor / Command / ReadGeoLayersFromFolder #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayersFromFolder` command reads one or more [GeoLayer(s)](../../introduction#geolayer) from a local folder. 

* By default, each spatial data file ([GeoJSON]((../../spatial-data-format-ref/GeoJSON/GeoJSON)) or [Esri Shapefile](../../spatial-data-format-ref/EsriShapefile/EsriShapefile)) within the folder is read as a single GeoLayer.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ReadGeoLayersFromFolder(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| **Default** |
| --------------|-----------------|----------------- |
| `SpatialDataFolder` <br>  **_required_**| The folder to read. | None - must be specified. |
| `GeoLayerID_prefix`  <br> *optional* | A GeoLayer identifier prefix. <br><br> GeoLayers read from a folder have an identifier in the `GeoLayerID_prefix`_`Filename` format.| No prefix is used. The GeoLayerID is the spatial data filename without the leading path and without the file extension ([Formatting character `%f`](../../text-formatting-ref/text-formatting/#formatting-characters)). |
| `Subset_Pattern` 	 <br> *optional*| The [glob-style](https://en.wikipedia.org/wiki/Glob_(programming)) pattern (e.g., `CO_*` or `*_[MC]O`) of spatial data files to read from the folder.| No pattern is used. All spatial data files (`.shp` and `.geojson`) within the folder are read.|
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the GeoLayerID already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Warn` : The new GeoLayer is not created. A warning is logged. <br><br> `Fail` : The new GeoLayer is not created. A fail message is logged. | `Replace` |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadGeoLayersFromFolder).

The following folder, `ExampleFolder`[^1], and its contents are used for the examples. 

[^1]: *The `ExampleFolder` is not an actual existing folder. It is used in this documentation to explain how the `ReadGeoLayerFromFolder` command interacts with similar, existing folders on your local machine.*

**<p style="text-align: left;">
ExampleFolder
</p>**

|Filename|File Type|
| ---- | ----|
| ExampleFile1.geojson | GeoJSON |
| ExampleFile2.geojson | GeoJSON |
| ExampleFile3.txt 	   | Text 	 |
| ExampleFile4.shp     | Shapefile	|
| ExampleFile4.shx		| Shapefile component file|
| ExampleFile4.dbf		| Shapefile component file |
| ExampleFile4.prj 		| Shapefile component file |

### Example 1: Read All Spatial Data Files from a Folder ###

```
ReadGeoLayersFromFolder(SpatialDataFolder = "ExampleFolder")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. ExampleFile3 is not included within the registered GeoLayer IDs because `ExampleFile3.txt` is not a [supported spatial data file](../../spatial-data-format-ref/overview). 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|
|ExampleFile2|
|ExampleFile4|

### Example 2: Add a Prefix to the GeoLayer IDs###

```
ReadGeoLayersFromFolder(SpatialDataFolder = "ExampleFolder", GeoLayerID_Prefix = "StateData")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. Each of the registered GeoLayer IDs include the `StateData` prefix.

|Registered GeoLayer IDs|
|------|
|StateData_ExampleFile1|
|StateData_ExampleFile2|
|StateData_ExampleFile4|

### Example 3: Read a Subset of Spatial Data Files from a Folder ###

```
ReadGeoLayersFromFolder(SpatialDataFolder = "ExampleFolder", Subset_Pattern = "*.geojson")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. ExampleFile4 is not included in the registered GeoLayer IDs becasue the `Subset_Pattern` parameter only includes files that end in `.geojson`. 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|
|ExampleFile2|


## Troubleshooting ##

## See Also ##

- The GeoLayers are read using the [`QGIS QgsVectorLayer Class`](https://qgis.org/api/classQgsVectorLayer.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/loadlayer.html#vector-layers) for examples on utilizing the `QgsVectorLayer` class in the PyQGIS environment.
