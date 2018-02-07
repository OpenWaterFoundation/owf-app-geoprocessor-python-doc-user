# Learn GeoProcessor / Command / SimplifyGeoLayerGeometry #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `SimplifyGeoLayerGeometry` command decreases the number of verticies within the geometries of a [GeoLayer](../../introduction#geolayer).

* This command is designed to simplify GeoLayers with `LINE` or `POLYGON` geometry. GeoLayers with `POINT` geometry *cannot* be simplified with this command.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
SimplifyGeoLayerGeometry(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br>  **_required_**| The ID of the GeoLayer to be simplified.| None - must be specified. |
| `Tolerance`  <br>  **_required_**| The `ε` variable in the `Douglas–Peucker algorithm`. Units are the same as those used in GeoLayer's coordinate reference system. <br><br> Refer to the [Douglas–Peucker Algorithm](#douglas-peuker-algorithim) section for more information. |None - must be specified. |


## Douglas–Peucker Algorithm

The `SimplifyGeoLayerGeometry` command simplifies the features of a GeoLayer with the [`Douglas–Peucker algorithim`]("https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm"). A point is discarded along a line or polygon if the point "does not deviate significantly from its surrounding points". [(E&B Software)](https://www.eandbsoftware.org/reducing-a-map-path-using-douglas-peucker-algorithm/). The significance level is determined by the `Tolerance` parameter value. 

```
TODO egiles 2018-02-07 Steve, I need help understanding how detailed I should explain this algorithm. It is quite complicated and I do not want to over-complicate things. Below are some sources that attempt to explain how this algorithm simplifies a line or polygon. 
```

* [http://www.tankonyvtar.hu/hu/tartalom/tamop425/0027_SAN1/ch01s05.html](http://www.tankonyvtar.hu/hu/tartalom/tamop425/0027_SAN1/ch01s05.html)
* [https://www.eandbsoftware.org/reducing-a-map-path-using-douglas-peucker-algorithm/](https://www.eandbsoftware.org/reducing-a-map-path-using-douglas-peucker-algorithm/)
* [https://www.codeproject.com/Articles/114797/Polyline-Simplification](https://www.codeproject.com/Articles/114797/Polyline-Simplification)


||Original GeoLayer|Simplified GeoLayer: `LARGE` Tolerance Value|Simplified GeoLayer: `SMALL` Tolerance Value|
|----|:---:|:---:|:---:|
|Number of points *significantly* deviating from the surrounding points|`NONE`|`MORE`|`LESS`|
|Number of points that will be removed from the GeoLayer|`NONE`|`MORE`|`LESS`|
|Geometry Precision|`PRECISE`|`LESS PRECISE`|`EVEN LESS PRECISE`|
|Output file size of the simplified GeoLayer|`LARGE`|`LESS LARGE`|`EVEN LESS LARGE`|


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/SimplifyGeoLayerGeometry).

The following GeoLayer data are used in the examples[^1] Note that these examples are referencing the results of the automated tests. 
[^1]: The examples assume that the GeoLayer has *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayer ID|CRS|File Size (if written out to GeoJSON)|
| ---- | ---|---|
| `polygon_summit_co_nad83_utm_z13n` |EPSG:26913 (NAD83 UTM Zone 13N)|90 KB|

| polygon_summit_co_nad83_utm_z13n|
|-|
|![Original_GeoLayer](images\Original_Polgyon.PNG)|


### Example 1: Simplify a GeoLayer (Smaller Tolerance)###

```
SimplifyGeoLayerGeometry(GeoLayerID = "polygon_summit_co_nad83_utm_z13n", Tolerance = "100")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|GeoLayer ID|CRS|File Size (if written out to GeoJSON)|
| ---- | ---|---|
| `polygon_summit_co_nad83_utm_z13n` |EPSG:26913 (NAD83 UTM Zone 13N)|11 KB|

|polygon_summit_co_nad83_utm_z13n (simplified)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tolerance Value: 100 |
|-|
|![Simplified_GeoLayer_100](images\Simplified_Polygon_100.PNG)|

|The simplified GeoLayer looks similar to the original GeoLayer. Below is an image of the two GeoLayers at a larger scale. |
|--|
|![Original_Simplified_Overlay](images\Original_Simplified100_Overlay.PNG)|


### Example 2: Simplify a GeoLayer (Larger Tolerance)###

```
SimplifyGeoLayerGeometry(GeoLayerID = "polygon_summit_co_nad83_utm_z13n", Tolerance = "1000")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|GeoLayer ID|CRS|File Size (if written out to GeoJSON)|
| ---- | ---|---|
| `polygon_summit_co_nad83_utm_z13n` |EPSG:26913 (NAD83 UTM Zone 13N)|2 KB|

|polygon_summit_co_nad83_utm_z13n (simplified)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tolerance Value: 1000 |
|-|
|![Simplified_GeoLayer_100](images\Simplified_Polygon_1000.PNG)|


## Troubleshooting ##

## See Also ##

- The GeoLayer is simplified using the QGIS processing algorithm  [`qgis:simplifygeometries`](https://docs.qgis.org/2.8/en/docs/user_manual/processing_algs/qgis/vector_geometry_tools/simplifygeometries.html). 