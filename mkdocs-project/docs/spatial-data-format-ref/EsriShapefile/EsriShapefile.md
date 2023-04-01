# GeoProcessor / Esri Shapefile 

*   [Overview](#overview)
*   [Esri Shapefiles and Standard GeoLayer Properties](#esri-shapefiles-and-standard-geolayer-properties)
*   [Limitations](#limitations)

----------------

## Overview ##

An Esri Shapefile is a spatial data format that stores attribute and geometry information for a spatial feature dataset.
A single shapefile is comprised of all or some of the following files:

|File Extension|Description|Required?|
|----|-----|----|
|`.shp`|Provides features' geometry.|Yes|
|`.shx`|Provides index of the geometry.|Yes|
|`.dbf`|Provides features' attribute data.| Yes|
|`.prj`|Provides the spatial projection.| No|
|`.xml`|Provides the metadata.| No|
|`.sbn`|Provides spatial indexing.| No|
|`.sbx`|Provides optimization for spatial queries.|No|
|`.cpg`|Provides the encoding.|No|

The following are resources that explain the specification:

*   [ESRI Shapefile Technical Description](https://www.esri.com/library/whitepapers/pdfs/shapefile.pdf) - technical description
*   [GDAL Esri Shapefile driver](https://gdal.org/drivers/vector/shapefile.html#vector-shapefile)

## Esri Shapefiles and Standard GeoLayer Properties ##

The following summarizes handling of important data elements for GeoLayers:

*   A GeoLayer retains the coordinate reference system of the source Esri Shapefile (if a valid source `.prj` is available). 
*   A GeoLayer retains the attribute data of the source Esri Shapefile.
*   TODO egiles 2018/01/15 Include information about if the metadata file (.xml) is consumed within a GeoLayer

## Limitations ##

1.  Attribute field names cannot exceed 10 characters. 
2.  Date and time cannot be stored in one field.
