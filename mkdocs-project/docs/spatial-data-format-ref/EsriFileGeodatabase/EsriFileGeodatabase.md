# Learn GeoProcessor / Esri File Geodatabase

* [Overview](#overview)
* [Esri File Geodatabase and Standard GeoLayer Properties](#esri-file-geodatabase-and-standard-geolayer-properties)
* [Limitations](#limitations)

----------------

## Overview ##
According to Esri, a file geodatabase is a collection of datasets of various types stored in a common file system folder. Each *geographic* vector dataset within the file geodatabse is called a feature class. Unlike [Esri Shapefiles](../EsriShapefile/EsriShapefile.md), feature classes allow the length of their attribute field names to be greater than 10 characters.

The following are resources that explain the specification:

* [Sustainability of Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/fdd000294.shtml) - Library of Congress Digital Format Description (Esri Geodatabase)
* [ArcMap 10.6 Reference Manual](http://desktop.arcgis.com/en/arcmap/latest/manage-data/administer-file-gdbs/file-geodatabases.htm) - Esri's 10.6 Description of a File Geodatabase

## Esri File Geodatabase and Standard GeoLayer Properties ##

Only feature classes within a file geodatabase are read into the GeoProcessor as GeoLayers. 

* A GeoLayer retains the coordinate reference system of the feature class. 
* A GeoLayer retains the attribute data of the feature class.

## Limitations ##

1. Although options exist, there is no easy way to open a file geodatabase in an open-source GIS platform.

