# Learn GeoProcessor / Command / WriteGeoLayerToShapefile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteGeoLayerToShapefile` command writes a [GeoLayer](../../introduction#geolayer) to a file in [Esri Shapefile format](../../spatial-data-format-ref/EsriShapefile/EsriShapefile). 

* The attributes of the GeoLayer are retained within the output shapefile. 
* The coordinate reference system can be specified. 

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
|`OutputCRS`<br> *optional*|The [coordinate reference system](https://en.wikipedia.org/wiki/Spatial_reference_system) of the output shapefile. [EPSG or ESRI code format](http://spatialreference.org/ref/epsg/) required (e.g. [`EPSG:4326`](http://spatialreference.org/ref/epsg/4326/), [`EPSG:26913`](http://spatialreference.org/ref/epsg/nad83-utm-zone-13n/), [`ESRI:102003`](http://spatialreference.org/ref/esri/usa-contiguous-albers-equal-area-conic/)). <br><br>If the output CRS is different than the CRS of the GeoLayer, the output shapefile is reprojected to the new CRS.|The GeoLayer's CRS.| 
|`ZipOutput`<br> *optional*|Boolean. <br><br>If `TRUE`, the GeoLayer is written as a zipped shapefile. <br>If `FALSE` the GeoLayer is witten as an unzipped shapefile.| `FALSE`|


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteGeoLayerToShapefile).

The following GeoLayer data are used in the examples[^1]. 
[^1]: The examples assume that the `ExampleGeoLayer1` and `ExampleGeoLayer2` GeoLayers have *already* been read into the GeoProcessor with the [ReadGeoLayerFromShapefile](../ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayerID|Coordinate Reference System (CRS)|
| ---- | ----|
| ExampleGeoLayer1  | EPGS:4326	(WGS84) |
| ExampleGeoLayer2	| EPSG:26913 (NAD83 UTM Zone 13N) |

### Example 1: Write a GeoLayer to a Shapefile ###

```
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1")
```

After running the command, the following Esri Shapefile is written to the `ExampleOutputFolder` folder.

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|
|------|
|ExampleFile1.shp|
|ExampleFile1.shx|
|ExampleFile1.dbf|
|ExampleFile1.cpg|
|ExampleFile1.qpj|
|ExampleFile1.prj|


### Example 2: Write a GeoLayer to a Shapefile (compressed)

```
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1", ZipOutput="True")
```

After running the command, the following Esri Shapefile is written to the `ExampleOutputFolder` folder.

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|
|------|
|ExampleFile1.zip|


### Example 3: Reproject the Output Shapefile###

```
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1", OutputCRS = "ESRI:102003")
WriteGeoLayerToShapefile(GeoLayerID = "ExampleGeoLayer2", OutputFile = "ExampleOutputFolder/ExampleFile2", OutputCRS = "EPSG:4326")
```

After running the commands, the following Esri Shapefiles are written to the `ExampleOutputFolder` folder[^2]. 
[^2]: Although not listed, note that the component shapefile files (.shx, .dbf, etc.) will also be present in the output folder.
**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|File Type|CRS|
|------|---|---|
|ExampleFile1.shp|Esri Shapefile|ESRI:102003 (USA Contiguous Albers Equal Area Conic)|
|ExampleFile2.shp|Esri Shapefile|EPSG:4326 (WGS84)|



## Troubleshooting ##

## See Also ##

- The GeoLayer is written using the [`QGIS QgsVectorFileWriter Class`](https://qgis.org/api/classQgsVectorFileWriter.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/vector.html#writing-vector-layers) for examples on utilizing the `QGSVectorFileWriter` class in the PyQGIS environment.
- See parallel GeoProcessor command [ReadGeoLayerFromShapefile](../ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile)
