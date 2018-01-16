# Learn GeoProcessor / Command / WriteGeoLayerToGeoJSON #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteGeoLayerToGeoJSON` command writes a [GeoLayer](../../introduction#geolayer) to a file in [GeoJSON format](../../spatial-data-format-ref/GeoJSON/GeoJSON). The attribute field names of the GeoLayer are retained within the output GeoJSON file. The coordinate reference system and the coordinate precision can be changed within the output GeoJSON file. 

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
|`OutputCRS`<br> *optional*|The coordinate reference system (CRS) of the output GeoJSON file. [EPSG or ESRI code format](http://spatialreference.org/ref/epsg/) required. <br><br>If the output CRS is different than the CRS of the GeoLayer, the output GeoJSON file will be reprojected to the new CRS.|The GeoLayer's CRS.| 
|`OutputPrecision`<br> *optional*| The number of decimal points to include in the output GeoJSON file's coordinates. Must be a positive, whole number at or between 0 and 15. A higher value increases the output GeoJSON file size and increases the geometry's precision.| 5 | 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteGeoLayerToGeoJSON).

For the following examples, the GeoLayers of a mock GeoProcessor are listed below.

**<p style="text-align: left;">
GeoProcessor
</p>**

|GeoLayerID|Coordinate Reference System (CRS)|
| ---- | ----|
| ExampleGeoLayer1  | EPGS:4326	(WGS84) |
| ExampleGeoLayer2	| EPSG:26913 (NAD83 UTM Zone 13N) |

### Example 1: Write a GeoLayer to a GeoJSON File ###

```
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "C:/Users/User/Example/ExampleFile1")
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer2",OutputFile = "C:/Users/User/Example/ExampleFile1")
```

After running the command lines, the following GeoJSON files will be writen to the `C:/Users/User/Example` folder. 

**<p style="text-align: left;">
C:/Users/User/Example
</p>**

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1.geojson|GeoJSON|EPSG:4326	(WGS84)|5|
|ExampleFile2.geojson|GeoJSON|EPSG:26913 (NAD83 UTM Zone 13N)|5|

### Example 2: Reproject the Output GeoJSON File###

```
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "C:/Users/User/Example/ExampleFile1", OutputCRS = "ESRI:102003")
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer2", OutputFile = "C:/Users/User/Example/ExampleFile1", OutputCRS = "EPSG:4326")
```

After running the command lines, the following GeoJSON files will be writen to the `C:/Users/User/Example` folder. 

**<p style="text-align: left;">
C:/Users/User/Example
</p>**

|Filename|File Type|CRS|Coordinate Precision|
|------|---|---|---|
|ExampleFile1.geojson|GeoJSON|ESRI:102003 (USA Contiguous Albers Equal Area Conic)|5|
|ExampleFile2.geojson|GeoJSON|EPSG:4326 (WGS84)|5|

### Example 3: Specify the Coordinate Precision###

```
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "C:/Users/User/Example/ExampleFile1_01",`OutputPrecision = "1")
WriteGeoLayerToGeoJSON(GeoLayerID = "ExampleGeoLayer1", OutputFile = "C:/Users/User/Example/ExampleFile1_05")
```

After running the command lines, the following GeoJSON files will be writen to the `C:/Users/User/Example` folder. 

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