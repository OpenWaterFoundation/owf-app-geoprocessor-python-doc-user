# GeoProcessor / Command / ReadGeoLayerFromShapefile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadGeoLayerFromShapefile` command reads a [GeoLayer](../../introduction/introduction.md#geolayer)
from a file in [Esri Shapefile format](../../spatial-data-format-ref/EsriShapefile/EsriShapefile.md). 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![ReadGeoLayerFromShapefile](ReadGeoLayerFromShapefile.png)
</p>**

**<p style="text-align: center;">
`ReadGeoLayerFromShapefile` Command Editor (<a href="../ReadGeoLayerFromShapefile.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadGeoLayerFromShapefile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `InputFile`<br>**required**| The Esri Shapefile to read (relative or absolute path; must end in `.shp`). [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) is recognized.| None - must be specified. |
| `GeoLayerID`| A GeoLayer identifier. [Formatting characters](../../introduction/introduction.md#geolayer-property-format-specifiers) and [`${Property}` syntax](../../introduction/introduction.md#geoprocessor-properties-property) are recognized. Refer to [documentation](../../best-practices/geolayer-identifiers.md) for best practices on naming GeoLayer identifiers.| The shapefile filename without the leading path and without the file extension. (Formatting character `%f`)|
| `Properties` | Additional properties to assign to the GeoLayer, using format: `prop1:value1,prop2:'string with space'`.  Can use `${Property}` notation.  | No additional properties are assigned. |
| `IfGeoLayerIDExists` | The action that occurs if the `GeoLayerID` already exists within the GeoProcessor:<ul><li>`Replace` - The existing GeoLayer within the GeoProcessor is replaced with the new GeoLayer. No warning is logged.</li><li>`ReplaceAndWarn` - The existing GeoLayer within the GeoProcessor is replaced with the new GeoLayer. A warning is logged.</li><li>`Warn` - The new GeoLayer is not created. A warning is logged.</li><li>`Fail` - The new GeoLayer is not created. A fail message is logged.</li></ul> | `Replace` | 

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ReadGeoLayerFromShapefile).

**<p style="text-align: left;">
ExampleFolder
</p>**

|Filename|File Type|
| ---- | ----|
| ExampleFile1.shp | Shapefile|
| ExampleFile1.shx | Shapefile component file|
| ExampleFile1.dbf | Shapefile component file |
| ExampleFile1.prj | Shapefile component file |

### Example 1: Read a GeoLayer from a Shapefile ###

```
ReadGeoLayerFromShapefile(InputFile="ExampleFile1.shp")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|ExampleFile1|

### Example 2: Assign a Unique GeoLayer ID  ###

```
ReadGeoLayerFromShapefile(InputFile="ExampleFile1.shp",GeoLayerID="StateBoundary")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|Registered GeoLayer IDs|
|------|
|StateBoundary|

### Example 3: Invalid InputFile Value ###

```
ReadGeoLayerFromShapefile(InputFile="ExampleFile1.shx",GeoLayerID="StateBoundary")
```

After running the command, no GeoLayerIDs are registered within the GeoProcessor because the `InputFile` directs to a `.shx` file rather than a `.shp` file. 

|Registered GeoLayer IDs|
|------|
||

## Troubleshooting ##

## See Also ##

* The GeoLayer is read using the [GDAL Shapefile driver](https://gdal.org/drivers/vector/shapefile.html#vector-shapefile).
* [`WriteGeoLayerToShapefile`](../WriteGeoLayerToShapefile/WriteGeoLayerToShapefile.md) command
