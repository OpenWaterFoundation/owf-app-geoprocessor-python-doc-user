# Learn GeoProcessor / Command / WebGet #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WebGet` command downloads a file from a URL source. 

* Zip files can be downloaded. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
WebGet(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `FileURL` <br>  **_required_**| The URL of the file to download.| None - must be specified. |
| `OutputFile` <br> **_required_**| The output file path without the extension (relative or absolute path). The extension of the downloaded file will be retained in the output file. [`${Property}` syntax](../../introduction/#geoprocessor-properties-property) is recognized. [Formatting character (%f)](../../introduction/#geolayer-property-format-specifiers) is recognized.| None - must be specified. |
|`IfZipFile`<br> *optional*|The action that occurs if the file to download is a `.zip` file. <br><br> `UnzipAndRemove`: The contents of the `.zip` file are extracted. If configured, the filename of each extracted archive file is renamed. The `.zip` file is not saved. <br><br> `UnzipAndSave`: The contents of the `.zip` file are extracted. If configured, the filename of each extracted archived file is renamed. The `.zip` file is saved. If configured, the filename of the `.zip` file is renamed. The archived files of the saved `.zip` file keep their original name. <br><br> `KeepZipped`: The `.zip` file is saved. If configured, the filename of the `.zip` file is renamed. The archived files of the saved `.zip` file keep their original name.|`UnzipAndSave`|


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/WebGet).

### Example 1: Using the `%f` Formatting Character in the `OutputFile` Parameter###

```
WebGet(FileURL = "https://rmgsc.cr.usgs.gov/outgoing/GeoMAC/2015_fire_data/Florida/Mystery_Hammock_Wf/fl_mystery_hammock_wf_20150817_0000_dd83.cpg", OutputFile = "ExampleOutputFolder/%f")
WebGet(GeoLayerID = "https://rmgsc.cr.usgs.gov/outgoing/GeoMAC/2015_fire_data/Florida/Mystery_Hammock_Wf/fl_mystery_hammock_wf_20150817_0000_dd83.cpg", OutputFile = "ExampleOutputFolder/NewFilename")
```

The two commands download the same [data file](https://rmgsc.cr.usgs.gov/outgoing/GeoMAC/2015_fire_data/Florida/Mystery_Hammock_Wf/fl_mystery_hammock_wf_20150817_0000_dd83.cpg). 

- The first command utilizes the `%f` [formatting character](../../introduction/#geolayer-property-format-specifiers) in the `OutputFile` parameter.
- The second command utilizes a unique filename in the `OutputFile` parameter.

After running the commands, the following files are downloaded to the `ExampleOutputFolder` folder. The 

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|Filename|Command Responsible for Output|
|------|---|
|fl_mystery_hammock_wf_20150817_0000_dd83.cpg|First command (with %f formatter)|
|NewFilename.cpg|Second command (with unique filename)|

### Example 2: Using the default `IfZipFile` Parameter###

```
WebGet(FileURL = "https://rmgsc.cr.usgs.gov/outgoing/GeoMAC/2015_fire_data/Florida/Mystery_Hammock_Wf/fl_mystery_hammock_wf_20150817_0000_dd83.zip", OutputFile = "ExampleOutputFolder/NewFilename")
```

The command is downloading [a `.zip` file](https://rmgsc.cr.usgs.gov/outgoing/GeoMAC/2015_fire_data/Florida/Mystery_Hammock_Wf/fl_mystery_hammock_wf_20150817_0000_dd83.zip). 

- By default the `IfZipFile` parameter is set to `UnzipAndSave`. 
- The `OutputFile` parameter value is supplying the unique filename `NewFilename`.

After running the command, the following files are downloaded to `ExampleOutputFolder` folder. Note that the archived files of the `NewFilename.zip` keep their original name even though a unique filename is provided by the `OutputFile` parameter.

**<p style="text-align: left;">
ExampleOutputFolder
</p>**

|File|
|------|
|NewFilename.cpg|
|NewFilename.dbf|
|NewFilename.prj|
|NewFilename.sbn|
|NewFilename.sbx|
|NewFilename.shp|
|NewFilename.shx|
|NewFilename.zip|

**<p style="text-align: left;">
Contents of `NewFilename.zip`
</p>**

|Archived File|
|------|
|fl_mystery_hammock_wf_20150817_0000_dd83.cpg|
|fl_mystery_hammock_wf_20150817_0000_dd83.dbf|
|fl_mystery_hammock_wf_20150817_0000_dd83.prj|
|fl_mystery_hammock_wf_20150817_0000_dd83.sbn|
|fl_mystery_hammock_wf_20150817_0000_dd83.sbx|
|fl_mystery_hammock_wf_20150817_0000_dd83.shp|
|fl_mystery_hammock_wf_20150817_0000_dd83.shx|



## Troubleshooting ##

## See Also ##

- The files are downloaded using the Python [Requests](http://docs.python-requests.org/en/master/) library.