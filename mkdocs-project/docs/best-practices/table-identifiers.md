# GeoProcessor / Best Practices / Table Identifiers #

This documentation provides best practices for table identifiers

## Overview ##

[Tables](../introduction/introduction.md#table) are GeoProcessor objects that store related data in tabular format. 

1.  The GeoProcessor reads in Tables.
2.  The GeoProcessor manipulates Tables. 
3.  The GeoProcessor writes out Tables. 

Each Table is assigned a unique identifier (the Table ID). Commands that process Tables
typically have a `TableID` parameter (or variations if multiple tables are processed).
The `TableID` is the means by which a command communicates with the GeoProcessor to retrieve a Table to manipulate.

## Table ID Requirements ##

*   Spaces are not allowed in Table IDs.

## Recommended Table ID Convention ##

It is important that the Table ID provides meaningful information about the Table.
Identifiers that are too terse may be ambiguous and identifiers based on filenames may
be not provide relevant information.
The following naming convention (or similar) is recommended:

```
DataType-SourceAgency-EffectiveDate-Scenario
```
where: 

*   `DataType` indicates the content of the tabular data
*   `SourceAgency` is the acronym of the agency that developed the spatial data, if available
*   `EffectiveDate` is the date that the tabular data is effective (a publishing date or version may also be appropriate)
*   `Scenario` is an additional identifier part to indicate a scenario, if appropriate

The above parts can be used in combination as appropriate, with parts omitted if not relevant or redundant.
Dashes are used instead of spaces and uppercase/lowercase can be used for readability.

### Examples ###

TableID `Clients-DOLA-2017-Colorado` would represent a tabular layer that:

*   lists the available clients (`Clients`) and their related attributes
*   is provided by Colorado Department of Local Affairs (`DOLA`)
*   is relevant for the 2017 year
*   spans the entire state of Colorado (`CO`)
