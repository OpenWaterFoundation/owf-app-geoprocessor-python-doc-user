# GeoProcessor / Running / Overview #

This documentation provides a reference for how to run the GeoProcessor software in different ways.

* [GeoProcessor Installed Environment Overview](#geoprocessor-installed-environment-overview)
* [GeoProcessor Variants to Run](#geoprocessor-variants-to-run)
* [GeoProcessor `gp` Program Options](#geoprocessor-gp-program-options)

----------------

## GeoProcessor Installed Environment Overview ##

The GeoProcessor software is written in Python.
The GeoProcessor is distributed as a Python virtual environment to isolate the GeoProcessor
from other Python software on the computer, and to protect the computer's Python installation(s) from
changes introduced by installing the GeoProcessor.

The [Appendix - Installing](../appendix-install/install.md) documentation describes how to download
and install the GeoProcessor software.  In summary, the following are the main steps:

1. Access the [GeoProcessor software download page](http://software.openwaterfoundation.org/geoprocessor/) with a web browser
and follow installation instructions.  It will be necessary to install QGIS if not already installed.
2. Run the appropriate GeoProcessor variant program as described in the next section.

## GeoProcessor Variants to Run ##

The GeoProcessor can be run in several ways by running a script (Linux) or batch file (Windows) found
in the GeoProcessor software distribution `Scripts` folder.
The variants run the command line `gp` program with appropriate command line parameters.
More details are provided by following the link for the GeoProcessor Variant in the following table.

**<p style="text-align: center;">
GeoProcessor Run Programs
</p>**

| **GeoProcessor Variant**                     | **Windows Batch File**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Linux Script** | **Description** |
| -------------------------------------------- | -------------- | --------------- | -- |
| [User interface](ui.md)                         | `gpui.bat` | `gpui` | Run the user interface (UI). | 
| [Command line (batch)](cl-batch.md)             | `gp.bat` | `gp` | Run a command file in batch mode using, for example:<br>`gp --commands commandFile` | 
| [Command line (interpreter)](cl-interpreter.md) | `gp.bat` | `gp` | Interactive command line shell (default when `gp` is run). | 
| [Testing framework user interface](gptest.md)   | `gptestui.bat` | `gptestui` | Run the testing framework user interface.<br>**Currently not actively being developed.**| 
| [Testing framework command line](gptest.md)     | `gptest.bat` | `gptest` | Run the testing framework command line:  `gptest --commands commandFile`.<br>**Currently not actively being developed.**| 

## GeoProcessor `gp` Program Options ##

The main GeoProcessor `gp` program recognizes the following command line parameters that control how the software runs.
GeoProcessor variants call `gp` with appropriate parameters to control how the software runs.

**<p style="text-align: center;">
GeoProcessor Program Options
</p>**

| **Option**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| | **The following are for `gp.bat` GeoProcessor batch file.** | |
| `/h` | Print the `gp.bat` usage. | |
| `/o` | Use the OSGeo4W version of QGIS. | `/s` |
| `/printenv` | Print the environment information after configuration and before running the GeoProcessor Python program, useful for troubleshooting. | |
| `/s` | Use the standalone QGIS installer version indicated by the `GeoProcessor-QGIS-Version.txt` file in the software installation folder. | This is the default. |
| `/v` | Print the `gp.bat` version. | |
| | **The following are for GeoProcessor Python program** | |
| `--commands command-file` | The command file to run. A path relative to current folder can specified or specify an absolute path. | Start the interactive command shell. |
| `-h`<br>`--help` | Print the GeoProcessor program usage. | |
| `--http` | Start the GeoProcessor in HTTP mode. **Under development.**| Start the interactive command shell. |
| `-p PropName=PropVal` | Specify environment property values to be passed to the geoprocessor.  These properties will always be defined when the processor runs. | No environment properties are defined. |
| `--ui` | Start the GeoProcessor user interface.| Start the interactive command shell. |
| `-v`<br>`--version` | Print the GeoProcessor version and copyright/licence notice. | |
