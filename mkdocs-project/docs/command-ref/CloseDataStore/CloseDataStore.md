# GeoProcessor / Command / CloseDataStore #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CloseDataStore` command closes a [DataStore's](../../introduction#datastore) database connection.
Closing the connection will cause subsequent interactions with the datastore's database to fail. 
This command can be used to:

* reuse a datastore ID within a workflow
* simulate dropped database connections 
(for example when the GeoProcessor does not read from or write to database for a period due to user inaction).

Closing a datastore frees the underlying database connection resources for the datastore but keeps the
instance of the datastore for tracking purposes.
Attempts to access a datastore that has been closed will print a message
that was specified by `StatusMessage` parameter.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
CloseDataStore(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
| --------------|-----------------|----------------- |
|`DataStoreID`<br>**_required_**|The ID of the DataStore to close. Can be specified using `${Property}`.| None - must be specified.|
|`StatusMessage`<br>*optional*| A status message to display when the datastore information is viewed. The status may be reset if the connection is automatically restored, for example when a subsequent database interaction occurs. Can be specified using `${Property}`.| DataStore [`DataStoreID`] has been closed.|


## Examples ##

**The automated tests for this command have not yet been created.**

** Currently in development queue.**

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/CloseDataStore).

## Troubleshooting ##

## See Also ##

* [`OpenDataStore`](../OpenDataStore/OpenDataStore) command
