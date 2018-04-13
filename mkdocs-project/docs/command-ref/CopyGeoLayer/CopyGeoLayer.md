# Learn GeoProcessor / Command / CopyGeoLayer #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CopyGeoLayer` command copies a GeoLayer to a new GeoLayer, optionally contstraining the copy to a subset of the original features.

* The input GeoLayer's coordinate reference system is retained in the copied GeoLayer. 
* The input GeoLayer's attributes are retained in the copied GeoLayer. 
* The copied GeoLayer's source path is an empty string. 
* The CopyGeoLayer command has **querying** capabilities. 
	* The copied GeoLayer can retain a subset of the original GeoLayer's features.
	* The copied GeoLayer can retain a subset of the original GeoLayer's attributes.


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
| `GeoLayerID` <br> **_required_** | The ID of the GeoLayer to be copied. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.| None - must be specified. |
| `IncludeAttributes` <br>*optional* |  A comma-separated list of the [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which attributes to include in the copied GeoLayer. <br><br> See [Determining which Attributes to Copy](#determining-which-attributes-to-copy).|`*` <br><br> All attributes are copied.|
| `ExcludeAttributes` <br>*optional* | A comma-separated list of the [glob-sytle patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which attributes to exclude in the copied GeoLayer. <br><br> See [Determining which Attributes to Copy](#determining-which-attributes-to-copy).| `'' (empty string)` <br><br> All attributes are copied. |  
|`IncludeFeaturesIf` <br>*optional* | An attribute query specifying features to include in the copied GeoLayer. Expression syntax and capabilities follows [QGIS Expression](https://docs.qgis.org/2.8/en/docs/user_manual/working_with_vector/expression.html) standards. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.|All features are copied.|
| `CopiedGeoLayerID` <br>*optional* | The ID of the copied GeoLayer. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized.| `GeoLayerID`_copy |
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `CopiedGeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Warn` : The new GeoLayer is not created. A warning is logged. <br><br> `Fail` : The new GeoLayer is not created. A fail message is logged. | `Replace` | 


### Determining Which Attributes to Copy

* The `IncludeAttributes` parameter is always processed first. The`ExcludeAttributes` parameter is always processed second. 
	* The `IncludeAttributes` *selects* all of the GeoLayer's attributes that follow the given patterns. By default (`*`) all of the GeoLayer's attributes are included. 
	* The `ExcludeAttributes` *removes* all of the attributes *previously selected from the `IncludeAttributes` parameter* that follow the given patterns. 


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


### Example 3: Include a Subset of Attributes ###

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", IncludeAttributes="id, mascot", CopiedGeoLayerID="ExampleGeoLayer_output1")
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", IncludeAttributes="s*, *d", CopiedGeoLayerID="ExampleGeoLayer_output2")
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|
| ---- |
| ExampleGeoLayer| 
| ExampleGeoLayer_output1|
| ExampleGeoLayer_output2|

**<p style="text-align: left;">
ExampleGeoLayer_output1 Attribute Table
</p>**

|id|mascot|
|----|-----|
|1|Bulldogs|
|2|Gators|
|3|Colts|

**<p style="text-align: left;">
ExampleGeoLayer_output2 Attribute Table
</p>**

|id|school|students|
|----|----|-----|
|1|Hill|546|
|2|Bright|304|
|3|Gunn|567|

### Example 4: Exclude a Subset of the Attributes to Include 

```
CopyGeoLayer(GeoLayerID="ExampleGeoLayer", IncludeAttributes="s*", ExcludeAttributes="*l"
```

After running the command, the following GeoLayers are registered within the GeoProcessor.

|GeoLayerID|
| ---- |
| ExampleGeoLayer| 
| ExampleGeoLayer_copy|

**<p style="text-align: left;">
ExampleGeoLayer_copy Attribute Table
</p>**

|students|
|----|
|546|
|304|
|567|



### Example 5: Include a Subset of Features ###

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
