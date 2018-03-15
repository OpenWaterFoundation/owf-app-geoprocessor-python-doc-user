# Learn GeoProcessor / Command / WriteGeoLayerToKML #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteGeoLayerToKML` command writes a [GeoLayer](../../introduction#geolayer) to a file in [KML format](https://en.wikipedia.org/wiki/Keyhole_Markup_Language). 

* The attributes of the GeoLayer are retained within the output KML file. 	
* The coordinate reference system of the output KML file will always be projected in `WGS84` `(EPSG:4326)`. 
	* `Note that KML by specification uses only a single projection, EPSG:4326. All OGR KML output will be presented in EPSG:4326. As such OGR will create layers in the correct coordinate system and transform any geometries.` - [`GDAL KML Driver Specifications`](http://www.gdal.org/drv_kml.html)
* The KML `<name>` element can be specified.
* The KML `<description>` element can be specified.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
WriteGeoLayerToKML(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br>  **_required_**| The identifier of the GeoLayer to write.| None - must be specified. |
| `OutputFile` <br> **_required_**| The output KML file (relative or absolute path). <br> [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. | None - must be specified. |  
|`OutputNameAttribute`<br> *optional*| The GeoLayer attribute to use for the KML `<name>` element. <br><br> For further explanation, look at the example KML document under the *Structure* section of the [Keyhole Markup Language Wikipedia page](https://en.wikipedia.org/wiki/Keyhole_Markup_Language#Structure).|The output KML will not have a `<name>` element.|
|`OutputDescriptionAttribute`<br> *optional*|The GeoLayer attribute to use for the KML `<description>` element. <br><br> For further explanation, look at the example KML document under the *Structure* section of the [Keyhole Markup Language Wikipedia page](https://en.wikipedia.org/wiki/Keyhole_Markup_Language#Structure). <br><br>  | The output KML will not have a `<description>` element.|
 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WriteGeoLayerToKML).

The following GeoLayer data are used in the examples[^1]. 
[^1]: The examples assume that the `ExampleGeoLayer1` and `ExampleGeoLayer2` GeoLayers have *already* been read into the GeoProcessor.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayerID|Coordinate Reference System (CRS)|
| ---- | ----|
| ExampleGeoLayer1  | EPGS:4326	(WGS84) |
| ExampleGeoLayer2	| EPSG:26913 (NAD83 UTM Zone 13N) |

### Example 1: Write a GeoLayer to a KML File ###

```
WriteGeoLayerToKML(GeoLayerID = "ExampleGeoLayer1", OutputFile = "ExampleOutputFolder/ExampleFile1")
WriteGeoLayerToKML(GeoLayerID = "ExampleGeoLayer2", OutputFile = "ExampleOutputFolder/ExampleFile2")
```

After running the commands, the following KML files are written to the `ExampleOutputFolder` folder. 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|File Type|CRS|
|------|---|---|
|ExampleFile1.kml|KML|EPSG:4326	(WGS84)|
|ExampleFile2.kml|KML|EPSG:4326	(WGS84)|


## Troubleshooting ##

- If an `OutputDescriptionAttribute` is specified, the other GeoLayer attributes will not automatically display in a Google Earth pop-up. See [Stack Exchange - ExtendedData and Description coexisting in the same placemark?](https://gis.stackexchange.com/questions/157964/extendeddata-and-description-coexisting-in-the-same-placemark) 

## See Also ##

- The GeoLayer is written using the [`QGIS QgsVectorFileWriter Class`](https://qgis.org/api/classQgsVectorFileWriter.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/vector.html#writing-vector-layers) for examples on utilizing the `QGSVectorFileWriter` class in the PyQGIS environment.