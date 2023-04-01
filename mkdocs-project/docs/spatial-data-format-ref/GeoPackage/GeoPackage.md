# GeoProcessor / GeoPackage

*   [Overview](#overview)
*   [GeoPackage Files and Standard GeoLayer Properties](#GeoPackage-files-and-standard-geolayer-properties)
*   [Limitations](#limitations)

----------------

## Overview ##

A GeoPackage file is a SQLite database file that stores vector and raster geospatial information,
based on the GeoPackage specification.
GeoPackage is useful because it is an open specification, and distribution of data in a single file-based database
makes it easy to write, read, and view the files.
Because a GeoPackage file is a single file, it is easily handled
as a web resource, for example to implement web mapping tools using [Leaflet](http://leafletjs.com/).

The following are resources that explain the specification:

*   [geopackage.org](http://geopackage.org/) - specification website
*   [OGC GeoPackage Encoding Standard](https://www.ogc.org/standards/geopackage) - GeoPackage specification
*   [GeoPackage (Wikipedia)](https://en.wikipedia.org/wiki/GeoPackage)
*   [GDAL GeoPackage driver](https://gdal.org/drivers/vector/gpkg.html#vector-gpkg)
*   [OWF / Learn GeoPackage](http://learn.openwaterfoundation.org/owf-learn-geopackage/) - Open Water Foundation GeoPackage learning resource

## GeoPackage Files and Standard GeoLayer Properties ##

The following summarizes handling of important data elements for GeoLayers:

*   GeoLayer identifier can be assigned to a GeoPackage layer.
*   Coordinate reference system is consistent with GeoPackage CRS.

## Limitations ##

The following are limitations of GeoPackage files:

1.  GeoProcessor built-in commands may not fully support all GeoPackage features.
    More functionality is being enabled over time.
    GDAL and other software can be called if GeoProcessor is limited.
