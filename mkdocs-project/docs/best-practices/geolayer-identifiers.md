# Learn GeoProcessor / Best Practices / GeoLayer Identifiers #

## Overview ##

The main function of the GeoProcessor is to process [GeoLayers](../../introduction#geolayer):

1. The GeoProcessor reads in GeoLayers.
2. The GeoProcessor manipulates GeoLayers. 
3. The GeoProcessor writes out GeoLayers. 

Each GeoLayer is assigned a unique identifier (the GeoLayer ID) and commands that process GeoLayers
typically have a `GeoLayerID` parameter (or variations if multiple layers are processed).
The `GeoLayerID` is the means by which a command communicates with the GeoProcessor to retrieve a GeoLayer to manipulate.

## GeoLayer ID Requirements ##

* Spaces are not allowed in GeoLayer IDs.

## Recommended GeoLayer ID Convention ##

It is important that the GeoLayerID provide meaningful information about the GeoLayer.
Identifiers that are too terse may be ambiguous and identifiers based on filenames may
be not provide relevant information.
The following naming convention (or similar) is recommended:

```
DataType-SourceAgency-Extent-EffectiveDate-Scenario-CoordinateReferenceSystem
```

where: 

* `DataType` indicates the content of the spatial data
* `SourceAgency` is the acronym of the agency that developed the spatial data, if available
* `Extent` describes the spatial extent of the spatial data, if appropriate, for example:
	+ state abbreviation
	+ county name or code
* `EffectiveDate` is the date that the spatial data is effective (a publishing date or version may also be appropriate)
* `Scenario` is an additional identifier part to indicate a scenario, if appropriate
* `CoordinateReferenceSystem` is the coordinate reference system of the spatial data (in EPSG/ESRI code),
appropriate if different layers would otherwise have the same identifier

The above parts can be used in combination as appropriate, with parts omitted if not relevant or redundant.
Dashes are used instead of spaces and uppercase/lowercase can be used for readability.

### Examples ###

GeoLayerID `MunicipalBoundaries-DOLA-CO-4326` would represent a spatial data layer that:

* contains municipal boundaries (`MunicipalBoundaries`)
* is provided by Colorado Department of Local Affairs (`DOLA`)
* spans the entire state of Colorado (`CO`)
* has no timestamp related with the data (omitted)
* is projected in WGS84 (EPSG code `4326`)

GeoLayerID `Floodplains-FEMA-Larimer-2010-26913` would represent a spatial data file that: 

* contains floodplains (`Floodplains`)
* is provided by the Federal Emergency Management Agency (`FEMA`)
* spans Larimer county (`Larimer`)
* represents data accurate for 2010 (`2010`)
* is projected in NAD83 Zone 13N (EPSG code `26913`)

The scope of data use will impact the identifier conventions.
For example, if processing will span multiple states, then the previous example may need to include the State
in addition to the county:

```text
Floodplains-FEMA-CO-Larimer-2010-26913
```
