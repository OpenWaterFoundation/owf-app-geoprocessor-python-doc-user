# GeoProcessor / Running / Testing Framework

* [Overview](#overview)
* [Installation](#installation)
* [Running the Testing Framework](#running-the-testing-framework)

--------------

## Overview ##

The GeoProcessor includes a testing framework, which is used to test the GeoProcessor itself
(see the [Developer Documentation](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-dev/dev-tasks/dev-tasks#testing))
by running tests in the [test repository](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test).
The test framework can also be used to automate testing of command file workflows,
for example to validate other software and processes.
The GeoProcessor testing framework does not require additional Python programming and instead relies on
GeoProcessor commands that provide testing features.
Examples of using the testing framework are:

* tests for commands - see the [GeoProcessor test repository](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test)
* tests to confirm that a workflow is valid, for example by running a subset of a large analysis
or to confirm that a snapshot of the large analysis is correct
* test to confirm that a command line program gives expected results (see the
[`RunProgram`](../command-ref/RunProgram/RunProgram) command)

## Installation ##

The normal GeoProcessor run programs (`gp.bat` and `gpui.bat` on Windows, and `gp` and `gpui` on Linux) assume that the
QGIS or ArcGIS Proo software is installed,
and provide full access to geoprocessing commands.
However, the testing framework included in the GeoProcessor is also useful in stand-alone mode without relying on GIS software.
The [installation instructions](../appendix-install/install) explain how to install the test framework version,
which installs testing framework run programs
(`gptest.bat` and `gptestui` on Windows, and `gptest` and `gptestui` on Linux).
In summary, installing the testing framework will install a Python virtual environment that isolates
the GoeProcessor software from other Python installations on the system.

## Running the Testing Framework ##

The GeoProcessor testing framework is run using:

* Command line:  `gptest.bat` on ![windows](../images/windows-32.png) Windows and `gptest` on ![linux](../images/linux-32.png) Linux
* User interface (UI):  `gptestui.bat` on ![windows](../images/windows-32.png) Windows and `gptestui` on ![linux](../images/linux-32.png) Linux

The above programs are located in the `scripts` folder of the GeoProcessor virtual environment.

**Need to update this section if the installer implements menus or other features to streamline starting the software.**
