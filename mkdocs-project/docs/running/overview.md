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

The [Appendix - Installing](../appendix-install/install) documentation describes how to download
and install the GeoProcessor software.  In summary, the following are the main steps:

1. Access the software download page with a web browser.  **Need to provide link.**
2. Download the installer program.
3. Run the installer program to install the software in a virtual environment folder.
4. Run the appropriate GeoProcessor variant program as described in the next section.

## GeoProcessor Variants to Run ##

The GeoProcessor can be run in several ways by running a script (Linux) or batch file (Windows) found
in the GeoProcessor software distribution `scripts` folder.
The variants run the command line `gp` program with appropriate command line parameters.
More details are provided by following the link for the GeoProcessor Variant in the following table.

| **GeoProcessor Variant**                     | **Program(s)** | **Description** |
| -------------------------------------------- | -------------- | --------------- |
| [User interface](ui)                         | `gpui.bat` (Windows) and `gpui` (Linux) | Run the user interface. |    
| [Command line (batch)](cl-batch)             | `gp.bat` (Windows) and `gp` (Linux) | Run `gp --commands commandFile`. |    
| [Command line (interpreter)](cl-interpreter) | `gp.bat` (Windows) and `gp` (Linux) | Default when `gp` is run. |    
| [Test framework user interface](gptest)      | `gptestui.bat` (Windows) and `gptestui` (Linux) | Run the test framework user interface. |    
| [Test framework command line](gptest)        | `gptest.bat` (Windows) and `gptest` (Linux) | Run the test framework command line:  `gptest --commands commandFile`. |    

## GeoProcessor `gp` Program Options ##

The main GeoProcessor `gp` program recognizes the following command line parameters that control how the software runs.
GeoProcessor variants call `gp` with appropriate parameters to control how the software runs.

**<p style="text-align: center;">
GeoProcessor Program Options
</p>**

| **Option**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `--commands command-file` | The command file to run. A path relative to current folder can specified or specify an absolute path. | Start the interactive command shell. |
| `--http` | Start the GeoProcessor in HTTP mode. **Under development.**| Start the interactive command shell. |
| `-p PropName=PropVal` | Specify environment property values to be passed to the geoprocessor.  These properties will always be defined when the processor runs. | No environment properties are defined. |
| `--ui` | Start the GeoProcessor user interface.| Start the interactive command shell. |
| `--version` | Print the GeoProcessor version and copyright/licence notice. | |
