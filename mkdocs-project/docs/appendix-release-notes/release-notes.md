# GeoProcessor / Release Notes #

These release notes provide information about changes that have occurred in the GeoProcessor.
A summary table is provided, with links to details for major versions.

*   [Version History](#version-history)
*   Version Details - the following are separate documentation pages
    +   [Version 1 Details](release-notes-1.md)
*   [Known Limitations](#known-limitations)
*   [Version Numbering Convention](#version-numbering-convention)
*   [Issue Icon Legend](#issue-icon-legend)

---------------

## Version History ##

The following table summarizes the GeoProcessor version history.
See the GeoProcessor Version Details links above for more detailed information about each version.
Only recent public versions are documented in detail.
Versions may be grouped if they have occurred in a coordinated or related way.
Releases are typically:

*   **Feature release** - second part of the version is updated because new functionality has been implemented
*   **Maintenance release** - third part of the version is updated because existing functionality has been fixed
*   **Development release** - version includes a fourth part such as `dev1` and is undergoing frequent changes

**<p style="text-align: center;">
GeoProcessor Version History Summary (most current at top)
</p>**

|**GeoProcessor Version(s)**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Summary of Major Changes in Version**|**Release Date**|
| -- | -- | -- |
| 1.6.0 | Feature release including update from QGIS 3.10 to 3.22.16 LTR. **Under development.** | 2023-03-12 |
| 1.5.0 | Feature release including additional support for raster data processing. | 2020-11-28 |
| 1.4.1 | Updates consistent with InfoMapper map configuration file creation. | 2020-09-24 |
| 1.2.0 | Fix Windows installer bugs, enable comment editing, various cleanup. | 2019-01-10 |
| 1.1.0 | Add Windows installer, various cleanup.| |
| 1.0.0 | Initial release with core geoprocessing functionality and testing framework.| |

## Known Limitations ##

*   ![limitation](limitation.png) The GeoProcessor features initially focused on vector spatial data.
Raster layer features are being added.

## Version Numbering Convention ##

GeoProcessor versioning generally adheres to the following pattern, consistent with [Semantic Versioning](https://semver.org/).
The version may be incremented in source code but does not become official until a public software release is made.

```
Major.Minor.Patch.Modifier
```
where:

*   `Major` is a number indicating a major change to the software,
    such as underlying platform or change to the overall design.
*   `Minor` is a number indicating a minor change to the software, such as a new feature.
*   `Patch` (or maintenance) is a number indicating a maintenance release,
    for example to fix a bug in an existing component without adding significant new functionality.
*   `Modifier` is a modified such as "dev1" to indicate a development version that is undergoing changes.

## Issue Icon Legend ##

Issues and corresponding release note items are categorized as follows.
Release note items for a version are typically listed in the order shown to emphasize impacts on software users.

*   ![limitation](limitation.png) **Known Limitation** – A known limitation has been documented and may impact the user.
    The limitation will be addressed in a future release.
*   ![bug](bug.png) **Bug Fix** – A bug has been fixed.  Users should evaluate whether their work is impacted.
    Sometimes bug fixes impact internal code and changes may not be very visible to users.
*   ![remove](remove.png) **Remove** – A feature has been removed, generally because functionality
    has been migrated to another feature of tool or the functionality is no longer needed (e.g., a database is no longer available).
*   ![change](change.png) **Update/Change** – An existing feature has been changed or enhanced.
    Backward compatibility is usually retained.  Modifications to an existing command are considered a change.
*   ![new](new.png) **New Feature** – A new feature has been added, such as a new command.
    New features may or may not be obvious to users and will generally be visible in new menus and documentation.

