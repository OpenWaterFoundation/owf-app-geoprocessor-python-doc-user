# Learn GeoProcessor / Introduction #

There is often a need to automate processing of spatial data, ranging from simple to complex tasks.
For example, the Open Water Foundation often processes spatial data related to water resources,
such as processing river basin data.
Although open source and commercial Geographic Information Systems (GIS) software tools are available,
the features of these tools are limited and in some cases are expensive to purchase.
There is a need for tools that can automate spatial data processing without requiring extensive GIS skills.

The OWF GeoProcessor software is free and open source and leverages the spatial processing components
in open source QGIS software, while providing automation features that are suitable for
water resources data processing.

The current GeoProcessor software only runs in batch mode from the command line.
However, an interactive user interface is planned.
Currently, GeoProcessor command files must be edited with a text editor.

* [Concepts](#concepts)
* [Alternatives to the GeoProcessor](#alternatives-to-the-geoprocessor)
* [Next Steps](#next-steps)

--------------

## Concepts ##

### GeoProcessor Commands and Workflows ###

The GeoProcessor provides access to spatial data processing tools via processing commands.
The commands are saved in a text command file, which can be edited and resaved.
A command file can be run multiple times to perform the same task on new data.

Each command performs a unit of work and by design the functionality of each command is limited.
This allows commands to be used in various sequences to achieve maximum flexibility.
The commands are documented in the [Command Reference](command-ref/overview).

A common workflow is as follows:

1. Read GeoLayers from one or more sources.
2. Perform geospatial processing and/or analysis on the GeoLayers.
3. Output modified versions of the GeoLayers, and/or other representations of data such as analysis results.

The above simple workflow can be scaled to process large amounts of data.

**Need to insert an example workflow here.**

### Spatial Data Sources and Formats ###

The GeoProcessor reads spatial data from multiple sources (e.g., files, geodatabases, web services) and
converts the spatial data into in-memory representations.
See the [Spatial Data Format Reference](spatial-format-ref/overview) for more information.

### GeoLayer ###

An important GeoProcessor data object is the GeoLayer, which corresponds to a spatial data layer containing
"features" (geometry or shape data), "attributes" (properties associated with each feature), and
additional layer properties such as coordinate reference system (projection).
A GeoLayer has the following characteristics:

* The GeoProcessor commands assign unique identifiers to GeoLayers as they are read so that
commands can use the identifiers to access GeoLayers.
* The features in a GeoLayer must be of a single type (e.g., point, line, polygon).
* The GeoLayer has a coordinate reference system corresponding to the units of coordinates
in the features.
* Currently the GeoProcessor only handles vector layers.
The ability to process rasters (grids) may be added in the future.

### GeoLayer Lists ###

It is often helpful to process multiple layers at once.
Therefore, the GeoProcessor implements the concept of "lists of GeoLayers" or GeoLayerList.
To work with lists, commands use lists of the GeoLayer identifiers.
GeoLayer lists have the following characteristics:

* A list has a unique identifier.
* The list maintains a list of GeoLayer, which allows multiple GeoLayers to be processed at once.
	+ Alternatively, each GeoLayer in the list could be processed separately.
	+ Some commands require GeoLayer lists as input because of the processing being performed.

## Alternatives to the GeoProcessor ##

Alternatives to the GeoProcessor should be considered where the GeoProcessor does not satisfy requirements.
Need to explain how GeoProcessor overcomes limitations.

* QGIS modeling tools
* Esri ArcGIS Model Builder

## Next Steps

The remainder of this documentation describes how to install and use the GeoProcessor software.
