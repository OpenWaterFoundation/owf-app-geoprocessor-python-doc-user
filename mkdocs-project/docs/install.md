# Learn GeoProcessor / Install GeoProcessor #

This documentation describes how to install the GeoProcessor.
The installation process is being evaluated to determine whether a `pip` or Python virtual environment can be used.
However, currently components must each be installed via the command line.

* [GeoProcessor Versions](#geoprocessor-versions)
* [Install Full GeoProcessor, QGIS version](#install-full-geoprocessor-qgis-version)
	+ [Install QGIS](#install-qgis)
	+ [Install Python for QGIS (Optional)](#install-python-for-qgis-optional)
	+ [Install GeoProcessor for QGIS](#install-geoprocessor-for-qgis)
		- [Install `geoprocessor` Python Package for QGIS](#install-geoprocessor-python-package-for-qgis)
		- [Install GeoProcessor Run Programs for QGIS](#install-geoprocessor-run-programs-for-qgis)
* [Install Full GeoProcessor, ArcGIS version](#install-full-geoprocessor-arcgis-version)
* [Install GeoProcessor Test Framework version](#install-geoprocessor-test-framework-version)
	+ [Install Python for GeoProcessor Test Framework (Optional)](#install-python-for-geoprocessor-test-framework-optional)
	+ [Install GeoProcessor for Test Framework](#install-geoprocessor-for-test-framework)
		- [Install `geoprocessor` Python Package for Test Framework](#install-geoprocessor-python-package-for-test-framework)
		- [Install GeoProcessor Run Programs for Test Framework](#install-geoprocessor-run-programs-for-test-framework)
* [Install Additional Python Packages](#install-additional-python-packages)
	+ [QGIS on Windows Version](#qgis-on-windows-version)
	+ [Linux Test Framework Version](#linux-test-framework-version)

----------------------

## GeoProcessor Versions ##

The GeoProcessor is distributed in three versions, as indicated below.
Installation for each version is described in separate sections to avoid confusion.

* **Full GeoProcessor, QGIS version**:
	+ Uses QGIS as GIS framework, and uses Python packaged with QGIS.
	+ Used for geospatial data processing.
	+ GeoProcessor run program:
		- ![Windows](images/windows-32.png) Windows: `gp.bat`
		- ![Linux](images/linux-32.png) Linux: `gp.sh`
	+ Install GeoProcessor `geoprocessor` package in folders that are searched by QGIS Python:
		- ![Windows](images/windows-32.png) Windows: Install from `gp-sitepackage.zip`
		- ![Linux](images/linux-32.png) Linux: Install from `gp-sitepackage.tar.gz`
* **Full GeoProcessor, ArcGIS version**:
	+ Similar to QGIS version but uses ArcGIS as GIS framework and Python packaged with ArcGIS.
* **Test framework version (no QGIS or ArcGIS)**:
	+ Includes the GeoProcessor test framework, which can be used to test software (is also included in above versions).
	+ QGIS and ArcGIS components are omitted from the GeoProcessor test framework distribution (no GIS software dependencies).
	+ Can be used to automate tests for software and processing workflows.
	+ When installed independently, is installed in normal system Python location, rather than QGIS or ArcGIS Python location.
	+ See the [Developer Documentation / Functional Tests](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-dev/dev-tasks/#functional-tests)
	for how to use the software to implement functional tests.
	+ Uses run program:
		- ![Windows](images/windows-32.png) Windows: `gptest.bat`
		- ![Linux](images/linux-32.png) Linux: `gptest.sh`
	+ Install GeoProcessor `geoprocessor` package in folders that are searched by Python:
		- ![Windows](images/windows-32.png) Windows: Install from `gptest-sitepackage.zip`
		- ![Linux](images/linux-32.png) Linux: Install from `gptest-sitepackage.tar.gz`

## Install Full GeoProcessor, QGIS version ##
		
### Install QGIS ###

The full GeoProcessor installation for QGIS requires that QGIS (Version 3) is installed.
See the [Resources](resources#QGIS) information for how to install QGIS.
It is recommended that the current QGIS version is installed in the default location to minimize configuration issues.


### Install Python for QGIS (Optional) ###

The GeoProcessor requires Python 3.6+.
The `gp` program (see next section) that runs the GeoProcessor typically uses the Python distributed with QGIS.

In the future the GeoProcessor may be distributed with a Python virtual environment.
However, this is currently not complete because of dependence on the QGIS installation.
**Advice on this topic from the developer community is welcomed.**

### Install GeoProcessor for QGIS ###

The GeoProcessor installation does not currently use the standard Python `pip` or `pipenv`
installation tools (this will be implemented in the future).
Currently a manual installation process is used:

#### Install `geoprocessor` Python Package for QGIS ####

The GeoProcessor Python modules need to be installed in a folder where the QGIS Python interpreter can find the files.

1. Download GeoProcessor package installer (**standard download website needs to be implemented - for
now files may be distributed by email**).
	1. ![Windows](images/windows-32.png) Windows, typically will be saved to user's `Downloads` folder:
		1. `gp-sitepackage.zip` - full QGIS GeoProcessor
	2. ![Linux](images/linux-32.png) Linux, may be saved to users' `Downloads` folder or `/tmp`:
		1. `gp-sitepackage.tar.gz` - full QGIS GeoProcessor
		2. `gptest-sitepackage.tar.gz` - test framework GeoProcessor (no QGIS)
2. Determine candidate install locations:
	1. ![Windows](images/windows-32.png) Windows QGIS version:
		1. For QGIS 3.1 (or similar), is typically `C:\OSGeo4W64\apps\Python36\Lib\site-packages`.
3. Remove previous installation.  Delete the `geoprocessor` folder from the location determined in the previous step.
4. Install the GeoProcessor package (`geoprocessor` folder and everything included in that folder).
	1. ![Windows](images/windows-32.png) Windows QGIS version:
		1. Use Windows Explorer to copy the contents of the zip file (not the zip file itself) to the above folder.

#### Install GeoProcessor Run Programs for QGIS ####

Simple scripts are provided for Windows (`gp.bat` and `gptest.bat`) and Linux (`gp.sh` and `gptest.sh`)
to configure the GeoProcessor Python environment and run the GeoProcessor.
The programs should be installed in a location that facilitates running the GeoProcessor.
The Windows `gp.bat` and Linux `gp.sh` scripts assume a location for the QGIS install and its embedded Python.
The Windows `gptest.bat` and Linux `gptest.sh` scripts check for Python 3 on the system
(because QGIS Python is not used).
If the location of the Python interpreter does not match the location in the script,
then the script may need to be edited to specify the actual Python interpreter location.

Potential locations to install the run scripts include:

* Standard GeoProcessor software installation folder, accessed using system menus:
	+ **This is not yet enabled but will be the default when the user interface is implemented.**
* Run the script manually from wherever it is installed.
* Check the `PATH` environment variable to see what folders are searched to find software, and
copy the programs to one of the folders.  Determine the folders in the path by running the follows command
in a shell:
	+ ![Windows](images/windows-32.png) Windows command shell: `echo %PATH%`
	+ ![Linux](images/linux-32.png) Linux shell window: `echo $PATH`
* User-defined folder in `PATH` (currently recommended).
	+ ![Linux](images/linux-32.png) Linux user programs, for example: `$HOME/user/bin`
* Install in the QGIS `bin` folder, for example as shown below.
However, this folder may not be in the `PATH` because QGIS may be run from its user interface via system menus.
	+ ![Windows](images/windows-32.png) Windows: `C:\OSGeo4W64\bin`

The `gp.py` file is run by the run scripts and specifies the Python GeoProcessor module to run
using the `-m geoprocessor.app.gp` Python command line parameter.
If the GeoProcessor package was installed in a folder (such as `site-packages`) that is known to the
Python interpreter, the GeoProcessor software will be found and will run.
Otherwise, an error will be displayed about the module not being found and installation locations need to be reviewed.

## Install Full GeoProcessor, ArcGIS Version ##

Instructions to install the GeoProcessor for ArcGIS will be added in the future.

## Install GeoProcessor Test Framework Version ##
		
The test framework version of the GeoProcessor can be used to automate software testing
and does not require QGIS or ArcGIS to be installed.
The test framework is automatically installed when the QGIS and ArcGIS versions of the GeoProcessor are installed.

### Install Python for GeoProcessor Test Framework (Optional) ###

The test framework version of the  GeoProcessor currently requires Python 3.6+.

In the future the GeoProcessor may be distributed with a Python virtual environment.
However, this is currently not implemented.

### Install GeoProcessor for Test Framework ###

The GeoProcessor installation does not currently use the standard Python `pip` or `pipenv`
installation tools (this will be implemented in the future).
Currently a manual installation process is used:

### Install `geoprocessor` Python Package for Test Framework ###

The GeoProcessor Python modules need to be installed in a folder where the Python interpreter can find the files.
Candidate locations will vary depending on how Python 3 is installed on the computer.

1. Download GeoProcessor package installer (**standard download website needs to be implemented - for
now files may be distributed by email**).
	1. ![Windows](images/windows-32.png) Windows, typically will be saved to user's `Downloads` folder:
		1. `gptest-sitepackage.zip` - test framework GeoProcessor (no QGIS)
	2. ![Linux](images/linux-32.png) Linux, may be saved to users' `Downloads` folder or `/tmp`:
		1. `gptest-sitepackage.tar.gz` - test framework GeoProcessor (no QGIS)
2. Determine candidate install locations:
	1. ![Cygwin](images/cygwin-32.png) Linux test framework version:
		1. For Cygwin, is typically `/usr/lib/python3.6/site-packages`.
	2. ![Linux](images/linux-32.png) Linux test framework version:
		2. For Debian Linux, is typically `/usr/local/lib/python3.6/dist-packages`.
3. Remove previous installation.  Delete the `geoprocessor` folder from the location determined in the previous step.
4. Install the GeoProcessor package (`geoprocessor` folder and everything included in that folder).
	1. ![Linux](images/linux-32.png) Linux test framework version:
		1. Change to the installation folder and then install the files, for example:  `sudo tar -xzvf ~/Downloads/gptest-site-package.tar.gz` 

### Install GeoProcessor Run Programs for Test Framework ###

A simple script is provided for Windows (`gptest.bat`) and Linux (`gptest.sh`)
to configure the GeoProcessor Python environment and run the GeoProcessor.
The programs should be installed in a location that facilitates running the GeoProcessor.
The Windows `gptest.bat` and Linux `gptest.sh` scripts check for Python 3 on the system (because QGIS and ArcGIS Python are not used).
If the location of the Python interpreter does not match the location in the script,
then the script may need to be edited to specify the actual Python interpreter location.

Potential locations to install the run scripts include:

* Standard GeoProcessor software installation folder, accessed using system menus:
	+ **This is not yet enabled but will be the default when the user interface is implemented.**
* User-defined folder in `PATH`, currently recommended.
	+ ![Linux](images/linux-32.png) Linux user programs, for example: `$HOME/user/bin`
* Run the script manually from wherever it is installed.
* Check the `PATH` environment variable to see what folders are searched to find software, and
copy the programs to one of the folders.  Determine the folders in the path by running the follows command
in a shell:
	+ ![Windows](images/windows-32.png) Windows command shell: `echo %PATH%`
	+ ![Linux](images/linux-32.png) Linux shell window: `echo $PATH`

## Install Additional Python Packages ##

Additional Python packages, listed in the following sections,
are required to run all features of the GeoProcessor.

### QGIS on Windows Version

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
|requests (extended package)|[http://docs.python-requests.org/en/master/](http://docs.python-requests.org/en/master/)<br><br> [https://pypi.org/project/requests/](https://pypi.org/project/requests/)|Downloads data files within the [`WebGet`](../command-ref/WebGet/WebGet) command. <br><br>The `requests[security]` extension package is preferred over the core `requests` package to avoid an error that would occur when downloading a file over `https` with the [`WebGet`](../command-ref/WebGet/WebGet) command. The error that occurred when using the core `requests` package printed:<br>`requests.exceptions.SSLError: [Errno 1] _ssl.c:503: error:140770FC:SSL routines:SSL23_GET_SERVER_HELLO:unknown protocol`. <br>This error does not occur when utilizing the `requests[security]` extension package. | `py -m pip install requests[security]`|

### Linux Test Framework Version ###

To install additional packages on for the Linux test framework version of GeoProcessor:

1. Open a terminal. 
2. Enter the software package `apt-get` command (located in the `apt-get Command` column of the table below).

The following has been tested on Jessian 64-bit Debian Linux.
|**Software Package Name**|**Source Link(s)**|**How Used Within GeoProcessor**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Command**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|-|-|-|-|
|PyQt5|[https://pypi.org/project/PyQt5/](https://pypi.org/project/PyQt5/)|Builds the user interface.|`sudo apt-get install python3-pyqt5`|
|pandas|[https://pandas.pydata.org/](https://pandas.pydata.org/)|Holds and manipulates Table data.|`sudo apt-get install python3-pandas`|
|pip|[https://pypi.org/project/pip/](https://pypi.org/project/pip/)|Installs packages dependent on pip installers.|`sudo apt-get install python3-pip`|
|OpenPyXL|[https://openpyxl.readthedocs.io/en/stable/](https://openpyxl.readthedocs.io/en/stable/)|Reads and writes Excel 2010 xlsx/xlsm files to and from Table objects.|`sudo pip3 install openpyxl`|
|xlwt|[https://pypi.org/project/xlwt/](https://pypi.org/project/xlwt/)|Add compatibility to create spreadsheet files (Microsoft Excel versions 95 to 2003)|`sudo pip3 install xlwt`|

