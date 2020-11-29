# Command Reference / Overview #

This reference section of the documentation provides information about GeoProcessor commands.

* [Command Overview](#command-overview)
* [Commands for Processing Vector Spatial Data Layers](#commands-for-processing-vector-spatial-data-layers)
* [Commands for Processing Raster Spatial Data Layers](#commands-for-processing-raster-spatial-data-layers)
* [Commands for Processing Tables](#commands-for-processing-tables)
* [Commands for Processing DataStores](#commands-for-processing-datastores)
* [Commands to Control Running](#commands-to-control-running)
* [Commands for Handling Files](#commands-for-handling-files)
* [Commands for Messages and Logging](#commands-for-messages-and-logging)
* [Commands for Testing](#commands-for-testing)
* [Utility Commands](#utility-commands)
* [QGIS Cross-Reference](#qgis-cross-reference)

---------------------------

## Command Overview ##

GeoProcessor command files contain a list of commands, one command per line.
These commands are processed in sequence from top to bottom.
[`For`](For/For.md) and
[`If`](If/If.md) control commands, if present, will cause execution order to jump over commands.

Each command adheres to the syntax:

```text
CommandName(ParameterName1="ParameterValue1",ParameterName2="ParameterValue2",...)
```

The following are guidelines for commands:

1. Commands always follow the convention of command name at start with a list of named parameters in parentheses.
The only exceptions are:
	1. Comments starting with `#`.
	2. Block comments `/*` and `*/` that surround one or more command lines.
	3. Command such as `Exit`, which will always have empty list of parameters in the parentheses.
2. Commands are (currently) case-specific.  This may be relaxed in the future.
3. Command and parameter names use mixed case where the first letter of each word is capitalized.
4. Parameter values must generally be surrounded by double quotes, regardless of type.
This convention may be relaxed in the future.
5. Each command must exist on a single line.  [`#`](Comment/Comment.md) comment blocks can be edited as multiple lines.
6. Spaces at the front of a command for indentation are allowed to improve logic presentation,
such as code levels for [`For`](For/For.md) and [`If`](If/If.md) blocks.
Tabs used for indentation are discouraged and may be prohibited in the future because tab width is ambiguous between different users and tools.
7. Blank lines are allowed and will be handled as [`Blank`](Blank/Blank.md) commands.
8. Unknown commands are handled as [`UnknownCommand`](UnknownCommand/UnknownCommand.md) commands.

## Commands for Processing Vector Spatial Data Layers ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`AddGeoLayerAttribute`](AddGeoLayerAttribute/AddGeoLayerAttribute.md) | Add an attribute to a GeoLayer. |
| [`ClipGeoLayer`](ClipGeoLayer/ClipGeoLayer.md) | Clip a GeoLayer by the boundary of another GeoLayer. |
| [`CopyGeoLayer`](CopyGeoLayer/CopyGeoLayer.md) | Copy a GeoLayer to a new GeoLayer, optionally constraining the copy to a subset of the original features/attributes. |
| [`CreateGeoLayerFromGeometry`](CreateGeoLayerFromGeometry/CreateGeoLayerFromGeometry.md) | Create a GeoLayer from input geometry data. |
| [`FreeGeoLayers`](FreeGeoLayers/FreeGeoLayers.md) | Removes one or more GeoLayers from the GeoProcessor. |
| [`IntersectGeoLayer`](IntersectGeoLayer/IntersectGeoLayer.md) | Intersects a GeoLayer by another GeoLayer. |
| [`MergeGeoLayers`](MergeGeoLayers/MergeGeoLayers.md) | Merge multiple GeoLayers into one GeoLayer. |
| [`ReadGeoLayerFromDelimitedFile`](ReadGeoLayerFromDelimitedFile/ReadGeoLayerFromDelimitedFile.md) | Read a GeoLayer from a delimited format file. |
| [`ReadGeoLayerFromGeoJSON`](ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON.md) | Read a GeoLayer from a GeoJSON format file. |
| [`ReadGeoLayerFromKML`](ReadGeoLayerFromKML/ReadGeoLayerFromKML.md) | Read a GeoLayer from a KML format file. |
| [`ReadGeoLayerFromShapefile`](ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile.md) | Read a GeoLayer from a Shapefile format file. |
| [`ReadGeoLayerFromWebFeatureService`](ReadGeoLayerFromWebFeatureService/ReadGeoLayerFromWebFeatureService.md) | Read a GeoLayer from an OGC Web Feature Service. |
| [`ReadGeoLayersFromFGDB`](ReadGeoLayersFromFGDB/ReadGeoLayersFromFGDB.md) | Read one or more GeoLayers from a file geodatabase. |
| [`ReadGeoLayersFromFolder`](ReadGeoLayersFromFolder/ReadGeoLayersFromFolder.md) | Read GeoLayers from a folder. |
| [`ReadGeoLayersFromGeoPackage`](ReadGeoLayersFromGeoPackage/ReadGeoLayersFromGeoPackage.md) | Read GeoLayers from a GeoPackage file. |
| [`RemoveGeoLayerAttributes`](RemoveGeoLayerAttributes/RemoveGeoLayerAttributes.md) | Remove one or more attributes from a GeoLayer. |
| [`RenameGeoLayerAttribute`](RenameGeoLayerAttribute/RenameGeoLayerAttribute.md) | Rename a GeoLayer's attribute. |
| [`RemoveGeoLayerFeatures`](RemoveGeoLayerFeatures/RemoveGeoLayerFeatures.md) | Remove one or more features from a GeoLayer. |
| [`RunOgrProgram`](RunOgrProgram/RunOgrProgram.md) | Run an OGR command line program. |
| [`SetGeoLayerCRS`](SetGeoLayerCRS/SetGeoLayerCRS.md) | Sets a GeoLayer's coordinate reference system. |
| [`SetGeoLayerProperty`](SetGeoLayerProperty/SetGeoLayerProperty.md) | Set a GeoGeoLayer property. |
| [`SimplifyGeoLayerGeometry`](SimplifyGeoLayerGeometry/SimplifyGeoLayerGeometry.md) | Decreases the verticies in a polygon or line GeoLayer.  |
| [`SplitGeoLayerByAttribute`](SplitGeoLayerByAttribute/SplitGeoLayerByAttribute.md) | Split a vector GeoLayer into separate layers using an attribute. |
| [`WriteGeoLayerToDelimitedFile`](WriteGeoLayerToDelimitedFile/WriteGeoLayerToDelimitedFile.md) | Write GeoLayer to a file in delimited file format. |
| [`WriteGeoLayerToGeoJSON`](WriteGeoLayerToGeoJSON/WriteGeoLayerToGeoJSON.md) | Write GeoLayer to a file in GeoJSON format. |
| [`WriteGeoLayerToKML`](WriteGeoLayerToKML/WriteGeoLayerToKML.md) | Write GeoLayer to a file in KML format. |
| [`WriteGeoLayerToShapefile`](WriteGeoLayerToShapefile/WriteGeoLayerToShapefile.md) | Write GeoLayer to a file in Shapefile format. |

## Commands for Processing Raster Spatial Data Layers ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`ChangeRasterGeoLayerCRS`](ChangeRasterGeoLayerCRS/ChangeRasterGeoLayerCRS.md) | Change a raster layer CRS. |
| [`CreateRasterGeoLayer`](CreateRasterGeoLayer/CreateRasterGeoLayer.md) | Create a raster spatial data layer. |
| [`ReadRasterGeoLayerFromFile`](ReadRasterGeoLayerFromFile/ReadRasterGeoLayerFromFile.md) | Read a raster spatial data layer file. |
| [`ReadRasterGeoLayerFromTileMapService`](ReadRasterGeoLayerFromTileMapService/ReadRasterGeoLayerFromTileMapService.md) | Read a raster spatial data layer from a tile map service. |
| [`ReadRasterGeoLayerFromWebMapService`](ReadRasterGeoLayerFromWebMapService/ReadRasterGeoLayerFromWebMapService.md) | Read a raster spatial data layer from a web map service. |
| [`RunGdalProgram`](RunGdalProgram/RunGdalProgram.md) | Run a GDAL command line program. |
| [`RasterizeGeoLayer`](RasterizeGeoLayer/RasterizeGeoLayer.md) | Create a raster GeoLayer from a vector GeoLayer. |
| [`WriteRasterGeoLayerToFile`](WriteRasterGeoLayerToFile/WriteRasterGeoLayerToFile.md) | Write a raster spatial data layer file. |

## Commands for Processing Tables ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore.md) | Read a table from a DataStore. |
| [`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) | Read a Table from a delimited file. |
| [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel.md) | Read a Table from an Excel file. |
| [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore.md) | Write a Table to a DataStore. |
| [`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile.md) | Write a Table to a delimited file. |
| [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel.md) | Write a Table to an Excel file. |

## Commands for Processing DataStores ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`CloseDataStore`](CloseDataStore/CloseDataStore.md) | Close a DataStore connection. |
| [`OpenDataStore`](OpenDataStore/OpenDataStore.md) | Create a DataStore connection. |
| [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore.md) | Read a table from a DataStore. |
| [`RunSql`](RunSql/RunSql.md) | Execute a SQL statement on a DataStore. |
| [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore.md) | Write a Table to a DataStore. |

## Commands to Control Running ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`# comment`](Comment/Comment.md) | Single line comment. |
| [`/* comment block start`](CommentBlockStart/CommentBlockStart.md) | Start of multi-line comment block. |
| [`*/ comment block end`](CommentBlockEnd/CommentBlockEnd.md) | End of multi-line comment block. |
| [`EndIf`](EndIf/EndIf.md) | Indicate the end of an `If` block. |
| [`EndFor`](EndFor/EndFor.md) | Indicate the end of a `For` block. |
| [`For`](For/For.md) | Indicate the start of a `For` block. |
| [`If`](If/If.md) | Indicate the start of an `If` block. |
| [`RunCommands`](RunCommands/RunCommands.md) | Run a command file, useful to automate running all tests or a multi-step workflow. |
| [`RunGdalProgram`](RunGdalProgram/RunGdalProgram.md) | Run a GDAL command line program. |
| [`RunOgrProgram`](RunOgrProgram/RunOgrProgram.md) | Run an OGR command line program. |
| [`RunProgram`](RunProgram/RunProgram.md) | Run a program. |
| [`QgisAlgorithmHelp`](QgisAlgorithmHelp/QgisAlgorithmHelp.md) | Print QGIS algorithm list and help. |
| [`SetProperty`](SetProperty/SetProperty.md) | Set a GeoProcessor property. |
| [`SetPropertyFromGeoLayer`](SetPropertyFromGeoLayer/SetPropertyFromGeoLayer.md) | Set a GeoProcessor property from a GeoLayer property. |

## Commands for Handling Files ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`CopyFile`](CopyFile/CopyFile.md) | Copy a file. |
| [`CreateFolder`](CreateFolder/CreateFolder.md) | Create a folder. |
| [`FTPGet`](FTPGet/FTPGet.md) | Retrieve 1+ files from an FTP site. |
| [`ListFiles`](ListFiles/ListFiles.md) | List the files and folder within a folder or a URL. |
| [`RemoveFile`](RemoveFile/RemoveFile.md) | Remove a file. |
| [`UnzipFile`](UnzipFile/UnzipFile.md) | Unzip a file. |
| [`WebGet`](WebGet/WebGet.md) | Download a file from URL. |

## Commands for Messages and Logging ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`Message`](Message/Message.md) | Print a message to the log file. |
| [`StartLog`](StartLog/StartLog.md) | Start a new log file. |

## Commands for Testing ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`CompareFiles`](CompareFiles/CompareFiles.md) | Compare files and optionally warn/fail if different/same. |
| [`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) | Create a master command file to automate running all tests. |
| [`RunCommands`](RunCommands/RunCommands.md) | Used when running a test suite. |
| [`StartRegressionTestResultsReport`](StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) | Start (open) a file to receive regression test results. |
| [`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile.md) | Write a summary of command log messages to a file. |
| [`WriteGeoLayerPropertiesToFile`](WriteGeoLayerPropertiesToFile/WriteGeoLayerPropertiesToFile.md) | Write GeoLayer properties to file. |
| [`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile.md) | Write properties to file. |

## Utility Commands ##

| **Command Name**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| ---------------- | --------------- |
| [`# Comment`](Comment/Comment.md) | Single line comments. |
| [`Blank`](Blank/Blank.md) | Used for blank lines. |
| [`UnknownCommand`](UnknownCommand/UnknownCommand.md) | Used when the command is not recognized. |

## QGIS Cross-Reference ##

QGIS provides [algorithms](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/index.html)
and [plugins](https://plugins.qgis.org/) to process spatial data.
The following table cross-references QGIS algorithms to the equivalent GeoProcessor command for cases where a GeoProcessor
command uses an algorithm or plugin.
Other GeoProcessor commands directly manipulate layer data without using algorithms or plugins.
Additional GeoProcessor commands will be added over time to provide the functionality of useful algorithms and plugins.

| **Layer Type and QGIS Algorithm/Plugin**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description**|**Equivalent GeoProcessor Command(s)**|
|----|---|---|
|Raster: Change projection ([`gdal:warpreproject`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/gdal/rasterprojections.html#warp-reproject))|Change raster layer coordinate reference system.|[ChangeRasterGeoLayerCRS](ChangeRasterGeoLayerCRS/ChangeRasterGeoLayerCRS.md)|
|Raster: Rasterize ([`gdal:rasterize`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/gdal/vectorconversion.html#rasterize-vector-to-raster))| Create a raster layer from vector layer.|[RasterizeGeoLayer](RasterizeGeoLayer/RasterizeGeoLayer.md)|
|Raster: Rearrange bands ([`gdal:rearrange_bands`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/gdal/rasterconversion.html#rearrange-bands))| Rearrange a raster layer's bands.|[RearrangeRasterGeoLayerBands](RearrangeRasterGeoLayerBands/RearrangeRasterGeoLayerBands.md)|
|Raster: Write file ([`gdal:translate`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/gdal/rasterconversion.html#translate-convert-format))| Write a raster layer to a file.|[WriteRasterGeoLayerToFile](WriteRasterGeoLayerToFile/WriteRasterGeoLayerToFile.md)|
| | | | |
|Vector: Change geometry ([`qgis:linestopolygons`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeometry.html#lines-to-polygons))| Create a new layer with different geometry.|[ChangeGeoLayerGeometry](ChangeGeoLayerGeometry/ChangeGeoLayerGeometry.md)|
|Vector: Clip ([`qgis:clip`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectoroverlay.html#clip))| Extract features from a layer that fall within, or partially within, the boundaries of features in another layer.|[ClipGeoLayer](ClipGeoLayer/ClipGeoLayer.md)|
|Vector: Define current projection ([`qgis:definecurrentprojection`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeneral.html?highlight=reprojectlayer#define-shapefile-projection))|Assign a projection to a layer that has an unassigned coordinate reference system.|[SetGeoLayerCRS](SetGeoLayerCRS/SetGeoLayerCRS.md)|
|Vector: Intersection [`qgis:intersection`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectoroverlay.html#intersection)|Output features that intersect two layers.|[IntersectGeoLayer](IntersectGeoLayer/IntersectGeoLayer.md)|
|Vector: Merge vector layers ([`qgis:mergevectorlayers`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeneral.html#merge-vector-layers))|Combine multiple vector layers of the same geometry type into a single vector layer. | [MergeGeoLayers](MergeGeoLayers/MergeGeoLayers.md)|
|Vector: Reproject Layer ([`qgis:reprojectlayer`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeneral.html?highlight=reprojectlayer#reproject-layer) and [`qgis:definecurrentprojection`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeneral.html?highlight=reprojectlayer#define-shapefile-projection))| Reproject a layer that already has an assigned coordinate reference system.|[SetGeoLayerCRS](SetGeoLayerCRS/SetGeoLayerCRS.md)|
|Vector: Simplify Geometries ([`qgis:simplifygeometries`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeometry.html#simplify))|Simplify the geometries of a line or polygon layer by removing unnecessary vertices.| [SimplifyGeoLayerGeometry](SimplifyGeoLayerGeometry/SimplifyGeoLayerGeometry.md)|
|Vector: Split layer by attribute ([`qgis:splitvectorlayer`](https://docs.qgis.org/latest/en/docs/user_manual/processing_algs/qgis/vectorgeneral.html#split-vector-layer))|Split a vector layer into multiple layers based on attribute values.| [SplitGeoLayerByAttribute](SplitGeoLayerByAttribute/SplitGeoLayerByAttribute.md)|
