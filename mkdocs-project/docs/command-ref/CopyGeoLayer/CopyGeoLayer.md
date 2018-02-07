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
| `IncludeAttributes` <br>*optional* | A list of the attributes to include in the copied GeoLayer. All attributes not listed will not be copied. <br><br> `IncludeAttributes` and `ExcludeAttributes` must not both be enabled. *Choose one or none.*| All attributes are copied.|
| `ExcludeAttributes` <br>*optional* | A list of the attributes to exclude in the copied GeoLayer. All attributes not listed will be copied. <br><br> `ExcludeAttributes` and `IncludeAttributes` must not both be enabled. *Choose one or none.*| All attributes are copied. |  
|`IncludeFeaturesIf` <br>*optional* | An attribute query specifying features to include in the copied GeoLayer. Expression syntax and capabilities follows [QGIS Expression](https://docs.qgis.org/2.8/en/docs/user_manual/working_with_vector/expression.html) standards.|All features are copied.|
| `CopiedGeoLayerID` <br>*optional* | The ID of the copied GeoLayer. | `GeoLayerID`_copy |
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `CopiedGeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Warn` : The new GeoLayer is not created. A warning is logged. <br><br> `Fail` : The new GeoLayer is not created. A fail message is logged. | `Replace` | 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/CopyGeoLayer).

The following GeoLayer data is used in the examples[^2]. 
[^2]: The examples assume that the `ExampleGeoLayer` GeoLayer has *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayerID|
| ---- | 
| ExampleGeoLayer| 

**<p style="text-align: left;">
ExampleGeoLayer Attribute Table
</p>**

|id|school|mascot|students|faculty|
|----|----|-----|-----|-----|
|1|Hill|Bulldogs|546|42|
|2|Bright|Gators|304|24|
|3|Gunn|Colts|567|43|

### Example 1: Copy a GeoLayer###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|
| ---- |
| ExampleGeoLayer|
| ExampleGeoLayer_copy|

### Example 2: Copy a GeoLayer With Defined `CopiedGeoLayerID` Parameter###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", CopiedGeoLayerID="copiedExample")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|
| ---- | 
| ExampleGeoLayer| 
| copiedExample|


### Example 3: Copy A GeoLayer - Include a Subset of Attributes ###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", IncludeAttributes="id, mascot")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|
| ---- |
| ExampleGeoLayer| 
| ExampleGeoLayer_copy|

**<p style="text-align: left;">
ExampleGeoLayer_copy Attribute Table
</p>**

|id|mascot|
|----|-----|
|1|Bulldogs|
|2|Gators|
|3|Colts|

### Example 4: Copy A GeoLayer - Include a Subset of Features ###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", IncludeFeaturesIf="students > 400")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|
| ---- |
| ExampleGeoLayer| 
| ExampleGeoLayer_copy|

**<p style="text-align: left;">
ExampleGeoLayer_copy Attribute Table
</p>**

|id|school|mascot|students|faculty|
|----|----|-----|-----|-----|
|1|Hill|Bulldogs|546|42|
|3|Gunn|Colts|567|43|

## Troubleshooting ##


## See Also ##
