# GeoProcessor / GeoTIFF

*   [Overview](#overview)
*   [GeoTIFF Files and Standard GeoLayer Properties](#geotiff-files-and-standard-geolayer-properties)
*   [Limitations](#limitations)

----------------

## Overview ##

GeoTIFF files are an open specification for raster layer data.
GeoTIFF files are useful because they store georeferenced raster data and are understood by GIS software.

The following are resources that explain the specification:

*   [GeoTIFF (Wikipedia)](https://en.wikipedia.org/wiki/GeoTIFF)
*   [OGC GeoTIFF Standard](https://www.ogc.org/standards/geotiff)
*   [GDAL GeoTIFF driver](https://gdal.org/drivers/raster/gtiff.html#raster-gtiff)

## GeoTIFF Files and Standard GeoLayer Properties ##

The following summarizes handling of important data elements for GeoLayers:

*   GeoLayer ID for a layer can be assigned.
*   GeoTiff and QGIS raster representation include CRS.

## Limitations ##

The following are limitations of GeoTIFF files:

1.  GeoProcessor built-in commands do not yet handle complex files and analysis,
    although GDAL and other programs can be called directly.
    The focus in GeoProcessor is initially to handle simple raster data,
    such as an array of data values that can be color-coded for visualization.
