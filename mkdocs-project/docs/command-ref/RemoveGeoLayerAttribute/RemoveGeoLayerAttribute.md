# Learn GeoProcessor / Command / RemoveGeoLayerAttribute #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `RemoveGeoLayerAttribute` command removes a single attribute from a GeoLayer.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
RemoveGeoLayerAttribute(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br> **_required_** | The ID of the GeoLayer with the attribute to be removed. | None - must be specified. |
| `AttributeName` <br> **_required_** | The name of the attribute to be removed. Case-specific.| None - must be specified. |



## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/RemoveGeoLayerAttribute).

The following GeoLayer data is used in the example[^2]. 
[^2]: The example assumes that the `ExampleGeoLayer` GeoLayer has *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayerID|
| ---- |
|ExampleGeoLayer|

**<p style="text-align: left;">
ExampleGeoLayer's Attribute Table
</p>**

|id|school|mascot|students|faculty|
|----|----|-----|-----|-----|
|1|Hill|Bulldogs|546|42|
|2|Bright|Gators|304|24|
|3|Gunn|Colts|567|43|

### Example 1: Remove an Attribute###

```
RemoveGeoLayerAttribute(GeoLayerID="ExampleGeoLayer", AttributeName="mascot")
```

After running the command, the ExampleGeoLayer has the following attribute table.

|id|school|students|faculty|
|----|----|-----|-----|
|1|Hill|546|42|
|2|Bright|304|24|
|3|Gunn|567|43|


## Troubleshooting ##


## See Also ##

- GeoLayer attributes are removed using the [`QGIS QGSVectorDataProvider Class`](https://qgis.org/api/classQgsVectorDataProvider.html). See [documentation](https://docs.qgis.org/2.14/en/docs/pyqgis_developer_cookbook/vector.html#adding-and-removing-fields) for examples on utilizing the `QgsVectorDataProvider` class in the PyQGIS environment.
- See parallel GeoProcessor command [AddGeoLayerAttribute](../AddGeoLayerAttribute/AddGeoLayerAttribute)
