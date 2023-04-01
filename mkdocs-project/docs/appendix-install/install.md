# GeoProcessor / Installing #

This documentation describes how to install the GeoProcessor.
The installation procedure varies based on GeoProcessor, QGIS, and operating system versions.
The GeoProcessor software installation process currently does not use a graphical interface so a "manual" installation is used.

*   [GeoProcessor Variants](#geoprocessor-variants)
*   [Install GeoProcessor, for use with QGIS](#install-geoprocessor-for-use-with-qgis)
*   [Install GeoProcessor, for use with ArcGIS Pro](#install-geoprocessor-for-use-with-arcgis-pro)
*   [Install GeoProcessor Testing Framework](#install-geoprocessor-testing-framework)
*   [Troubleshooting Installation](#troubleshooting-installation)

----------------------

## GeoProcessor Variants ##

The GeoProcessor is distributed in three variants, as indicated below.
The term "variant" is used because the term "version" is used for the numeric #.#.# version.
Installation for each variant is described in separate sections to avoid confusion.
Select the GeoProcessor variant that is most appropriate.
Multiple GoeProcessor variants and versions can be installed at the same time.

*   **GeoProcessor, for use with QGIS**:
    +   **This version is actively being developed and is recommended.**
    +   Uses QGIS as the geographic information system (GIS) framework, and uses Python 3 packaged with QGIS.
        **The standalone QGIS installer is recommended rather than OSGeo4W installation.**
    +   GeoProcessor software is installed outside of QGIS software files using a Python virtual environment.
    +   Includes all GeoProcessor functionality.
*   **GeoProcessor, for use with ArcGIS Pro**
    +   **This version has been prototyped but is not actively under development, mainly due to resource constraints.
        It will be released in the future.**
    +   Uses ArcGIS Pro as the geographic information system (GIS) framework, and uses Python 3 packaged with ArcGIS Pro.
    +   GeoProcessor software is installed outside of ArcGIS Pro software files using a Python virtual environment.
    +   Includes all GeoProcessor functionality.
*   **Testing framework (no QGIS or ArcGIS dependencies)**:
    +   **This version was previously developed but is no longer under active development.**
    +   Includes the GeoProcessor testing framework, which can be used to test software (is also included in above versions).
    +   QGIS and ArcGIS Pro components are omitted from the GeoProcessor test framework distribution (no GIS software dependencies).
    +   Can be used to automate tests for software and processing workflows.

## Install GeoProcessor, for use with QGIS ##

The full GeoProcessor installation for QGIS requires that a consistent version of standalone QGIS is installed.
The GeoProcessor software will be updated over time to support new QGIS versions.

1.  See the [GeoProcessor Download page](http://software.openwaterfoundation.org/geoprocessor/) for a list of available GeoProcessor installers,
    which indicate the QGIS version that is required.  Follow the instructions on the site to download and install the GeoProcessor.
2.  If not already installed, download and install an appropriate version of QGIS.
    See the [OWF / Learn QGIS](http://learn.openwaterfoundation.org/owf-learn-qgis/install-qgis/install-qgis/) documentation for how to install QGIS.
    It is OK to install multiple standalone QGIS versions, as long as one matches the GeoProcessor requirement.

It is generally best if the the GeoProcessor installer QGIS version and installed QGIS version are the same
to ensure that there are no incompatibilities.
The `GeoProcessor-QGIS-Version.txt` file installed with GeoProcessor indicates the QGIS version that should be used.
It is possible to change this file and the GeoProcessor will work as long as underlying QGIS libraries have not changed.
[Automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test)
can be run to confirm expected results.

## Install GeoProcessor, for use with ArcGIS Pro ##

**This section needs to be updated.  The initial focus has been on the QGIS version.**

Instructions to install the GeoProcessor for ArcGIS will be added in the future.

## Install GeoProcessor Testing Framework ##

**The testing framework version of GeoProcessor is currenty not under active development and may be removed.
This documentation is out of date.**

The GeoProcessor testing framework is used to automate software and process testing
and does not require QGIS or ArcGIS Pro software to be installed.
The testing framework is also automatically installed when the
[QGIS](#install-full-geoprocessor-for-use-with-qgis) and
[ArcGIS Pro](#install-full-geoprocessor-for-use-with-arcgis-pro)
variants of the GeoProcessor are installed because it is used to test those variants of the GeoProcessor.

The following steps install the testing framework.
Currently, installation uses the command line but in the future a graphical installer may be implemented.

1.  [Download GeoProcessor Installer Script](#1-download-geoprocessor-installer-script)
2.  [Run the Installer Script](#2-run-the-installer-script)
3.  [Run the testing framework](#3-run-the-testing-framework)

### 1. Download GeoProcessor Installer Script ###

The GeoProcessor testing framework is distributed as a Python virtual environment in a `tar.gz` file (Linux)
or `zip` file (Windows).
This allows the testing framework to be isolated from other Python installations on the computer.
Download and installation is facilitated by first downloading and running a small installer script
that will help with the installation.
Download the script by accessing the following link:
[GeoProcessor `download-gp.sh`](http://software.openwaterfoundation.org/geoprocessor/download-gp.sh)
and save the script on the computer, for example in the `Downloads` folder.
Or, select a link to the `download-gp.sh` script from the
[GeoProcessor download page](http://software.openwaterfoundation.org/geoprocessor/index.html).

### 2. Run the Installer Script ###

After downloading the `download-gp.sh` script, run it from a Linux command line:

```
$ ./download-gp.sh
```

or if necessary because the file does not have execute permissions:

```
$ sh download-gp.sh
```

Follow the instructions.
The main decisions are to pick the variant/version of the GeoProcessor to install, 
and indicate where to install.  Consider the following:

*   The GeoProcessor installer filename (e.g., `gptest-1.0.0-cyg-venv.tar.gz`) indicates information about the software,
    in this example that the installer is for the test framework, the version is `1.0.0`,
    and the software is packaged for Cygwin.
*   The installer process first installs files to the `/tmp` folder and then moves to the requested installation folder.
*   It is possible to install multiple versions of the GeoProcessor, in order to freeze the software for a project
    and allow transition to newer versions over time.
    In this case, the installation folder should include the version number.
    However, the QGIS and ArcGIS Pro variants will depend on QGIS and ArcGIS Pro software installed in the
    standard location and those frameworks may or may not allow multiple versions to be installed.

Example output from running the `download-gp.sh` script to install the test framework on Cygwin is shown below
(the output will change as the installer process is refined so the following may not exactly match what you see):

```sh
sam Downloads $ ./download-gp.sh
Detected operatingSystem=cygwin

Downloading the GeoProcessor catalog file...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   158  100   158    0     0    797      0 --:--:-- --:--:-- --:--:--   797
-----------------------------------------------------------------------
Select the GeoProcessor version to install from the following by specifying the line number:

1 2018-12-27 12:58:00   58804098 geoprocessor/1.0.0/gptest-1.0.0-cyg-venv.tar.gz

Specify installer number (leftmost number) to install [q to quit]  1
installerLine=1 2018-12-27 12:58:00   58804098 geoprocessor/1.0.0/gptest-1.0.0-cyg-venv.tar.gz
selectedInstallerVersion=1.0.0
selectedInstallerFile=gptest-1.0.0-cyg-venv.tar.gz
Downloading the GeoProcessor installer from http://software.openwaterfoundation.org/geoprocessor/1.0.0/gptest-1.0.0-cyg-venv.tar.gz...

Downloading the GeoProcessor software...
+ curl --fail -o /tmp/sam-gptest-1.0.0-cyg-venv.tar.gz http://software.openwaterfoundation.org/geoprocessor/1.0.0/gptest-1.0.0-cyg-venv.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 56.0M  100 56.0M    0     0  5467k      0  0:00:10  0:00:10 --:--:-- 5399k
+ set errorCode=0
Extracting install-gp-venv.sh script to /tmp
+ mkdir -p /tmp/sam
+ cd /tmp/sam
+ tar -xzvf /tmp/sam-gptest-1.0.0-cyg-venv.tar.gz --wildcards '*/scripts/install-gp-venv.sh'
gptest-1.0.0-cyg-venv/scripts/install-gp-venv.sh
+ errorCode=0

Installing the GeoProcesor virtual environment to user-specified folder.

Current folder is:
  /cygdrive/C/Users/sam/Downloads
Installation folder is typically gptest-venv or gptest-1.0.0-venv (specific to version).
Specify the folder to install into, will create if does not exist.
Specify relative to current folder or provide an absolute path (q to quit): /home/sam/gptest-venv
Will install GeoProcessor virtual env as folder:  /home/sam/gptest-venv
Continue with install [Y/n]?

... file list for install will be shown ...
```

### 3. Run the testing framework ###

Once the GeoProcessor testing framework is installed, it can be run using the `gptest` (batch) or
`gptestui` (user interface) scripts.
Assuming that the software was installed into the `/home/sam/gptest-venv` folder as shown above,
the above scripts are located in the `/home/sam/gptest-venv/scripts` folder.
To make it easier to run the scripts, add the folder to the `PATH`,
define symbolic links in a folder that is already in the `PATH`, or define a shell alias.
Otherwise type the path to the program to run.

## Troubleshooting Installation ##

Information will be added here to document issues.
