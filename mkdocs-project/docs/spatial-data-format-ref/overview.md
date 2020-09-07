# GeoProcessor / Spatial Data Format Reference / Overview #

* [Introduction](#introduction)
* [Vector Data](#vector-data)
* [Raster Data](#raster-data)

----

## Introduction ##

This reference section of the documentation provides information about spatial data formats that are
supported by the GeoProcessor, as listed below.
Spatial data layers have general characteristics (CRS, attributes, etc.).
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
Underlying software such as GDAL and OGR support additional formats. See also:

* [GDAL Vector Drivers](https://gdal.org/drivers/vector/index.html) - comprehensive list of vector formats handled by OGR and GDAL software
(QGIS version and corresponding GDAL version impacts support for formats)

**<p style="text-align: center;">
GeoProcessor Supported Vector Data Formats
</p>**

| **Format Name**                                                       | **GDAL Drier**       | **Type**             | **Comment** |
| --------------------------------------------------------------------- | -------------------- | -------------------- | ----------- |
| [(Esri) File Geodatabase](EsriFileGeodatabase/EsriFileGeodatabase.md) | FileGDB, OpenFileGDB | Custom database      | Can contain complex data models. |
| [(Esri) Shapefile](EsriShapefile/EsriShapefile.md)                    | ESRI Shapefile       | Related binary files | Popular.  However, use of multiple files, limit on attribute name length are limitations. |
| [(Esri) Web Feature Service](EsriWFS/EsriWFS.md)                      | WFS                  | Web service          | Allows direct access to dataset without local processing and upload. |
| [GeoJSON](GeoJSON/GeoJSON.md)                                         | GeoJSON              | Text file            | Often used for web applications because a single file with simple format. |
| [GeoPackage](GeoPackage/GeoPackage.md)                                | GPKG                 | Spatial database     | Newer format that can contain complex data models. |
| [KML](KML/KML.md)                                                     | KML                  | Text file            | Can be difficult to use because of mixing of data and style information. |

## Raster Data ##

The following raster data formats are supported by the GeoProcessor and are the focus of development and testing.
Underlying software used by the GeoProcessor such as GDAL programs support additional formats.  See also:

* [GDAL Raster Drivers](https://gdal.org/drivers/raster/index.html) - comprehensive list of raster formats handled by GDAL software
(QGIS version and corresponding GDAL version impacts support for formats)

**<p style="text-align: center;">
GeoProcessor Supported Raster Data Formats
</p>**

| **Format Name**                                                       | **GDAL Driver** | **Type**         | **Comment** |
| --------------------------------------------------------------------- | --------------- | ---------------- | ----------- |
| [GeoTIFF](GeoTIFF/GeoTIFF.md)                                         | GTiff           | Binary file      | Often used for web applications. |
| [OGC Web Map Tile Service (WMTS)](OGC-WMTS/OGC-WMTS.md)               | WMTS            | Web Service      | Tiled images used for background map. |
