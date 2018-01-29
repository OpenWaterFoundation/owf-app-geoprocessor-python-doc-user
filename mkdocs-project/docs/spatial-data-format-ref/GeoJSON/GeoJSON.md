# Learn GeoProcessor / GeoJSON

* [Overview](#overview)
* [GeoJSON Files and Standard GeoLayer Properties](#geojson-files-and-standard-geolayer-properties)
* [Limitations](#limitations)

----------------

## Overview ##

GeoJSON files are an open specification for geographic layer information, based on the general JSON specification.
GeoJSON files are useful because the open specification makes it easy to write, read, and view the files.
Because a GeoJSON file is a single file (unlike shapefiles, for example), they are easily handled
as web service resources, such as input to web mapping tools like [Leaflet](http://leafletjs.com/).
The simple file format is generally simple to troubleshooting because the file can be edited and tested.

The following are resources that explain the specification:

* [geojson.org](http://geojson.org/) - specification originator
* [GeoJSON 2008 specification](http://geojson.org/geojson-spec.html) - original specification
* [GeoJSON 2016 RFC 7964 specification](http://geojson.org/geojson-spec.html) - latest specification
* [OWF / Learn GeoJSON](http://learn.openwaterfoundation.org/owf-learn-geojson/) - Open Water Foundation GeoJSON learning resource


## GeoJSON Files and Standard GeoLayer Properties ##


The following summarizes handling of important data elements for GeoLayers:

* GeoLayer identifier...
* Coordinate reference system...
* Other?

## Limitations ##

The following are limitations of GeoJSON files:

1. Files can be very large because of verbose text representation.
2. Although options exist, there is no common standard for symbology.
3. Although options exist, there is no common standard for metadata.
4. The JSON specification has some gaps, such as standard for handling `null` and `NaN`.
5. Attributes without values are not written to the GeoJSON feature properites. 
