# Learn GeoProcessor / Command / CopyGeoLayer #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CopyGeoLayer` command copies a GeoLayer to a new GeoLayer.

* The input GeoLayer's coordinate reference system is retained in the copied GeoLayer. 
* The input GeoLayer's attributes are retained in the copied GeoLayer. 
* The copied GeoLayer's source path is an empty string. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
CopyGeoLayer(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br> **_required_** | The ID of the GeoLayer to be copied. | None - must be specified. |
| `CopiedGeoLayerID` <br>*optional* | The ID of the copied GeoLayer. | `GeoLayerID`_copy |
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `CopiedGeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Warn` : The new GeoLayer is not created. A warning is logged. <br><br> `Fail` : The new GeoLayer is not created. A fail message is logged. | `Replace` | 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/CopyGeoLayer).

The following GeoLayer data is used in the examples[^2]. 
[^2]: The examples assume that the `ExampleGeoLayer` GeoLayer has *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayerID|Coordinate Reference System (CRS)|Source Path|
| ---- | ----|---|
| ExampleGeoLayer| EPGS:4326 (WGS84)|ExampleFolder/ExampleGeoLayer.geojson|

### Example 1: Copy a GeoLayer With Default Parameters###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|Coordinate Reference System (CRS)|Source Path|
| ---- | ----|---|
| ExampleGeoLayer| EPGS:4326 (WGS84)|ExampleFolder/ExampleGeoLayer.geojson|
| ExampleGeoLayer_copy|EPGS:4326 (WGS84)|" "|

### Example 2: Copy a GeoLayer With Defined `CopiedGeoLayerID` Parameter###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", CopiedGeoLayerID="copiedExample")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|Coordinate Reference System (CRS)|Source Path|
| ---- | ----|---|
| ExampleGeoLayer| EPGS:4326 (WGS84)|ExampleFolder/ExampleGeoLayer.geojson|
| copiedExample|EPGS:4326 (WGS84)|" "|

## Troubleshooting ##


## See Also ##
