# GeoProcessor / Release Notes #

These release notes provide information about changes that have occurred in the GeoProcessor.
A summary table is provided, with links to details for major versions.

* [Version Numbering Convention](#version-numbering-convention)
* [Issue Legend](#issue-legend)
* [Version History](#version-history)
* [Known Limitations](#known-limitations)
* Version Details - the following are separate documentation pages
	+ [Version 1 Details](release-notes-1)

---------------

## Version Numbering Convention ##

GeoProcessor versioning generally adheres to the following pattern.
The version may be incremented in source code but does not become official until a public software release is made.

```
Major.Minor.Maintenance
```
where:

* `Major` is a number indicating a major change to the software,
such as underlying platform or change to the overall design
* `Minor` is a number indicating a minor change to the software, such as a new feature
* `Maintenance` is a number indicating a maintenance release,
for example to fix a bug in an existing component
* The version may also be followed by another indicator such as "beta" to indicate a beta release

## Issue Legend ##

Issues and corresponding release note items are categorized as follows.
Release note items for a version are typically listed in the order shown to emphasize impacts on software users.

* ![limitation](limitation.png) **Known Limitation** – A known limitation has been documented and may impact the user.
The limitation will be addressed in a future release.
* ![bug](bug.png) **Bug Fix** – A bug has been fixed.  Users should evaluate whether their work is impacted.
Sometimes bug fixes impact internal code and changes may not be very visible to users.
* ![remove](remove.png) **Remove** – A feature has been removed, generally because functionality
has been migrated to another feature of tool or the functionality is no longer needed (e.g., a database is no longer available).
* ![change](change.png) **Update/Change** – An existing feature has been changed or enhanced.
Backward compatibility is usually retained.  Modifications to an existing command are considered a change.
* ![new](new.png) **New Feature** – A new feature has been added, such as a new command.
New features may or may not be obvious to users and will generally be visible in new menus and documentation.

## Version History ##

The following table summarizes the GeoProcessor version history.
See the GeoProcessor Version Details links above for more detailed information about each version.
Only recent public versions are documented in detail.
Versions may be grouped if they have occurred in a coordinated or related way.
**<p style="text-align: center;">
GeoProcessor Version History Summary (most current at top)
</p>**

|**GeoProcessor Version(s)**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Summary of Major Changes in Version**|**Release Date**|
|--|--|--|
|1.2.0|Fix Windows installer bugs, enable comment editing, various cleanup.|2019-01-10|
|1.1.0|Add Windows installer, various cleanup.|          |
|1.0.0|Initial release with core geoprocessing functionality and testing framework.|          |

## Known Limitations ##

* ![limitation](limitation.png) The GeoProcessor features are initially focusing on vector spatial data.
Raster layer features are envisioned for the future and will be implemented as resources allow.
