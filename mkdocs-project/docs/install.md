# Learn GeoProcessor / Install GeoProcessor #

The GeoProcess installation requires that the following components are installed:

* [Install QGIS](#install-qgis)
* [Install Python (Optional)](#install-python-optional)
* [Install GeoProcessor](#install-geoprocessor)

----------------------

## Install QGIS ##

The GeoProcessor installation requires that QGIS is installed.
See the [Resources](resources#QGIS) information for how to install QGIS.
It is recommended that QGIS be installed in the default location to minimize configuration issues.

## Install Python (Optional) ##

The GeoProcessor requires Python 2.7+.
The `gp` program (see next section) that runs the GeoProcessor typically uses the Python distributed with QGIS.

In the future the GeoProcessor may be distributed with a Python virtual environment.
However, this is currently not done because of dependence on the QGIS installation.

## Install GeoProcessor ##

The GeoProcessor installation does not currently use the standard Python `pip` or `pipenv`
installation tools (this will be implemented in the future).
Currently a manual installation process is used:

* The `gp-site-package.tar.gz` file contains the `geoprocessor` folder, which provides all GeoProcessor functionality.
	+ To install, locate the `site-packages` folder used by QGIS Python.
	For QGIS 2.18 (or similar), this may be `C:\OSGeo4W64\apps\Python27\Lib\site-packages`.
	+ Open a Linux shell such as Cygwin terminal, Git Bash, etc.
	+ `cd` to the `site-packages` folder determined above.
	+ If necessary, remove the previous `geoprocessor` folder (from previous version installation):  `rm -rf geoprocessor`
	+ List the contents of the GeoProcessor distribution, to confirm understanding of
	contents (`-t` means list the file contents):  `tar -tzvf /path/to/gp-site-package.tar.gz`.
	+ Install the contents of the GeoProcessor distribution (`-x` means extract the files):  `tar -xzvf /path/to/gp-site-package.tar.gz`.
* The `gp.bat` file is used to run the GeoProcessor by running Python with the geoprocessor module
and needs to be installed somewhere appropriate.
	+ The script assumes a location for the QGIS install and its embedded Python.
	If the location of the QGIS installation does not match the script it may need to be edited.
	+ The QGIS Python will locate the `gp.py` file by specifying the `-m geoprocessor.app.gp` command parameter.
	If the GeoProcessor was installed in the `site-packages` folder as described above,
	the GeoProcessor software will be found and will run.
