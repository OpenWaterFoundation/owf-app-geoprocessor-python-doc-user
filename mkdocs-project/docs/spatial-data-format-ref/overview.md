# GeoProcessor / Spatial Data Format Reference / Overview #

* [Introduction](#introduction)
* [Vector Data](#vector-data)
* [Raster Data](#raster-data)

----

## Introduction ##

This reference section of the documentation provides information about spatial data formats that are
supported by the GeoProcessor, as listed below.
Spatial data layers have general characteristics that can be treated generally.
However, some formats have specific characteristics that may require additional software features.

An initial goal of the GeoProcessor is to focus on formats that are widely used and can
support developing useful analysis workflows and applications, including web applications.
Support for additional formats will be added over time.
Some commands may support additional formats due to underlying software features,
such as GDAL and OGR support for many formats.

The GeoProcessor is also able to run command line software such as GDAL and OGR programs,
which support many formats. See:

* [`RunGdalProgram`](../command-ref/RunOgrProgram/RunOgrProgram.md)
* [`RunOgrProgram`](../command-ref/RunOgrProgram/RunOgrProgram.md)

## Vector Data ##

The following vector data formats are supported by the GeoProcessor and are the focus of development and testing.
Again, some underlying software may support additional formats. See also:

* [GDAL Vector Drivers](https://gdal.org/drivers/vector/index.html) - comprehensive list of vector formats handled by OGR and GDAL software
(QGIS version and corresponding GDAL version impacts support for formats)

**<p style="text-align: center;">
GeoProcessor Supported Vector Data Formats
</p>**

| **Format Name**                                                       | **Type**             | **Comment** |
| --------------------------------------------------------------------- | -------------------- | ----------- |
| [(Esri) File Geodatabase](EsriFileGeodatabase/EsriFileGeodatabase.md) | Custom database      | Can contain complex data models. |
| [(Esri) Shapefile](EsriShapefile/EsriShapefile.md)                    | Related binary files | Popular.  However, use of multiple files, limit on attribute name length are limitations. |
| [GeoJSON](GeoJSON/GeoJSON.md)                                         | Text file            | Often used for web applications. |
| [GeoPackage](GeoPackage/GeoPackage.md)                                | Spatial database     | Newer format that can contain complex data models. |
| [KML](KML/KML.md)                                                     | Text file            | Can be difficult to use because of mixing of data and style information. |

## Raster Data ##

The following raster data formats are supported by the GeoProcessor and are the focus of development and testing.
Again, some underlying software may support additional formats.  See also:

* [GDAL Raster Drivers](https://gdal.org/drivers/raster/index.html) - comprehensive list of raster formats handled by GDAL software
(QGIS version and corresponding GDAL version impacts support for formats)

**<p style="text-align: center;">
GeoProcessor Supported Raster Data Formats
</p>**

| **Format Name**                                                       | **Type**         | **Comment** |
| --------------------------------------------------------------------- | ---------------- | ----------- |
| [GeoTIFF](GeoTIFF/GeoTIFF.md)                                         | Binary file      | Often used for web applications. |
