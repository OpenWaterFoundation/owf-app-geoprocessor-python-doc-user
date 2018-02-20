# Learn GeoProcessor / Getting Started #

This page explains how to get started using the GeoProcessor.
It is assumed that the software has been installed as per the [Install GeoProcessor](install) documentation.

The following are basic tasks to use the GeoProcessor:

* [Conceptualize a Workflow](#conceptualize-a-workflow)
* [Create a Command File](#create-a-command-file)
	+ [Best Practices](#best-practices)
* [Run the Command File](#run-the-command-file)

---------------

## Conceptualize a Workflow ##

The GeoProcessor is fundamentally a tool for automating spatial data workflows.
Therefore, to define a workflow, it is necessary to first define what work is to be done.
This effort should result in a conceptual workflow.
It is best to conceptualize the workflow without thinking about software limitations.
For example, the following workflow describes a common task:

1. Read in a GeoLayer from a shapefile.
2. Define a region for clipping (state boundary extent).
3. Clip the layer to the region.
4. Write the clipped GeoLayer to a new format, for example GeoJSON.

## Create a Command File ##

Once the conceptual workflow has been determined, corresponding GeoProcessor
commands can be used to do the work.
Refer to the [Command Reference](../command-ref/overview).
The GeoProcessor will continue to be enhanced to add new commands as necessary.

The command file can be created with a text editor.
In the future, a graphical user interface will be available to edit and run commands.

See also the [GeoProcessor test repository](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test),
which has simple examples for all commands.

### Best Practices ###

Best practices for command files are:

1. Document command files with sufficient comments.
2. Consider using version control, such as GitHub to track changes to command files.
3. Organize data files logically, for example, put data into a `data` folder.
4. Organize process files logically, for example, if multiple command files are used,
consider creating multiple folders, with numbers to cause the folders to sort in sequential order.
5. Use relative paths for file references.
The command file folder will be set as the working folder (working directory) when the command file is read.
All other file locations should be specified relative to that folder.
This will allow the files to be shared with others without having to change file paths.
6. Name GeoProcessor command files with `.gp` file extension.
7. Use the [`StartLog`](command-ref/StartLog/StartLog) command to troubleshoot.

## Run the Command File ##

The GeoProcessor is run by using the `gp.bat` (Windows) or `gp.sh` (Linux, Cygwin, Git/MinGW Bash) program.
Run from a command shell.
The `gp` program allows running the GeoProcessor in one of the following modes:

* Batch/automated mode: `gp --commands command-file.gp`
	+ The folder for the command file is set as the working directory (working folder),
	from which relative paths in command files refer.
* Interactive command shell: `gp`
	+ Then use the command `run command-file.gp` to run a command file.
	+ Specify the location of the command file as an absolute path or relative to the folder
	where the program was started.
	+ Use the `printenv` command to print information including the working folder.
* Interactive user interface (UI):  `gp --ui`
	+ **under development**

After running successfully, the output files should have been created.
Errors will be indicated:

* in the command shell window
* the log file created by the [`StartLog`](command-ref/StartLog/StartLog) command
* the default log file found in the `.owf-gp/log` folder (closed when the [`StartLog`](command-ref/StartLog/StartLog) command is run)
