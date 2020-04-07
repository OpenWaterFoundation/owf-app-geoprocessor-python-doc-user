# GeoProcessor / Spatial Data Format Reference / Overview #

This reference section of the documentation provides information about spatial data formats that are
supported by the GeoProcessor, as listed below.
Spatial data layers have general characteristics that can be treated generally.
However, some formats have specific characteristics that are difficult to support in a general way.
The following are listed in alphabetical order.
More detailed information is available for each format.
Support for additional formats will be added over time and some commands may support additional
formats due to underlying software features.

The GeoProcessor is also able to run command line software such as GDAL and OGR programs,
which support many formats. See:

* [`RunGdalProgram`](../command-ref/RunOgrProgram/RunOgrProgram.md)
* [`RunOgrProgram`](../command-ref/RunOgrProgram/RunOgrProgram.md)

**<p style="text-align: center;">
GeoProcessor Supported Spatial Data Formats
</p>**

| **Format Name**                                                       | **Type**        | **Comment** |
| --------------------------------------------------------------------- | --------------- | ----------- |
| [(Esri) File Geodatabase](EsriFileGeodatabase/EsriFileGeodatabase.md) | Custom database | |
| [(Esri) Shapefile](EsriShapefile/EsriShapefile.md)                    | Binary file     | |
| [GeoJSON](GeoJSON/GeoJSON.md)                                         | Text file       | |
| [KML](KML/KML.md)                                                     | Text file       | |
