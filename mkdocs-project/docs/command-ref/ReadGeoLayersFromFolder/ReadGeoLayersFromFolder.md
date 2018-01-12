# Learn GeoProcessor / Command / ReadGeoLayersFromFolder #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayersFromFolder` command reads one or many [GeoLayer(s)](../../introduction#geolayer) from a local folder. By default, each spatial data file ([GeoJSON]((../../spatial-data-format-ref/GeoJSON/GeoJSON)) or [Esri Shapefile](../../spatial-data-format-ref/EsriShapefile/EsriShapefile)) within the folder is read as a single GeoLayer.

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
| `GeoLayerID_prefix`  <br> *optional* | A GeoLayer identifier prefix. <br><br> GeoLayers read from a folder have an identifier in the `GeoLayerID_prefix`_`Filename` format.| No prefix is used. The GeoLayerID is the spatial data filename without the leading path and without the file extension (Formatting character `%f`). |
| `Subset_Pattern` 	 <br> *optional*| The [glob-style](https://en.wikipedia.org/wiki/Glob_(programming)) pattern of spatial data files to read from the folder.| No pattern is used. All spatial data files (`.shp` and `.geojson`) within the folder are read.|
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `GeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor will be overwritten with the new GeoLayer. No warning will be logged.<br><br> `Warn` : The existing GeoLayer within the GeoProcessor will be overwritten with the new GeoLayer. A warning will be logged. <br><br> `Fail` : The new GeoLayer will not be read. A fail message will be logged. | `Replace` |


## Examples ##

For the following examples, the contents of a mock data folder `C:/Users/User/Example` are listed below.

**<p style="text-align: left;">
C:/Users/User/Example
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

`ReadGeoLayersFromFolder(`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`SpatialDataFolder = "C:/Users/User/Example")`<br>

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. ExampleFile3 is not included within the registered GeoLayer IDs because `ExampleFile3.txt` is not a [supported spatial data file](../../spatial-data-format-ref/overview). 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|
|ExampleFile2|
|ExampleFile4|

### Example 2: Add a Prefix to the GeoLayer IDs###

`ReadGeoLayersFromFolder(`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`SpatialDataFolder = "C:/Users/User/Example",`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`GeoLayerID_Prefix = "StateData")`<br>

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. Each of the registered GeoLayer IDs include the `StateData` prefix.

|Registered GeoLayer IDs|
|------|
|StateData_ExampleFile1|
|StateData_ExampleFile2|
|StateData_ExampleFile4|

### Example 3: Read a Subset of Spatial Data Files from a Folder ###

`ReadGeoLayersFromFolder(`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`SpatialDataFolder = "C:/Users/User/Example",`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`Subset_Pattern = "*.geojson")`<br>

After running the command line, the following GeoLayer IDs will be registered within the GeoProcessor. ExampleFile4 is not included in the registered GeoLayer IDs becasue the `Subset_Pattern` parameter only includes files that end in `.geojson`. 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|
|ExampleFile2|



## Troubleshooting ##

## See Also ##

The GeoLayers are read using the [`QGIS QgsVectorLayer Class`](https://qgis.org/api/classQgsVectorLayer.html).
