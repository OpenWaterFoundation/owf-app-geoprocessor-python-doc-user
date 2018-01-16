# Learn GeoProcessor / Command / WriteGeoLayerToShapefile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteGeoLayerToShapefile` command writes a [GeoLayer](../../introduction#geolayer) to a file in [Esri Shapefile format](../../spatial-data-format-ref/EsriShapefile/EsriShapefile). The attribute field names of the GeoLayer are retained within the output shapefile. The coordinate reference system can be changed within the output shapefile. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
WriteGeoLayerToShapefile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br>  **_required_**| The identifier of the GeoLayer to write.| None - must be specified. |
| `OutputFile` <br> **_required_**| The output Esri Shapefile (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`OutputCRS`<br> *optional*|The coordinate reference system (CRS) of the output shapefile. [EPSG or ESRI code format](http://spatialreference.org/ref/epsg/) required. <br><br>If the output CRS is different than the CRS of the GeoLayer, the output shapefile will be reprojected to the new CRS.|The GeoLayer's CRS.| 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteGeoLayerToShapefile).

For the following examples, the GeoLayers of a mock GeoProcessor are listed below.

**<p style="text-align: left;">
GeoProcessor
</p>**

|GeoLayerID|Coordinate Reference System (CRS)|
| ---- | ----|
| ExampleGeoLayer1  | EPGS:4326	(WGS84) |
| ExampleGeoLayer2	| EPSG:26913 (NAD83 UTM Zone 13N) |

### Example 1: Write a GeoLayer to a Shapefile ###

```
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer1", OutputFile = "C:/Users/User/Example/ExampleFile1")
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer2", OutputFile = "C:/Users/User/Example/ExampleFile2")
```

After running the command lines, the following Esri Shapefiles will be written to the `C:/Users/User/Example` folder.[^1] 
[^1]: Although not listed, note that the component shapefile files (`.shx`, `.dbf`, etc.) will also be present in the output folder. 

**<p style="text-align: left;">
C:/Users/User/Example
</p>**

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1.shp|Esri Shapefile|EPSG:4326	(WGS84)|5|
|ExampleFile2.shp|Esri Shapefile|EPSG:26913 (NAD83 UTM Zone 13N)|5|


### Example 2: Reproject the Output Shapefile###

```
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer1", OutputFile = "C:/Users/User/Example/ExampleFile1", OutputCRS = "ESRI:102003")
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer2", OutputFile = "C:/Users/User/Example/ExampleFile2", OutputCRS = "EPSG:4326")
```

After running the command lines, the following Esri Shapefiles will be written to the `C:/Users/User/Example` folder[^1]. 

**<p style="text-align: left;">
C:/Users/User/Example
</p>**

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1.shp|Esri Shapefile|ESRI:102003 (USA Contiguous Albers Equal Area Conic)|5|
|ExampleFile2.shp|Esri Shapefile|EPSG:4326 (WGS84)|5|



---

## Troubleshooting ##

## See Also ##

- The GeoLayer is written using the [`QGIS QgsVectorFileWriter Class`](https://qgis.org/api/classQgsVectorFileWriter.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/vector.html#writing-vector-layers) for examples on utilizing the `QGSVectorFileWriter` class in the PyQGIS environment.
- See parallel GeoProcessor command [ReadGeoLayerFromShapefile](../ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile)
