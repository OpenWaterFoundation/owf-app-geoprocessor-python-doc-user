# GeoProcessor / OGC WMTS

* [Overview](#overview)
* [OGC WMTS and Standard GeoLayer Properties](#ogc-wmts-and-standard-geolayer-properties)
* [Limitations](#limitations)

----------------

## Overview ##

The Open Geospatial Consortium (OGC) Web Map Tile Service (WMTS) format
provides geogreferenced tiled images, which can be used as a background map layer.

The following are resources that explain the specification:

* [Web Map Tile Service (Wikipedia)](https://en.wikipedia.org/wiki/Web_Map_Tile_Service)
* [OGC WMTS Standard](https://www.ogc.org/standards/wmts)
* [GDAL OGC WMS driver](https://gdal.org/drivers/raster/wmts.html#raster-wmts)

WMTS are accessed by providing a URL to software, with placeholders for coordinates.
The software provides the coordinates as the map is panned and zoomed,
and underlying software will query the WMTS to retrieve needed time images.

See the [`ReadRasterGeoLayerFromTileMapService`](../../command-ref/ReadRasterGeoLayerFromTileMapService/ReadRasterGeoLayerFromTileMapService.md)
command for examples of WTMS URLs.

## OGC WMS and Standard GeoLayer Properties ##

The following summarizes handling of important data elements for GeoLayers:

* GeoLayer ID for a layer can be assigned.
* WMTS includes CRS.

## Limitations ##

The following are limitations of OGC WMTS files:

1. WMTS access requires internet.
However, it is possible to build a local dataset.
2. Different service providers may require a key to access services.
