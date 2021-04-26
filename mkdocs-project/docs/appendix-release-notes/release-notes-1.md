# GeoProcessor / Release Notes / Version 1 #

* [Changes in Version 1.5.0](#changes-in-version-150)
* [Changes in Version 1.4.0](#changes-in-version-140)
* [Changes in Version 1.3.0](#changes-in-version-130)
* [Changes in Version 1.2.0](#changes-in-version-120)
* [Changes in Version 1.1.0](#changes-in-version-110)
* [Changes in Version 1.0.0](#changes-in-version-100)

----------

## Changes in Version 1.5.0 ##

* ![change](change.png) [1.5.0] Improve error handling when QGIS algorithms are called via the processing package.
The user interface will indicate warnings and errors.
* ![change](change.png) [1.5.0] Multiple results windows can now be opened for maps and attribute tables.
Previously a single window could be opened and would be replaced for each view.
* ![change](change.png) [1.5.0] Update [`ListFiles`](../command-ref/ListFiles/ListFiles.md)
command to have `ListCount` and `ListProperty1` parameters.
* ![change](change.png) [1.5.0] Update [`ReadTableFromDelimitedFile`](../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md)
command to work with new table design.
* ![change](change.png) [1.5.0] Update [`WriteRasterGeoLayerToFile`](../command-ref/WriteRasterGeoLayerToFile/WriteRasterGeoLayerToFile.md)
command to use the GDAL `transform` algorithm, which ensures that format and CRS can be changed
* ![new](new.png) [1.5.0] Add [`ChangeGeoLayerGeometry`](../command-ref/ChangeGeoLayerGeometry/ChangeGeoLayerGeometry.md) command.
* ![new](new.png) [1.5.0] Add [`ChangeRasterGeoLayerCRS`](../command-ref/ChangeRasterGeoLayerCRS/ChangeRasterGeoLayerCRS.md) command.
* ![new](new.png) [1.5.0] Add [`RemoveGeoLayerFeatures`](../command-ref/RemoveGeoLayerFeatures/RemoveGeoLayerFeatures.md) command.
* ![new](new.png) [1.5.0] Add [`ReadGeoLayerFromKML`](../command-ref/ReadGeoLayerFromKML/ReadGeoLayerFromKML.md) command.
* ![new](new.png) [1.5.0] Add [`RearrangeRasterGeoLayerBands`](../command-ref/RearrangeRasterGeoLayerBands/RearrangeRasterGeoLayerBands.md) command.

## Changes in Version 1.4.0 ##

* ![change](change.png) [1.4.0] Change the following commands to accept more defaults for identifiers,
in order to simplify creating maps:
	+ [`AddGeoLayerViewGroupToGeoMap`](../command-ref/AddGeoLayerViewGroupToGeoMap/AddGeoLayerViewGroupToGeoMap.md)
	+ [`AddGeoLayerViewToGeoMap`](../command-ref/AddGeoLayerViewToGeoMap/AddGeoLayerViewToGeoMap.md)
	+ [`AddGeoMapToGeoMapProject`](../command-ref/AddGeoMapToGeoMapProject/AddGeoMapToGeoMapProject.md)
	+ [`SetGeoLayerViewCategorizedSymbol`](../command-ref/SetGeoLayerViewCategorizedSymbol/SetGeoLayerViewCategorizedSymbol.md)
	+ [`SetGeoLayerViewEventHandler`](../command-ref/SetGeoLayerViewEventHandler/SetGeoLayerViewEventHandler.md)
	+ [`SetGeoLayerViewGraduatedSymbol`](../command-ref/SetGeoLayerViewGraduatedSymbol/SetGeoLayerViewGraduatedSymbol.md)
	+ [`SetGeoLayerViewSingleSymbol`](../command-ref/SetGeoLayerViewSingleSymbol/SetGeoLayerViewSingleSymbol.md)
* ![change](change.png) [1.4.0] Update the
[`ReadGeoLayersFromFGDB`](../command-ref/ReadGeoLayersFromFGDB/ReadGeoLayersFromFGDB.md) command
to include `Query` parameter, to limit the features read from input.
* ![new](new.png) [1.4.0] Add [`FTPGet`](../command-ref/FTPGet/FTPGet.md) command.

## Changes in Version 1.3.0 ##

* ![bug](bug.png) [1.3.0] Fix issues where command status was not displaying properly in
areas to the left and right of the main command list.
* ![bug](bug.png) [1.3.0] Fix issues caused by the GeoProcessor run scripts not handling QGIS long term release.
The runs scripts now handle OSGeo4W and standalone QGIS installers and detect long term release folders
for Python modules.  The QGIS release is also checked when running in development and deployed environments.
* ![bug](bug.png) [1.3.0] Fix [`RunProgram`](../command-ref/RunProgram/RunProgram.md) to run programs
directly and with command shell.
* ![change](change.png) [1.3.0] Add `inputFormat` and `inputPath` to layer ***Results / GeoLayers*** list.
Add `sourceFormat` to GeoMapProject file.
* ![change](change.png) [1.3.0] Significant overall cleanup of code to implement more robust design.
Error handling is more robust.
* ![change](change.png) [1.3.0] Improve command editor user interactions.
* ![change](change.png) [1.3.0] Split developer documentation out of the main code repository.
See published [Developer Documentation](http://software.openwaterfoundation.org/geoprocessor/latest/doc-dev/).
* ![change](change.png) [1.3.0] Update the [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md)
command to more correctly reflect line difference count,
and add `LineDiffCountProperty` and `FileDiffProperty` parameters.
* ![change](change.png) [1.3.0] Update the [`WebGet`](../command-ref/WebGet/WebGet.md) command to have
`Timeout` and `ResponseCodeProperty` parameters.
* ![change](change.png) [1.3.0] Update the [`UnzipFile`](../command-ref/UnzipFile/UnzipFile.md) command to have
`IfFolderDoesNotExist` parameter.
* ![new](new.png) [1.3.0] Enable cut/copy/paste functionality for editing the command list.
* ![new](new.png) [1.3.0] Enable the command editor for the [empty lines](../command-ref/Blank/Blank.md).
* ![new](new.png) [1.3.0] Add [`CreateGeoMap`](../command-ref/CreateGeoMap/CreateGeoMap.md),
[`CreateGeoMapProject`](../command-ref/CreateGeoMapProject/CreateGeoMapProject.md), and related commands
to automate creation of map configurations.
* ![new](new.png) [1.3.0] Add [`ReadGeoLayerFromWebFeatureService`](../command-ref/ReadGeoLayerFromWebFeatureService/ReadGeoLayerFromWebFeatureService.md) command
* ![new](new.png) [1.3.0] Add [`ReadGeoLayersFromGeoPackage`](../command-ref/ReadGeoLayersFromGeoPackage/ReadGeoLayersFromGeoPackage.md) command
* ![new](new.png) [1.3.0] Add [`ReadRasterGeoLayerFromFile`](../command-ref/ReadRasterGeoLayerFromFile/ReadRasterGeoLayerFromFile.md) command
* ![new](new.png) [1.3.0] Add [`ReadRasterGeoLayerFromTileMapService`](../command-ref/ReadRasterGeoLayerFromTileMapService/ReadRasterGeoLayerFromTileMapService.md) command
* ![new](new.png) [1.3.0] Add [`ReadRasterGeoLayerFromWebMapService`](../command-ref/ReadRasterGeoLayerFromWebMapService/ReadRasterGeoLayerFromWebMapService.md) command
* ![new](new.png) [1.3.0] Add [`RunGdalProgram`](../command-ref/RunGdalProgram/RunGdalProgram.md) command
* ![new](new.png) [1.3.0] Add [`RunOgrProgram`](../command-ref/RunOgrProgram/RunOgrProgram.md) command
* ![new](new.png) [1.3.0] Add [`SplitGeoLayerByAttribute`](../command-ref/SplitGeoLayerByAttribute/SplitGeoLayerByAttribute.md) command
* ![new](new.png) [1.3.0] Enable the command editor for the [unknown commands](../command-ref/UnknownCommand/UnknownCommand.md) command
* ![new](new.png) [1.3.0] Add [`WriteRasterGeoLayerToFile`](../command-ref/WriteRasterGeoLayerToFile/WriteRasterGeoLayerToFile.md) command

## Changes in Version 1.2.0 ##

* ![new](bug.png) [1.2.0] Fix bugs in Windows installer and run scripts.
* ![new](new.png) [1.2.0] Enable comment editing.

## Changes in Version 1.1.0 ##

* ![new](new.png) [1.1.0] First Windows installer.

## Changes in Version 1.0.0 ##

* ![new](new.png) [1.0.0] Initial formal release.
Previous internal development was not assigned to a tracked version number.
The versioning process will be implemented over time as protocols solidify.
