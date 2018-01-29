# Learn GeoProcessor / Command / AddGeoLayerAttribute #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `AddGeoLayerAttribute` command adds a single attribute to a single GeoLayer.

* The attribute name and attribute type are specified.
* The attribute values of the added attribute are empty. 
* The new attribute name cannot be the same as an existing attribute name within the GeoLayer. 
* It is highly recommended that the new attribute name is 10 characters or less. See [Esri Shapefile limitations](../../spatial-data-format-ref/EsriShapefile/EsriShapefile/#limitations).

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
AddGeoLayerAttribute(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerID` <br> **_required_** | The ID of the GeoLayer to have an attribute added. | None - must be specified. |
| `AttributeName` <br> **_required_** | The attribute name. Highly recommended to be 10 or less characters. Case-specific.| None - must be specified. |
| `AttributeType` <br> **_required_** | The attribute data type. Must be one of the following options: <br><br> `string` : The attribute values will be text. <br> _e.g. `blue`, `Colorado`, `helicopter`_<br><br> `int` : The attribute values will be [integers](https://en.wikipedia.org/wiki/Integer). <br> _e.g. `100`, `0`, `-54`_ <br><br> `double` : The attribute values will be [real numbers](https://en.wikipedia.org/wiki/Real_number). <br> _e.g.`100.01`, `0.00089`, `-54.0`_ <br><br> `date` : The attribute values will be date values. <br>_e.g. `YYYY-MM-DD` format is recommended._| None - must be specified. |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/AddGeoLayerAttribute).

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

### Example 1: Add Attributes to a GeoLayer###

```
AddGeoLayerAttribute(GeoLayerID="ExampleGeoLayer", AttributeName="est_date", AttributeType="date")
AddGeoLayerAttribute(GeoLayerID="ExampleGeoLayer", AttributeName="principal", AttributeType="string")
```

After running the commands, the ExampleGeoLayer has the following attribute table.

|id|school|mascot|students|faculty|est_date|principal|
|----|----|-----|-----|-----|---|----|
|1|Hill|Bulldogs|546|42|
|2|Bright|Gators|304|24|
|3|Gunn|Colts|567|43|



## Troubleshooting ##

* More options can be included for the `AttributeType` parameter. Contact the [Open Water Foundation](http://openwaterfoundation.org/) if the current options for the `AttributeType` parameter do not meet your needs.

## See Also ##

- GeoLayer attributes are added using the [`QGIS QGSVectorDataProvider Class`](https://qgis.org/api/classQgsVectorDataProvider.html).
- See parallel GeoProcessor command [RemoveGeoLayerAttributes](../RemoveGeoLayerAttributes/RemoveGeoLayerAttributes)