# Learn GeoProcessor / Command / IntersectGeoLayer #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `IntersectGeoLayer` command extracts the overlapping portions of features in the input GeoLayer and the intersect GeoLayer. Features from the input GeoLayer are assigned the attributes of the overlapping features from both the input GeoLayer and the intersect GeoLayer. 

* The output intersected GeoLayer retains the geometry type of the input GeoLayer. For example, if the input GeoLayer is a `POINT` and the intersect GeoLayer is a `POLYGON`, the output GeoLayer will be a `POINT`. 
* Features from the input GeoLayer that intersect with the intersect GeoLayer are retained in the output GeoLayer.
* Features from the input GeoLayer that intersect multiple features of the intersect GeoLayer are clipped by the intersect features.
* If the input GeoLayer geometry is `POLYGON`, the intersect GeoLayer geometry *must* also be `POLYGON`.
* If the input GeoLayer geometry is `LINE`, the intersect GeoLayer geometry *must* either be `POLYGON` or `LINE`.
* If the input GeoLayer geometry is `POINT`, the intersect GeoLayer geometry can be either `POLYGON`, `LINE` or `POINT`.


## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
IntersectGeoLayer(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`GeoLayerID` <br>  **_required_**| The ID of the GeoLayer to be intersected.| None - must be specified. |
|`IntersectGeoLayerID`<br>  **_required_**| The ID of the intersect GeoLayer.| None - must be specified. |
| `IncludeAttributes` <br>*optional* |  A comma-separated list of the [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which attributes from the intersect GeoLayer to include in the output GeoLayer. <br><br> See [Determining which Attributes to Copy](#determining-which-attributes-to-copy).|`*` <br><br> All attributes are included.|
| `ExcludeAttributes` <br>*optional* | A comma-separated list of the [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) filtering which attributes from the intersect Geolayer to exclude in the output GeoLayer. <br><br> See [Determining which Attributes to Copy](#determining-which-attributes-to-copy).| `'' (empty string)` <br><br> No attributes are excluded. |  
|`OutputGeoLayerID`<br> *optional*|The ID of the intersected GeoLayer. | `GeoLayerID`_intersectedBy_`IntersectGeoLayerID` |
|`IfGeoLayerIDExists`<br> *optional*|The action that occurs if the `OutputGeoLayerID` already exists within the GeoProcessor. <br><br> `Replace` : The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. No warning is logged.<br><br> `ReplaceAndWarn`: The existing GeoLayer within the GeoProcessor is overwritten with the new GeoLayer. A warning is logged. <br><br> `Warn` : The new GeoLayer is not created. A warning is logged. <br><br> `Fail` : The new GeoLayer is not created. A fail message is logged. | `Replace` | 

### Determining Which Attributes to Copy

* The `IncludeAttributes` parameter is always calculated first. The`ExcludeAttributes` parameter is always calculated second. 
	* The `IncludeAttributes` *selects* all of the GeoLayer's attributes that follow the given patterns. By default (`*`) all of the GeoLayer's attributes are included. 
	* The `ExcludeAttributes` *removes* all of the attributes *previously selected from the `IncludeAttributes` parameter* that follow the given patterns. 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/IntersectGeoLayer).


## Troubleshooting ##


## See Also ##

- The IntersectGeoLayer command uses the QGIS processing algorithm [`qgis:intersection`](
https://docs.qgis.org/2.18/en/docs/user_manual/processing_algs/qgis/vector_overlay_tools.html#intersection)

