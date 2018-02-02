# Learn GeoProcessor / Command / SetGeoLayerCRS #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `SetGeoLayerCRS` command sets the [coordinate reference system](https://en.wikipedia.org/wiki/Spatial_reference_system) of a [GeoLayer](../../introduction#geolayer). 

* If the GeoLayer already has a coordinate reference system, this command will reproject the GeoLayer with the input CRS.
* If the GeoLayer does **not** have a coordinate reference system, this command will define the CRS of the GeoLayer with the input CRS. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
SetGeoLayerCRS(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br>  **_required_**| The ID of the GeoLayer to set.| None - must be specified. |
| `CRS` <br> **_required_**|The [coordinate reference system](https://en.wikipedia.org/wiki/Spatial_reference_system). Must be in [EPSG or ESRI code format](http://spatialreference.org/ref/epsg/) (e.g. [`EPSG:4326`](http://spatialreference.org/ref/epsg/4326/), [`EPSG:26913`](http://spatialreference.org/ref/epsg/nad83-utm-zone-13n/), [`ESRI:102003`](http://spatialreference.org/ref/esri/usa-contiguous-albers-equal-area-conic/)).| None - must be specified. |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/SetGeoLayerCRS).

The following GeoLayer data are used in the example[^1]. 
[^1]: The example assume that the GeoLayers have *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayer ID|CRS|
| ---- | ---|
| ExampleGeoLayer1 |EPSG:4326 (WGS84)|
| ExampleGeoLayer2	|`None`|


### Example 1: Reproject a GeoLayer###

```
SetGeoLayerCRS(GeoLayerID = "ExampleGeoLayer1", CRS = "EPSG:26913")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|GeoLayer ID|CRS|
| ---- |---|
| ExampleGeoLayer1  |EPSG:26913 (NAD83 UTM Zone 13N)|
| ExampleGeoLayer2	|`None`|

### Example 2: Define a GeoLayer's CRS###

```
SetGeoLayerCRS(GeoLayerID = "ExampleGeoLayer2", CRS = "EPSG:4326")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|GeoLayer ID|CRS|
| ---- |---|
| ExampleGeoLayer1  |EPSG:4326 (WGS84)|
| ExampleGeoLayer2	|EPSG:4326 (WGS84)|



## Troubleshooting ##

## See Also ##

- The GeoLayer is reprojected using the QGIS processing algorithm  [`qgis:reprojectlayer`](https://docs.qgis.org/2.8/en/docs/user_manual/processing_algs/qgis/vector_general_tools/reprojectlayer.html). 
- The GeoLayer's CRS is defined using the QGIS processing algorithm  `qgis:definecurrentprojection`.