# GeoProcessor / GeoMapProject #

This documentation describes the specification of the GeoMapProject.

* [Introduction](#introduction)
* [Examples](#examples)
* [Specification](#specification)
	+ [GeoMapProject](#geomapproject)
	+ [GeoMap](#geomap)
	+ [GeoLayerViewGroup](#geolayerviewgroup)
	+ [GeoLayerView](#geolayerview)
	+ [GeoLayer](#geolayer)
	+ [GeoSymbol](#geosymbol)
		- [GeoLayerSymbol Properties for Point Feature Type](#geolayersymbol-properties-for-point-feature-type)
		- [GeoLayerSymbol Properties for Line Feature Type](#geolayersymbol-properties-for-line-feature-type)
		- [GeoLayerSymbol Properties for Polygon Feature Type](#geolayersymbol-properties-for-polygon-feature-type)
		- [GeoLayerSymbol Properties for Categorized Classification Type](#geolayersymbol-properties-for-categorized-classification-type)
		- [GeoLayerSymbol Properties for Graduated Classification Type](#geolayersymbol-properties-for-graduated-classification-type)
		- [GeoLayerSymbol Properties for Single Symbol Classification Type](#geolayersymbol-properties-for-single-symbol-classification-type)
	+ [GeoLayerViewEventHandler](#geolayervieweventhandler)
	+ [Encoded Data](#encoded-data)
		- [Color](#color)
		- [Color Ramp](#color-ramp)
		- [Color Table](#color-table)
		- [DateTime](#datetime)
		- [Extent](#extent)
* [History of Specification](#history-of-specification)

-----------------

## Introduction ##

A GeoMapProject defines configurations for maps, to be displayed in the GeoProcessor, web applications, and other software.
It is conceptually equivalent to QGIS (`qgs`) and ArcGIS (`mxd) map project file. 
However, the GeoProcessor GeoMapProject is a light-weight JSON file that contains relatively minimal configuration information.
GeoProcessor commands available in the ***Map Processing*** commands menu automate creating GeoMapProjects,
so that maps can be recreated and scaled to various locations.

The following diagram illustrates components that comprise a GeoMapProject.

**<p style="text-align: center;">
![GeoMapProject-diagram](images/GeoMapProject-diagram.png)
</p>**

**<p style="text-align: center;">
GeoMapProject Components (<a href="../images/GeoMapProject-diagram.png">see full-size image</a>)
</p>**

It is envisioned that GeoMapProjects will be used to define map configurations for the types
described in the following table, and other types added over time.

**<p style="text-align: center;">
GeoMapProject Types
</p>**

| **GeoMapProject Type** | **Description** |
| -- | -- |
| `Dashboard` | An application that has several maps, typically accessible by menus or other user interface components.  The [Poudre Information Platform](https://github.com/OpenWaterFoundation/owf-app-poudre-dashboard-ng) is an example. The application would have an additional configuration file to indicate how maps are used in the dashboard. |
| `Grid` | A grid (matrix) of maps, for example showing different times.  For example, see the [California Drought visualization](https://www.latimes.com/local/lanow/la-me-g-california-drought-map-htmlstory.html).  Additional layout properties may be needed to define how the grid is laid out.  Because of the resources needed for each map, it may make sense to initially display the maps as a grid of images and then have links to maps similar to a dashboard. |
| `SingleMap` | A single [GeoMap](#geomap) is included in the [GeoMapProject](#geomapproject), for typical "single page web applications" where a single map display dominates the application.  In this case the [GeoMapProject](#geomapproject) `geoMaps` list can onl contain one [GeoMap](#geomap). For example, the [CDSS SNODAS Tools](http://snodas.cdss.state.co.us/app/index.html) is an example of a single map application (in this case it does not use the new GeoMapProject design). |
| `Story` | A sequence of maps that are referenced in a story. For example, see [stories that OWF has created](http://stories.openwaterfoundation.org/). |

A GeoMapProject is created using the
[`CreateGeoMapProject`](../command-ref/CreateGeoMapProject/CreateGeoMapProject) command
and related commands and is written to a file using the 
[`WriteGeoMapProjectToJSON`](../command-ref/WriteGeoMapProjectToJSON/WriteGeoMapProjectToJSON) command.

The contents of the command are consistent with the top-level `GeoMapProject` instance and hierarchy of objects, as follows,
which are written using the standard Python `json` package.

```
GeoMapProject                     # Top-level object containing a list of GeoMap.
   GeoMap []                      # List of GeoMap, each of which can stand alone.
      GeoLayer []                 # List of all GeoLayer used in a GeoMap.
      GeoLayerViewGroup []        # List of GeoLayerViewGroup in a GeoMap, used for legend groups.
        GeoLayerView              # A GeoLayerView assigns a GeoSymbol to a GeoLayer, for viewing.
           GeoLayer               # Reference to a layer in GeoLayer list (above).
           GeoSymbol              # Symbol used to visualize the layer.
           EventHandler []        # One or more event handlers to respond to map interactions
```

A GeoMapProject can be used by other software, such as web mapping applications, to display maps.
Consequently, the GeoProcessor can be used to automate map creation,
which can help scale a prototype map to more locations.

Using a map configuration file in an application typically consists of the following software functionality,
in increasing level of complexity:

1. Display the map layers with correct symbology, legend, etc.
The core data in a GeoMap are intended to support this functionality.
2. Allow read-only interaction with map layers.
For example, mouse over or click on features or markers on the map and perform
other actions such as displaying layer properties or related data visualizations.
See the [GeoLayerViewEventHandler](#geolayervieweventhandler) documentation.
3. Allow additional analysis that may add additional attributes to existing layers or add new layers.
This functionality must be coded in the application as either reusable components
or custom application code.
4. Edit data interactively, saving back to the original data layer, a copy,
or some other data management software.
This functionality must be coded in the application as either reusable components
or custom application code.

The GeoProcessor will be enhanced over time to implement additional functionality
for the higher numbered functionality levels,
for example to provide map displays for GeoMap configurations.

## Examples ##

The following are examples of GeoViewProject files.

**<p style="text-align: center;">
GeoMapProject Example JSON Files
</p>**

| **Example** | **Project Type** | **Description** |
| -- | -- | -- |
| [Basic Example](resources/test-CreateGeoMap-out.json) | `Dashboard` | Output of [automated test](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ListFiles) for [`CreateGeoMapProject`](../command-ref/CreateGeoMapProject/CreateGeoMapProject) command. |
| | | More examples will be added in the future, with links to workflows that created the GeoMapProject files. |

## Specification ##

The GeoViewMapProject specification can be understood by reviewing the JSON format for GeoViewProject.
This format is a serialized form of the in-memory Python objects in GeoProcessor software,
although the JSON file elements are slightly different from in-memory object attributes due to naming conventions
(e.g., `GeoLayer.geolayer_id` and `GeoLayer.id` in Python becomes `geoLayerId` in JSON)
and to avoid serializing all data (e.g., GeoLayer in Python contains layer data whereas in JSON the
data exists in separate GeoJSON or other files).

The properties described in the following sections include built-in data members and
open-ended properties dictionary corresponding to `properties` data member for each object type.

**It is expected that additional work on the specification is needed,
for example to define the syntax for symbol color ramps.
These details will be addressed as quickly as possible
through changes to this documentation and Python GeoProcessor code
in order to converge on a workable specification.**

### GeoMapProject ###

The GeoMapProject is the top-level element to describe one or more related maps.

The following are built-in GeoMapProject data members.

**<p style="text-align: center;">
GeoMapProject Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `geoMapProjectId` | Unique GeoMapProject identifier, typically without whitespace, for example: `AbcWebApp`. | None - must be specified. |
| `name` | Short name, suitable for display in applications, for example: `ABC River Basin Water Resources`. | None - must be specified. |
| `description` | A longer description (up to a few sentences), suitable for display on a catalog of maps.  | |
| `geoMaps` | An array (Python list) of [GeoMap](#geomap).  One or more maps can be contained in the GeoMapProject. | |
| `properties` | An open-ended list of elements to provide additional properties (see table below). | |
| `projectType` | The GeoMapProject type, for example `Dashboard`, `Grid`, `SingleMap`, or `Story`. | |

The following are recognized GeoMapProject properties.

**<p style="text-align: center;">
GeoMapProject Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `author` | Name of author or organization. | |
| `effectiveDateTime` | Effective date/time of the GeoMapProject, before which the project does not apply, using ISO-8601 date/time, for example `2020-07-03T00:00:00`. | Always effective. |
| `enabled` | Indicates whether the map project is enabled, specified as boolean `true` or `false`.  If `false`, application code can ignore the map project or read in but indicate as disabled. | `true` |
| `fileFormatVersion` | Version of the of the GeoMapProject JSON file in notation `Major.Minor.Micro`. | |
| `expiresDateTime` | Date/time when the project expires, as an ISO-8601 date/time string. | Never expires. |
| `saveDateTime` | Date/time when the project was created. | |
| | Additional properties can be added. | |

### GeoMap ###

A GeoMap is a collection of [GeoLayerViewGroup](#geolayerviewgroup) (layer groups as list of [GeoLayerView](#geolayerview)),
organized in logical order and using appropriate symbols.
For convenience, a unique list of [GeoLayer](#geolayer) is maintained as a GeoMap data element
and the specific [GeoLayer](#geolayer) are referred to in [GeoLayerView](#geolayerview).
This provides the opportunity for software applications to read the layers once and share between views,
rather than re-reading the layers multiple times (for example for political boundaries, rivers,
transportation networks, etc.).

The following are built-in GeoMap data members.

**<p style="text-align: center;">
GeoMap Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `crs` | A coordinate reference system (CRS) code to indicate projection of the data, for example `EPSG:4326`.  See the [Spatial Reference Website](https://spatialreference.org/).  | `.` |
| `dataPath` | A list of comma-separated file and URL folders where data layers can be found, relative to the GeoMapProject file, or as absolute paths.  The folders will be searched in order when attempting to find layers.  The [GeoLayer](#geolayer) `sourcePath` property can be set to a path relative to these folders when publishing a map project. | `.` |
| `description` | A longer description (up to a few sentences), suitable for display on a catalog of maps.  | |
| `geoMapId` | Unique [GeoMap](#geomap) identifier, typically without whitespace, for example: `MyMap`. | None - must be specified. |
| `name` | Short name, suitable for display in applications, for example: `Agricultural Data`. | None - must be specified. |
| `geoLayers` | An array (Python list) of [GeoLayer](#geolayer) for all the layers used in the map.  The [GeoLayer](#geolayer) in this list are referred to by `geoLayerId` in other elements such as layers referenced in [GeoLayerView](#geolayerview).| |
| `geoLayerViewGroups` | An array (Python list) of [GeoLayerViewGroup](#geolayerviewgroup).  One or more layer views can be contained in the [GeoMapProject](#geomapproject). | |
| `properties` | An open-ended list of elements to provide additional properties (see table below). | |

The following are recognized GeoMap properties.

**<p style="text-align: center;">
GeoMap Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `enabled` | Indicates whether the map is enabled, specified as boolean `true` or `false`.  If `false`, application code can ignore the map or read in but indicate as disabled. | `true` |
| `extentInitial` | Initial displayed map extent.  See [Extent](#extent) section. | Typically, display all layer data.|
| `extentMaximum` | Maximum displayed map extent.  See [Extent](#extent) section. | No limit.|
| `extentMinimum` | Minimum displayed map extent.  See [Extent](#extent) section. | No limit.|
| `geoLayerView.`<br>`selectInitial.`<br>`default` | Default for [GeoLayerView](#geolayerview) and [GeoLayerViewGroup](#geolayerviewgroup) `selectedInitial` property value.  This property value should typically be set as follows: <ul><li>`true` - for simple map with few layers because most layers should be selected for display; layer views to **not** display will use `selectedInitial=false`</li><li>`false` - for complex map with many layers because most layers should **not** be selected for display; layer views to display will use `selectedInitial=true`</li></ul>| `true` - all GeoLayerViewGroup and GeoLayerView will be selected for initial display. |

### GeoLayerViewGroup ###

A GeoLayerViewGroup is a list of [GeoLayerView](#geolayerview) and corresponds to a group of layers in a map legend.
A group is often used to group layers of similar contents, such as:

* similar data from different sources or versions
* base maps
* temporal meaning, for example series of layers for different date/times, or multiple layers for a single date/time

Because of the limited role of a group, a GeoLayerViewGroup has limited data values.
The following are built-in GeoLayerViewGroup data members.

**<p style="text-align: center;">
GeoLayerViewGroup Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `description` | A longer description (up to a few sentences), suitable for display on a catalog of views.  | |
| `geoLayerViewGroupId` | Unique GeoLayerViewGroup identifier, typically without whitespace, for example: `IrrigatedLands`. | None - must be specified. |
| `geoLayerViews` | An array (Python list) of [GeoLayerView](#geolayerview) for all the layer views used in the group. | |
| `name` | Short name, suitable for display in applications, for example: `Irrigated Lands`. | None - must be specified. |
| `properties` | An open-ended list of elements to provide additional properties (see table below). | |

The following are recognized GeoLayerViewGroup properties.

**<p style="text-align: center;">
GeoLayerViewGroup Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| -- | -- | -- |
| `enabled` | Indicates whether the GeoLayerViewGroup is enabled, specified as boolean `true` or `false`.  If `false`, application code can ignore the group or read in but indicate as disabled. | `true` |
| `selectBehavior` | Indicates how selections for the group should occur:<ul><li>`Any` - zero or more layer views can be selected</li><li>`Single` - zero or one layer view can be selected at a time (selecting a layer view will automatically deselect other layer views in the group).</li><li>`Custom` - a custom tool is implemented to select layer views, envisioned for complex applications</li></ul> | `Any` |
| `selectedInitial` | Indicates whether the GeoLayerViewGroup is selected for display when the map is initially displayed, specified as boolean `true` or `false`. | See GeoMap `geoLayerView.`<br>`selectedInitial.`<br>`default`|

### GeoLayerView ###

A GeoLayerView is a simple object that contains a reference to a [GeoLayer](#geolayer) (using its `geoLayerId`) and [GeoLayerSymbol](#geolayersymbol),
which provides properties used when displaying the layer.

The following are built-in GeoLayerView data members.

**<p style="text-align: center;">
GeoLayerView Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `description` | A longer description (up to a few sentences), suitable for display on a catalog of views.  The value can be the same as the associated [GeoLayer](#geolayer), or provide a different value for display purposes. | |
| `eventHandlers` | A list of [GeoLayerViewEventHandler](#geolayervieweventhandler), which indicate how events on a GeoLayerView should be handled.  | |
| `geoLayerId` | Unique [GeoLayer](#geolayer) identifier associated with the view, matching a value in the [GeoMap](#geomap) `geoLayers` list. | None - must be specified. |
| `geoLayerSymbol` | Symbol properties used to display the layer in the view. See the [GeoLayerSymbol](#geolayersymbol) properties below.|  |
| `geoLayerViewId` | Unique GeoLayerView identifier, typically without whitespace, for example: `IrrigatedLands2010`.  The value can be the same as the associated [GeoLayer](#geolayer), or provide a different value for display purposes.  | None - must be specified. |
| `name` | Short name, suitable for display in applications, for example: `Irrigated Lands, 2010`.  The value can be the same as the associated [GeoLayer](#geolayer), or provide a different value for display purposes. | None - must be specified. |
| `properties` | An open-ended list of elements to provide additional properties (see table below). | |

The following are recognized GeoLayerView properties.

**<p style="text-align: center;">
GeoLayerView Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| -- | -- | -- |
| `enabled` | Indicates whether the GeoLayerView is enabled, specified as boolean `true` or `false`.  If `false`, application code can ignore the layer view or read in but indicate as disabled. | `true` |
| `selectedInitial` | Indicates whether the GeoLayerViewGroup is selected for display when the map is initially displayed, specified as boolean `true` or `false`. | See GeoMap `geoLayerView.`<br>`selectedInitial.`<br>`default`|

### GeoLayer ###

A GeoLayer corresponds to a vector or raster spatial data file, such as a GeoJSON file, shapefile, KML, raster file (TIF, etc), or other format.
Each GeoLayer in a [GeoMap](#geomap) is listed in the `geoLayers` list of the [GeoMap](#geomap).
Each [GeoLayerView](#geolayerview) in a [GeoMap](#geomap) refers to the [GeoMap](#geomap) using its `geoLayerId` value.

The following are built-in GeoLayer data members.

**<p style="text-align: center;">
GeoLayer Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `crs` | A coordinate reference system (CRS) code to indicate projection of the data in the layer, for example `EPSG:4326`.  See the [Spatial Reference Website](https://spatialreference.org/).  | None - must be specified. |
| `description` | A longer description (up to a few sentences), suitable for display on a catalog of layers.  | |
| `geoLayerId` | Unique GeoLayer identifier, typically without whitespace, for example: `IrrigatedLands2010`. | None - must be specified. |
| `geometryType` | Geometry type in format similar to `WKT:Polygon`, which is used to determine which [GeoLayerSymbol](#geolayersymbol) properties are relevant.  See the [WKT Documentation](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry). | None - must be specified. |
| `history` | A list of strings indicating how the layer was processed by the GeoProcessor, useful to troubleshoot processing issues. | |
| `layerType` | Layer type: <ul><li>`Raster` - a raster layer</li><li>`Vector` - a vector layer</li></ul>The layer type is useful to help applications know how to process the layer. | None - must be specified. |
| `name` | Short name, suitable for display in applications, for example: `Irrigated Lands, 2010`. | None - must be specified. |
| `properties` | An open-ended list of elements to provide additional properties (see table below). | |
| `sourcePath` | The path to the source layer data as a file or URL path.  Although it can be a full path (for example when retrieving data from remote servers), it is usually specified relative to a folder in the [GeoMap](#geomap) `dataPath` folders when publishing a self-contained website.  This provides flexibility in storing and accessing layers in applications.  If the layer was written during processing, then the output file path is used.  Otherwise, the layer input file path is used. | None - must be specified. |

The following are recognized GeoLayer properties.

**<p style="text-align: center;">
GeoLayer Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| | Currently no properties are defined.  Source data often provide metadata or other information. | |

### GeoLayerSymbol ###

A GeoLayerSymbol stores properties used to display a layer, depending on the classification type for data.
The following symbol classification types are recognized:

* `Categorized` - each unique value for a specific layer attribute is visualized with specific properties
* `Graduated` - a specific layer attribute's value is visualized using a graduated color ramp or assigned colors
* `SingleSymbol` - layer features are drawn using the same symbol

Consequently, the properties for the symbol vary depending on the symbol classification type, as described in the following tables.
The feature type also indicates which properties are used. 

* Properties by feature type:
	+ [GeoLayerSymbol Properties for Point Feature Type](#geolayersymbol-properties-for-point-feature-type)
	+ [GeoLayerSymbol Properties for Line Feature Type](#geolayersymbol-properties-for-line-feature-type)
	+ [GeoLayerSymbol Properties for Polygon Feature Type](#geolayersymbol-properties-for-polygon-feature-type)
* Properties by classification type:
	+ [GeoLayerSymbol Properties for Categorized Classification Type](#geolayersymbol-properties-for-categorized-classification-type)
	+ [GeoLayerSymbol Properties for Graduated Classification Type](#geolayersymbol-properties-for-graduated-classification-type)
	+ [GeoLayerSymbol Properties for Single Symbol Classification Type](#geolayersymbol-properties-for-single-symbol-classification-type)

**<p style="text-align: center;">
GeoLayerSymbol Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| -- | -- | -- |
| `name` | Symbol name, for example to allow re-use of standard symbol definitions, for example:  `WaterBodies`. | |
| `description` | A longer description (up to a few sentences), suitable for display on a catalog of symbols.  | |
| `classificationType` | The symbol classification type, which is used to determine other properties that are relevant:<ul><li>`Categorized` - unique (typically integer or string) attribute values are drawn similarly</li><li>`Graduated` - a (typically numeric) attribute value is used to look up color from a color ramp or table</li><li>`SingleSymbol` - same symbol is used for all features</li></ul> | `SingleSymbol` |

#### GeoLayerSymbol Properties for Categorized Classification Type ####

The following GeoLayerSymbol properties can be used with GeoLayerSymbol `classificationType=Categorized`
and indicate how to determine color from layer data values.

**<p style="text-align: center;">
Categorized GeoLayerSymbol Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| | Currently no properties are defined.  Source data often provide metadata or other information. | |

#### GeoLayerSymbol Properties for Graduated Classification Type ####

The following GeoLayerSymbol properties can be used with GeoLayerSymbol `classificationType=Graduated`
and indicate how to determine color from layer data values.

**<p style="text-align: center;">
Graduated GeoLayerSymbol Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| | Currently no properties are defined.  Source data often provide metadata or other information. | |

#### GeoLayerSymbol Properties for Single Symbol Classification Type ####

The following GeoLayerSymbol properties can be used with GeoLayerSymbol `classificationType=SingleSymbol`
and indicate how to determine color from layer data values.

**<p style="text-align: center;">
SingleSymbol GeoLayerSymbol Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `color` | Color for the symbol as recognized color (see [Colors](#colors)). | |
| `outlineColor` | Outline color for the symbol as recognized color (see [Colors](#colors)). | |

#### GeoLayerSymbol Properties for Point Feature Type ####

The following GeoLayerSymbol properties can be used with [GeoLayer](#geolayer) `geometryType=Point`.

**<p style="text-align: center;">
SingleSymbol GeoLayerSymbol Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `color` | Color for the symbol as recognized color (see [Colors](#colors)). | |
| `outlineColor` | Outline color for the symbol as recognized color (see [Colors](#colors)). | |

#### GeoLayerSymbol Properties for Line Feature Type ####

The following GeoLayerSymbol properties can be used with [GeoLayer](#geolayer) `geometryType=WKT:LineString`.

**<p style="text-align: center;">
SingleSymbol GeoLayerSymbol Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `color` | Color for the symbol as recognized color (see [Colors](#colors)). | |
| `outlineColor` | Outline color for the symbol as recognized color (see [Colors](#colors)). | |

#### GeoLayerSymbol Properties for Polygon Feature Type ####

The following GeoLayerSymbol properties can be used with [GeoLayer](#geolayer) `geometryType=WKT:Polygon`.

**<p style="text-align: center;">
SingleSymbol GeoLayerSymbol Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `color` | Color for the symbol as recognized color (see [Colors](#colors)), used for both `fillColor` and `outlineColor`. | |
| `fillColor` | Fill color for the symbol as recognized color (see [Colors](#colors)). | |
| `outlineColor` | Outline color for the symbol as recognized color (see [Colors](#colors)). | |

### GeoLayerViewEventHandler ###

The [GeoLayerView](#geolayerview) part of the GeoMapProject configuration can contain event handling information,
as added by the [`SetGeoLayerViewEventHandler`](../command-ref/SetGeoLayerViewEventHandler/SetGeoLayerViewEventHandler.md) command.
The goal is to include general configuration information that can inform an application's behavior
and minimize the amount of hard-coding or custom configuration of the application.

For example, general web application components can be developed to read a GeoMapProject and implement
basic event handling and features such as:

Event handler information can also be used to define custom application behavior that goes beyond
default functionality, where the event handler properties must be further interpreted in the application.
The GeoProcessor does not place restrictions on how event types or properties are defined,
but a consistent convention should be used.

The following are built-in GeoLayerViewEventHandler data members.

**<p style="text-align: center;">
GeoLayerViewEventHandler Built-in Data Elements
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| -- | -- | -- |
| `eventType` | An event type string, for example `MouseOver` or `MouseClicked`, which indicates an event type that should be handled by applications.  The implementing application software should match event types for the technology being used with this event type and then use associated properties to perform functionality in the application.  For example, a property may indicate a template display name to use when a map layer feature is moused over or clicked on. | None - must be specified. |
| `name` | Short name, suitable to identify an event handler, which makes the map configuration more readable. | |
| `description` | A longer description (up to a few sentences), which makes the map configuration more readable.  | |
| `properties` | An open-ended list of elements to provide additional properties (see table below). | |

The following are recognized GeoLayerViewEventHandler properties.

**<p style="text-align: center;">
GeoLayerViewEventHandler Properties in `properties` JSON Element
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| | Currently no properties are defined.  Conventions need to be established. | |


## Encoded Data ##

Encoded data objects are typically self-contained data objects that lend themselves to representation in a standard text format.
Rather than attempting to break the encoded data into a complex definition in JSON,
the objects are encoded as a string that can be represented as a JSON string value.
Standard application code can then be implemented to decode the text representation for use in the application.

There are often multiple representations for such objects due to multiple standards,
implementations in software, and practical solutions.
Consequently, for this specification, an optional `specification`: specifier may be used at the
beginning of encoded value to provide guidance on the encoding format,
where the word `specification` will vary depending on the specification.
For example `WKT:` is used when the following value is a well known text geometry value.

Software that consumes map project files must then have logic to handle the different encodings,
indicate support in documentation, and implement suitable warnings and error handling when an encoding is not supported,

### Color ###

A color value may be used in various ways, for example for foreground, background, fill, outline, text, etc.

The following table describes recognized color encodings.
Several common formats are used as defaults and should be handled by software.
For example, a string starting with `#` can easily be detected as hex code string.

**Need to describe how to describe opacity/transparency, alpha channel, etc.**

**<p style="text-align: center;">
Color Encoding Specifications
</p>**

| **Encoding Specification** | **Description** | **Example** |
| -- | -- | -- |
| **default** | Red/green/blue text triplet with numerical values 0-255: `r,g,b`. | For red: `255,0,0` |
| **default** | Red/green/blue hex triplet: `#rrggbb`. | For red: `xff0000` |
| **default** | Named colors (see table below).  **This color representatio is less safe because color names may not be standardized and recognized in all software tools.** | For red: `red` |

The following table lists recognized named colors (**need to link to web resource rather than relisting
here - not sure how consistent named colors are so maybe pick a few and rely on RGB and hex for others**):

**<p style="text-align: center;">
Named Color Property Values
</p>**

| **Named Color** | **RGB Equivalent** | **Hex Equivalent** | 
| -- | -- | -- |
| `white` | `255,255,255` | `xffffff` |

### Color Ramp ###

A color ramp is spectrum of colors that (generally) varies from one extreme (e.g., red) to another (e.g., blue).
A color ramp is typically used with graduated classification type.
A color ramp uses a color table but simplifies the specification by specifying by color ramp name.

**Need to describe how to define in JSON.**

The following color ramps are recognized ([see Java GRColorTable class used in TSTool](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/RTi/GR/GRColorTable.java)):

| **Color Ramp Name** | **Description** |
| -- | -- |
| -- | Need to define. |

### Color Table ###

A color table defines colors that should be used for specific input values or ranges.
A color table is typically used with graduated or category classification type.
A color table is specified using value limits and associated color.
Quite often, a color table corresponds to a standard data representation,
for example temperature, rain, snow, or other scale.

**Need to describe how to define in JSON.  Do units need to be considered such as specifying English and SI units for range breaks?**

### DateTime ###

Date/time strings are typically saved in JSON as simple strings.
This may be sufficient or it may be desirable to indicate that the value should be parsed as an actual date or date/time object in application code.
The following is an idea that may be implemented at some point but is currently just an idea.
Currently, standard date/time formats and application code that can handle is assumed.
Some technologies provide special features to handle date/times when serializing/deserializing and simple strings are sufficient.

A "cast" or "type" syntax may be implemented, such as:

```
"effectiveTime": "DateTime('2020-04-01')"
```

If necessary, the specification type can also be used, for example:

```
"effectiveTime": "DateTime('ISO-8601:2020-04-01')"
```

### Extent ###

An extent is a region on a map, typically used for a display extent.
For example, a map has an initial extent to be shown when the map is first displayed.
The extent is typically defined as an unprojected (geographic) "rectangular" area.
Software must then determine how best to display the extent considering:

* projection to the map's CRS, so that the full extent will be displayed without cutting off
* perhaps buffering the extent so that the extent does not abut the edge of visible display - for example add 5% buffer

Where possible, software should allow for extent coordinates being specified in any order, for example for `MinMax` and `WKT` encodings.
The following extent encodings are recognized.

**<p style="text-align: center;">
Extent Encoding Specifications
</p>**

| **Encoding Specification** | **Description** | **Example** |
| -- | -- | -- |
| **default** | `MinMax` without the specification string. | `-105,40,-104,41` |
| `MinMax:` | Define the extent as minimum and maximum coordinates of a bounding box (`XMin,YMin,XMax,YMax`), in geographic coordinates. | `MinMax:-105,40,-104,41` |
| `WKT:` | Define the extent as a [well known text geometry](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry), using geographic coordinates. | Rectangle defined as a WKT polygon:  `WKT:POLYGON((0 0, 10 0, 10 10, 0 10))` |
| `ZoomLevel:` | Define the extent as a zoom level, which is common for web applications, using format `Longitude,Latitude,ZoomLevel` and geographic coordinates.  The zoom level depends on the application and may be required to be an integer. For example, see:  <ul><li> [Leaflet zoom levels](https://leafletjs.com/examples/zoom-levels/)</li><li>[Google Maps zoom levels](https://developers.google.com/maps/documentation/javascript/interaction)</ul>| `ZoomLevel:-105.084419,40.585258,5` |

## History of Specification ##

The following table lists the history of the GeoMapProject specification.

**<p style="text-align: center;">
Built-in Data Elements
</p>**

| **Version** | **Changes**
| -- | -- |
| 0.1.0 | Initial version being developed by the Open Water Foundation (in process), being developed by coordinating GeoProcessor and web application development. |
