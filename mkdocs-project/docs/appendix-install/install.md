# GeoProcessor / Installing #

This documentation describes how to install the GeoProcessor.
The installation procedure varies based on GeoProcessor variant (full or testing framework) and operating system.
The GeoProcessor software installation process currently does not use a graphical interface for the installer and
therefore installation steps must be run from the command line.

* [GeoProcessor Variants](#geoprocessor-variants)
* [Install Full GeoProcessor, for use with QGIS](#install-full-geoprocessor-for-use-with-qgis)
* [Install Full GeoProcessor, for use with ArcGIS Pro](#install-full-geoprocessor-for-use-with-arcgis-pro)
* [Install GeoProcessor Testing Framework](#install-geoprocessor-testing-framework)
* [Troubleshooting Installation](#troubleshooting-installation)
* [Obsolete: Install Additional Python Packages](#obsolete-install-additional-python-packages)
	+ [QGIS on Windows Version](#qgis-on-windows-version)
	+ [Linux Test Framework Version](#linux-test-framework-version)

----------------------

## GeoProcessor Variants ##

The GeoProcessor is distributed in three variants, as indicated below.
The term "variant" is used because the term "version" is used for the numeric #.#.# version.
Installation for each variant is described in separate sections to avoid confusion.
Select the GeoProcessor version that is most appropriate.
Multiple GoeProcessor variants and versions can be installed at the same time;
however, installing multiple versions of QGIS and ArcGIS Pro on the same computer can be tricky.

* **Full GeoProcessor, for use with QGIS**:
	+ Uses QGIS as the geographic information system (GIS) framework, and uses Python 3 packaged with QGIS.
	+ GeoProcessor software is installed outside of QGIS software files
	+ Used for geospatial data processing
	+ Command line batch and interpreter, and user interface can be run
	+ Also includes the testing framework
* **Full GeoProcessor, for use with ArcGIS Pro**
	+ Uses ArcGIS Pro as the geographic information system (GIS) framework, and uses Python 3 packaged with ArcGIS Pro.
	+ GeoProcessor software is installed outside of ArcGIS Pro software files
	+ Used for geospatial data processing
	+ Command line batch and interpreter, and user interface can be run
	+ Also includes the testing framework
* **Testing framework (no QGIS or ArcGIS dependencies)**:
	+ Includes the GeoProcessor testing framework, which can be used to test software (is also included in above versions).
	+ QGIS and ArcGIS Pro components are omitted from the GeoProcessor test framework distribution (no GIS software dependencies).
	+ Can be used to automate tests for software and processing workflows.

## Install Full GeoProcessor, for use with QGIS ##

1. [Install QGIS](#install-qgis)
2. [Install Python for QGIS (Optional)](#install-python-for-qgis-optional)
3. [Install GeoProcessor for QGIS](#install-geoprocessor-for-qgis)
	1. [Install `geoprocessor` Python Package for QGIS](#install-geoprocessor-python-package-for-qgis)
	2. [Install GeoProcessor Run Programs for QGIS](#install-geoprocessor-run-programs-for-qgis)

### Install QGIS ###

The full GeoProcessor installation for QGIS requires that QGIS (Version 3) is installed,
generally the most recent available.
See the [OWF / Learn QGIS](http://learn.openwaterfoundation.org/owf-learn-qgis/install-qgis/install-qgis/) documentation for how to install QGIS.
It is recommended that the current QGIS version is installed in the default location to minimize configuration issues.
The GeoProcessor software will default to running the most recent standalone QGIS installation and if not found
will search for OSGeo4W installation of QGIS.

### Install GeoProcessor for QGIS ###

The GeoProcessor software is currently distributed as a `zip` file (Windows) and `tar.gz` file (Cygwin and Linux).
See the [GeoProcessor Download](http://software.openwaterfoundation.org/geoprocessor/) page, which includes basic installation instructions.

## Install Full GeoProcessor, for use with ArcGIS Pro ##

**This section needs to be updated.  The initial focus has been on the testing framework.**

Instructions to install the GeoProcessor for ArcGIS will be added in the future.

## Install GeoProcessor Testing Framework ##

The GeoProcessor testing framework is used to automate software and process testing
and does not require QGIS or ArcGIS Pro software to be installed.
The testing framework is also automatically installed when the
[QGIS](#install-full-geoprocessor-for-use-with-qgis) and
[ArcGIS Pro](#install-full-geoprocessor-for-use-with-arcgis-pro)
variants of the GeoProcessor are installed because it is used to test those variants of the GeoProcessor.

The following steps install the testing framework.
Currently, installation uses the command line but in the future a graphical installer may be implemented.

1. [Download GeoProcessor Installer Script](#1-download-geoprocessor-installer-script)
2. [Run the Installer Script](#2-run-the-installer-script)
3. [Run the testing framework](#3-run-the-testing-framework)

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

* The GeoProcessor installer filename (e.g., `gptest-1.0.0-cyg-venv.tar.gz`) indicates information about the software,
in this example that the installer is for the test framework, the version is `1.0.0`,
and the software is packaged for Cygwin.
* The installer process first installs files to the `/tmp` folder and then moves to the requested installation folder.
* It is possible to install multiple versions of the GeoProcessor, in order to freeze the software for a project
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

The following are cases that have been encountered during installation, with recommendations to resolve each issue.

### ![Windows](../images/windows-32.png) Error running GeoProcessor:  `ModuleNotFoundError:  No module named 'pandas._libs.tslib' ###

The following error may be encountered running the `gpui.bat` batch file on Windows:

```
Running "C:\OSGEO4~1\apps\Python36\python" -m geoprocessor.app.gp --ui
Traceback (most recent call last):
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\pandas\__init__.py", line 26, in <module>
    from pandas._libs import (hashtable as _hashtable,
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\pandas\_libs\__init__.py", line 4, in <module>
    from .tslib import iNaT, NaT, Timestamp, Timedelta, OutOfBoundsDatetime
ModuleNotFoundError: No module named 'pandas._libs.tslib'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\OSGEO4~1\apps\Python36\lib\runpy.py", line 193, in _run_module_as_main
    "__main__", mod_spec)
  File "C:\OSGEO4~1\apps\Python36\lib\runpy.py", line 85, in _run_code
    exec(code, run_globals)
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\geoprocessor\app\gp.py", line 39, in <module>
    from geoprocessor.commands.testing.StartRegressionTestResultsReport import StartRegressionTestResultsReport
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\geoprocessor\commands\testing\StartRegressionTestResultsReport.py", line 29, in <module>
    import geoprocessor.util.validator_util as validators
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\geoprocessor\util\validator_util.py", line 35, in <module>
    import geoprocessor.util.pandas_util as pandas_util
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\geoprocessor\util\pandas_util.py", line 21, in <module>
    import pandas as pd
  File "C:\Users\sam\gp-1.2.0dev-win-venv\Lib\site-packages\pandas\__init__.py", line 35, in <module>
    "the C extensions first.".format(module))
ImportError: C extension: No module named 'pandas._libs.tslib' not built. If you want to import pandas from the source directory, you may need to run 'python setup.py build_ext --inplace --force' to b
uild the C extensions first.
```

The solution was to install the latest QGIS standalone version (3.4.3).
The previous QGIS version was significantly out of date (3.0.0) and apparently there were some
incompatibilities between the GeoProcessor and QGIS.
This required first uninstalling the previous QGIS software.

## Obsolete: Install Additional Python Packages ##

**This section is retained as a temporary artifact and will be removed after other documentation is updated.
Add-on Python packages are included in the distributed GeoProcessor virtual environment.
DO NOT install the following packages.**

Additional Python packages, listed in the following sections,
are required to run all features of the GeoProcessor.

### QGIS on Windows Version

**This section is retained as a temporary artifact and will be removed after other documentation is updated.
Add-on Python packages are included in the distributed GeoProcessor virtual environment.
DO NOT install the following packages.**

Currently, these packages must be installed manually after the GeoProcessor is installed.
In the future, these Python packages will be packaged within the GeoProcessor install
so that users will not have to include this step in the install process. 

To install on Windows QGIS version of GeoProcessor:

1. Open `OSGeo4W shell`. 
2. Enter `set PYTHONHOME=C:\OSGeo4W64\apps\Python36`
3. Enter the software package command (located in the `Command` column of the table below).

|**Software Package Name**|**Source Link(s)**|**How Used Within GeoProcessor**|** Command**|
|-|-|-|-|
|pandas|[https://pandas.pydata.org/](https://pandas.pydata.org/)|Holds and manipulates Table data.|`py -m pip install pandas`|
|OpenPyXL|[https://openpyxl.readthedocs.io/en/stable/](https://openpyxl.readthedocs.io/en/stable/)|Reads and writes Excel 2010 xlsx/xlsm files to and from Table objects.|`py -m pip install openpyxl`|
|requests (extended package)|[http://docs.python-requests.org/en/master/](http://docs.python-requests.org/en/master/)<br><br> [https://pypi.org/project/requests/](https://pypi.org/project/requests/)|Downloads data files within the [`WebGet`](../command-ref/WebGet/WebGet.md) command. <br><br>The `requests[security]` extension package is preferred over the core `requests` package to avoid an error that would occur when downloading a file over `https` with the [`WebGet`](../command-ref/WebGet/WebGet.md) command. The error that occurred when using the core `requests` package printed:<br>`requests.exceptions.SSLError: [Errno 1] _ssl.c:503: error:140770FC:SSL routines:SSL23_GET_SERVER_HELLO:unknown protocol`. <br>This error does not occur when utilizing the `requests[security]` extension package. | `py -m pip install requests[security]`|
|SQLAlchemy|[http://www.sqlalchemy.org/](http://www.sqlalchemy.org/)|Enables connections to databases.|`py -m install pip SQLAlchemy`|

### Linux Test Framework Version ###

**This section is retained as a temporary artifact and will be removed after other documentation is updated.
Add-on Python packages are included in the distributed GeoProcessor virtual environment.
DO NOT install the following packages.**

To install additional packages on for the Linux test framework version of GeoProcessor:

1. Open a terminal. 
2. Enter the software package `apt-get` command (located in the `apt-get Command` column of the table below).

The following has been tested on Jessie 64-bit Debian Linux.

|**Software Package Name**|**Source Link(s)**|**How Used Within GeoProcessor**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Command**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|-|-|-|-|
|PyQt5|[https://pypi.org/project/PyQt5/](https://pypi.org/project/PyQt5/)|Builds the user interface.|`sudo apt-get install python3-pyqt5`|
|pandas|[https://pandas.pydata.org/](https://pandas.pydata.org/)|Holds and manipulates Table data.|`sudo apt-get install python3-pandas`|
|pip|[https://pypi.org/project/pip/](https://pypi.org/project/pip/)|Installs packages dependent on pip installers.|`sudo apt-get install python3-pip`|
|OpenPyXL|[https://openpyxl.readthedocs.io/en/stable/](https://openpyxl.readthedocs.io/en/stable/)|Reads and writes Excel 2010 xlsx/xlsm files to and from Table objects.|`sudo pip3 install openpyxl`|
|xlwt|[https://pypi.org/project/xlwt/](https://pypi.org/project/xlwt/)|Add compatibility to create spreadsheet files (Microsoft Excel versions 95 to 2003)|`sudo pip3 install xlwt`|
|SQLAlchemy|[http://www.sqlalchemy.org/](http://www.sqlalchemy.org/)|Enables connections to databases.|`sudo pip3 install SQLAlchemy`|

