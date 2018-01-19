# Learn GeoProcessor / Command / WriteGeoLayerToGeoJSON #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteGeoLayerToGeoJSON` command writes a [GeoLayer](../../introduction#geolayer) to a file in [GeoJSON format](../../spatial-data-format-ref/GeoJSON/GeoJSON). 

* The attributes of the GeoLayer are retained within the output GeoJSON file. 
* The coordinate reference system can be specified. 
* The coordinate precision can be specified. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
WriteGeoLayerToGeoJSON(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br>  **_required_**| The identifier of the GeoLayer to write.| None - must be specified. |
| `OutputFile` <br> **_required_**| The output GeoJSON file (relative or absolute path). [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |
|`OutputCRS`<br> *optional*|The [coordinate reference system](https://en.wikipedia.org/wiki/Spatial_reference_system) of the output GeoJSON. [EPSG or ESRI code format](http://spatialreference.org/ref/epsg/) required (e.g. [`EPSG:4326`](http://spatialreference.org/ref/epsg/4326/), [`EPSG:26913`](http://spatialreference.org/ref/epsg/nad83-utm-zone-13n/), [`ESRI:102003`](http://spatialreference.org/ref/esri/usa-contiguous-albers-equal-area-conic/)). <br><br>If the output CRS is different than the CRS of the GeoLayer, the output GeoJSON is reprojected to the new CRS.|The GeoLayer's CRS.|  
|`OutputPrecision`<br> *optional*| The number of decimal points to include in the output GeoJSON file's coordinates. Must be a positive [integer](https://en.wikipedia.org/wiki/Integer) at or between 0 and 15. <br><br> The precision of coordinate values can greatly impact the size of the file and precision of drawing the features. For example, a higher `OutputPrecision` value increases the output GeoJSON file size and increases the geometry's precision.[^1]| 5 | 

[^1]: For further explanation, look at the chart under the *Precision* section of the [Decimal degrees Wikipedia page](https://en.wikipedia.org/wiki/Decimal_degrees).

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteGeoLayerToGeoJSON).

The following GeoLayer data are used in the examples[^2]. 
[^2]: The examples assume that the `ExampleGeoLayer1` and `ExampleGeoLayer2` GeoLayers have *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayerID|Coordinate Reference System (CRS)|
| ---- | ----|
| ExampleGeoLayer1  | EPGS:4326	(WGS84) |
| ExampleGeoLayer2	| EPSG:26913 (NAD83 UTM Zone 13N) |

### Example 1: Write a GeoLayer to a GeoJSON File ###

```
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1")
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer2",OutputFile = "ExampleOutputFolder/ExampleFile2")
```

After running the commands, the following GeoJSON files are written to the `ExampleOutputFolder` folder. 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1.geojson|GeoJSON|EPSG:4326	(WGS84)|5|
|ExampleFile2.geojson|GeoJSON|EPSG:26913 (NAD83 UTM Zone 13N)|5|

### Example 2: Reproject the Output GeoJSON File###

```
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1", OutputCRS = "ESRI:102003")
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer2", OutputFile = "ExampleOutputFolder/ExampleFile2", OutputCRS = "EPSG:4326")
```

After running the commands, the following GeoJSON files are written to the `ExampleOutputFolder` folder. 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1.geojson|GeoJSON|ESRI:102003 (USA Contiguous Albers Equal Area Conic)|5|
|ExampleFile2.geojson|GeoJSON|EPSG:4326 (WGS84)|5|

### Example 3: Specify the Coordinate Precision###

```
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1_01",`OutputPrecision = "1")
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1_05")
```

After running the commands, the following GeoJSON files are written to the `ExampleOutputFolder` folder. 

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1_01.geojson|GeoJSON|EPGS:4326	(WGS84)|1|
|ExampleFile1_05.geojson|GeoJSON|EPGS:4326	(WGS84)|5|

---
**ExampleFile1_01.geojson File Content**

```
{
"type":"FeatureCollection",
"name":"ExampleFile1_01",
"crs":{ "type":"name", "properties":{ "name": "urn:ogc:def:crs:OGC:1.3:CRS84"}},
"features":[
{"type": "Feature", "properties": {"id":1},
"geometry":{"type": "Point", "coordinates": [ -1.3, 0.5]}}]
}
```
---

---
**ExampleFile1_05.geojson File Content**

```
{
"type":"FeatureCollection",
"name":"ExampleFile1_05",
"crs":{ "type":"name", "properties":{ "name": "urn:ogc:def:crs:OGC:1.3:CRS84"}},
"features":[
{"type": "Feature", "properties": {"id":1},
"geometry":{"type": "Point", "coordinates": [ -1.33333, 0.52194]}}]
}
```
---

## Troubleshooting ##

## See Also ##

- The GeoLayer is written using the [`QGIS QgsVectorFileWriter Class`](https://qgis.org/api/classQgsVectorFileWriter.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/vector.html#writing-vector-layers) for examples on utilizing the `QGSVectorFileWriter` class in the PyQGIS environment.
- See parallel GeoProcessor command [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON)