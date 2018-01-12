# Learn GeoProcessor / Best Practices / Naming GeoLayer Identifiers #

## **TODO egiles 2018/01/12 This is not a completed documentation page. Discussion between Steve and Emma still needs to occur about best practices** ##

## Overview ##

The foundation of the GeoProcessor relies on [GeoLayers]((../../introduction#geolayer)). 

---
1. The GeoProcessor reads in GeoLayers.
2. The GeoProcessor manipulates GeoLayers. 
3. The GeoProcessor writes out GeoLayers. 
---

The command file allows users to interact with the GeoProcessor and instruct it on how to manipulate the GeoLayers. Each GeoLayer is assigned a unique identifier (the GeoLayer ID). The GeoLayerID is the means by which a user communicates to the GeoProcessor which GeoLayer to manipulate.

## GeoLayer ID Requirements ##

- Spaces are not allowed in GeoLayer IDs 


## Suggested Naming Convention ##

It is important that the GeoLayerIDs signify meaningful information about the GeoLayer. The following naming convention is suggested:

----
`DataType-SourceAgency-Extent-EffectiveDate-CoordinateReferenceSystem`

----

where: 

`DataType` briefly describes what the spatial data is <br>
`SouceAgency` is the acronym of the agency that developed the spatial data <br>
`Extent` describes the spatial extent of the spatial data <br>
`EffectiveDate` is the date that the spatial data is related to <br>
`CoordinateReferenceSystem` is the coordinate reference system of the spatial data (in EPSG/ESRI code)


### Examples ###

GeoLayerID `MunicipalBoundaries-DOLA-CO-None-4326` would represent a spatial data file that:

- is of Municipal Boundaries
- is provided by Colorado Department of Local Affairs
- spans the entire state of Colorado
- has no timestamp related with the data
- is projected in WGS84 (EPSG code 4326)


GeoLayerID `Floodplains-FEMA-Larimer-2010-26913` would represent a spatial data file that: 

- is of Floodplains
- is provided by the Federal Emergency Management Agency
- spans Larimer county
- represents data accurate for 2010 
- is projected in NAD83 Zone 13N (EPSG code 26913)



