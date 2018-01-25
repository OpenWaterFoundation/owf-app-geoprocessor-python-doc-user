# Learn GeoProcessor / Command / MergeGeoLayers #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `MergeGeoLayers` command merges multiple [GeoLayers](../../introduction#geolayer) into one GeoLayer. 

* The attributes of the input GeoLayers are retained within the output GeoLayer.
* The features of the input GeoLayers are retained within the output GeoLayer.
* The input GeoLayers must be the same geometry (`POINT`, `LINE` or `POLYGON`).
* The input GeoLayers must be projected in the same coordinate reference system.
* The attribute names of the output GeoLayer can be specified. See `AttributeMap` parameter. 
* The value `0` will be assigned as the attribute value to features in the output GeoLayer attribute table that do not have attribute values. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
MergeGeoLayers(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`GeoLayerIDs` <br>  **_required_**| The identifiers of the GeoLayers to merge. List syntax.| None - must be specified. |
|`OutputGeoLayerID` <br> **_required_**| A GeoLayer identifier for the output GeoLayer. Refer to [documentation](../../best-practices/geolayer-identifiers.md) for best practices on naming GeoLayer identifiers.|None - must be specified. |
|`AttributeMap` <br> _optional_| A dictionary object used to map the input GeoLayers' attributes to the output GeoLayer attribute table. Dictionary of Lists syntax. See the [Attribute Map]($attribute-map) section for more information.|Empty dictionary. <br> All attributes in input GeoLayers are retained within the output GeoLayer.|
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `OutputGeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged.<br><br>`Warn` : The MergeGeoLayers command does not run. A warning is logged. <br><br> `Fail` : The MergeGeoLayers command does not run. A fail message is logged. | `Replace` | 

**<p style="text-align: center;">
Special Parameter Syntax
</p>**

|Special Parameter Syntax|Description|Format with Example|
|-----|------|-----|
|List |A grouping of one or more items.|Items are separated by commas (`,`). <br><br>`Parameter="item1, item2, item3"`|
|Dictionary of Strings |A grouping of key value pairs (value is a string).|Key value pairs are separated by semicolons (`;`).<br>Key is separated by its value by an equals sign (`=`).<br><br>`Parameter="key1=value1; key2=value2"`|
|Dictionary of Lists|A grouping of key value pairs (value is a list).|Key value pairs are separated by semicolons (`;`).<br>Key is separated by its value by an equals sign (`=`).<br>The items of the value list are separated by commas (`,`).<br><br>`Parameter="key1=item1, item2, item3; key2=item4"`|

## Attribute Map ##

The `MergeGeoLayers` command merges multiple GeoLayers into one GeoLayer. 

* The features are merged.
* The input attribute tables are merged into one attribute table. 
* By default, if the attribute tables from the input GeoLayers are different, the attribute table of the output GeoLayer will contain the attributes from **ALL** input layers. See [Example 1](#example-1-merge-without-an-attribute-map). 

There are times, however, when attributes with *different* names from *different* input GeoLayers should be converged. 

* This can be accomplished with the `AttributeMap` parameter. 
* In [Example 2](#example-1-merge-with-an-attribute-map), the high schools  attribute (`high_sch`) from `ExampleGeoLayer1` and the elementary schools attribute (`elem_sch`)  from `ExampleGeoLayer2` both contain names of schools. 
    * When merging the input GeoLayers, it is possible to `"map"` the high schools and elementary schools attributes together. The output is a single attribute called `Schools`  containing the information from both the `high_sch` attribute and the `elem_sch` attribute.
	
### How to Build an Attribute Map ###
	
* An attribute map is a list of key-value pairs.

```
AttributeMap = "KEY1=VALUE1; KEY2=VALUE2"
```

* Each `KEY` represents a *single* attribute name in the `OUTPUT MERGED` GeoLayer.
* Each `VALUE` represents a *list* of attribute names from the `INPUT` GeoLayers that will be renamed to the `KEY` value.
* The `VALUE` is a *list* that can contain one or more attribute names. 
```
AttributeMap = "KEY1=ITEM1,ITEM2,ITEM3; KEY2=ITEM3, ITEM4"
```
* If an attribute name from a `INPUT` GeoLayer is not listed in any of the attribute map's `VALUES`, the attribute name will be retained in the `OUTPUT MERGED` GeoLayer.


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/MergeGeoLayers).

The following GeoLayer data are used in the examples[^2]. 
[^2]: The examples assume that the `ExampleGeoLayer1` and `ExampleGeoLayer2` GeoLayers have *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayer ID|
| ---- |
| ExampleGeoLayer1| 
| ExampleGeoLayer2|

**<p style="text-align: left;">
Attribute Table of `ExampleGeoLayer1`
</p>**

|id|high_sch|Mascot|
|--|--|--|
|1|Gunn|Colts|
|2|Hill|Bears|
|3|Dasher|Gators|

**<p style="text-align: left;">
Attribute Table of `ExampleGeoLayer2`
</p>**

|id|elem_sch|mascot|
|--|--|--|
|1|Woodrow|Bulldogs|
|2|Eastern|Rams|
|3|River Mill|Eagles|

### Example 1: Merge Without an Attribute Map ###

```
MergeGeoLayers(GeoLayerIDs = "ExampleGeoLayer1, ExampleGeoLayer2", OutputGeoLayerID = "MergedOutput")
```

After running the command, the following the following GeoLayer IDs are registered within the GeoProcessor. 

|GeoLayer ID|
| ---- |
| ExampleGeoLayer1| 
| ExampleGeoLayer2|
| MergedOutput|

**<p style="text-align: left;">
Attribute Table of `MergedOutput`
</p>**

|id|high_sch|Mascot|elem_sch|mascot|
|--|--|--|--|--|
|1|Gunn|Colts|0|0|
|2|Hill|Bears|0|0|
|3|Dasher|Gators|0|0|
|1|0|0|Woodrow|Bulldogs|
|2|0|0|Eastern|Rams|
|3|0|0|River Mill|Eagles|



### Example 2:  Merge With an Attribute Map ###

```
MergeGeoLayers(GeoLayerIDs = "ExampleGeoLayer1, ExampleGeoLayer2", OutputGeoLayerID = "MergedOutput", AttributeMap = "ID=id; School=high_sch, elem_sch; Mascot=mascot")
```

After running the commands, the following GeoJSON files are written to the `ExampleOutputFolder` folder. 

|GeoLayerID|
| ---- |
| ExampleGeoLayer1| 
| ExampleGeoLayer2|
| MergedOutput|

**<p style="text-align: left;">
Attribute Table of `MergedOutput`
</p>**

|ID|Schools|Mascot|
|--|--|--|
|1|Gunn|Colts|
|2|Hill|Bears|
|3|Dasher|Gators|
|1|Woodrow|Bulldogs|
|2|Eastern|Rams|
|3|River Mill|Eagles|


## Troubleshooting ##

## See Also ##

- The MergeGeoLayers command uses the QGIS processing algorithm [`qgis:mergevectorlayers`](https://docs.qgis.org/2.8/en/docs/user_manual/processing_algs/qgis/vector_general_tools/mergevectorlayers.html). 