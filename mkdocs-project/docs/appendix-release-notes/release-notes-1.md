# GeoProcessor / Release Notes / Version 1 #

* [Changes in Version 1.3.0](#changes-in-version-1-3-0)
* [Changes in Version 1.2.0](#changes-in-version-1-2-0)
* [Changes in Version 1.1.0](#changes-in-version-1-1-0)
* [Changes in Version 1.0.0](#changes-in-version-1-0-0)

----------

## Changes in Version 1.3.0 ##

* ![bug](bug.png) [1.3.0] Fix issues where command status was not displaying properly in
areas to the left and right of the main command list.
* ![bug](bug.png) [1.3.0] Fix issues caused by the GeoProcessor run scripts not handling QGIS long term release.
The runs scripts now handle OSGeo4W and standalone QGIS installers and detect long term release folders
for Python modules.  The QGIS release is also checked when running in development and deployed environments.
* ![change](change.png) [1.3.0] Significant overall cleanup of code to implement more robust design.
Error handling is more robust.
* ![change](change.png) [1.3.0] Improve command editor user interactions.
* ![change](change.png) [1.3.0] Split developer documentation out of the main code repository.
See published [Developer Documentation](http://software.openwaterfoundation.org/geoprocessor/latest/doc-dev/).
* ![change](change.png) [1.3.0] Update the [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md)
command to more correctly reflect line difference count,
and add `LineDiffCountProperty` and `FileDiffProperty` parameters.
* ![new](new.png) [1.3.0] Enable cut/copy/paste functionality for editing the command list.
* ![new](new.png) [1.3.0] Enable the command editor for the [empty lines](../command-ref/Blank/Blank.md).
* ![new](new.png) [1.3.0] Add [CreateGeoMap](../command-ref/CreateGeoMap/CreateGeoMap.md),
[CreateGeoMapProject](../command-ref/CreateGeoMapProject/CreateGeoMapProject.md), and related commands
to automate creation of map configurations.
* ![new](new.png) [1.3.0] Enable the command editor for the [unknown commands](../command-ref/UnknownCommand/UnknownCommand.md) 

## Changes in Version 1.2.0 ##

* ![new](bug.png) [1.2.0] Fix bugs in Windows installer and run scripts.
* ![new](new.png) [1.2.0] Enable comment editing.

## Changes in Version 1.1.0 ##

* ![new](new.png) [1.1.0] First Windows installer.

## Changes in Version 1.0.0 ##

* ![new](new.png) [1.0.0] Initial formal release.
Previous internal development was not assigned to a tracked version number.
The versioning process will be implemented over time as protocols solidify.
