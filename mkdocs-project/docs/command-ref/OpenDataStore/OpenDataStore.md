# Learn GeoProcessor / Command / OpenDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `OpenDataStore` command creates a new [DataStore](../../introduction#datastore) allowing access to a database's data.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
OpenDataStore(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`Host` <br> **_required_**| The database host name.| None - must be specified.|
|`DatabaseName` <br> **_required_**| The name of the database.|None - must be specified.|
|`User`<br> **_required_**|The database user.|None - must be specified.|
|`Password`<br> **_required_**|The database password.|None - must be specified.|
|`Port` <br> **_required_**|The database port.|None - must be specified.|
|`DataStoreID`<br> *optional*|Identifier to assign to the DataStore. This allows the DataStore to be used with other commands. A new DataStore will be created.|The `DatabaseName` value is used as the DataStore ID.|

## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/OpenDataStore).

## Troubleshooting ##

## See Also ##
