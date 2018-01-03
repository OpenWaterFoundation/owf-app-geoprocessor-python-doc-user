# Learn GeoProcessor / Getting Started #

This page explains how to get started using the GeoProcessor.
It is assumed that the software has been installed as per the [Install GeoProcessor](#install-geoprocessor) documentation.

The following are basic tasks to use the GeoProcessor:

* [Conceptualize a Workflow](#conceptualize-a-workflow)
* [Create a Command File](#create-a-command-file)
* [Run the Command File](#run-the-command-file)

---------------

## Conceptualize a Workflow ##

The GeoProcessor is fundamentally a tool for automating spatial data workflows.
Therefore, to define a workflow, it is necessary to first define what work is to be done.
This effort should result in a conceptual workflow.
It is best to conceptualize the workflow without thinking about software limitations.
For example, the following workflow describes how to ... need an example:

1. Read data.... etc..

## Create a Command File ##

Once the conceptual workflow has been determined, corresponding GeoProcessor
commands can be used to do the work.
Refer to the [Command Reference](../command-ref/overview).
The GeoProcessor can be enhanced to add new commands if necessary (this is likely to occur more often
in the early stages of software development).

The command file can be created with a text editor.
In the future, a graphical user interface will be available to edit and run commands.

See also the [GeoProcessor test repository](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test),
which has simple examples for all commands.

### Best Practices ###

Best practices for creating command files are:

1. Organize data files logically, for example, put data into a `data` folder.
2. Organize process files logically, for example, if multiple command files are used,
consider creating multiple folders, with numbers to cause the folders to sort in sequential order.
3. Use relative paths for file references.
The command file folder will be set as the "working folder" or "working directory" when the command file is read.
All other file locations should be specified relative to that folder.
This will allow the files to be shared with others without having to change file paths.
4. Name GeoProcessor command files with `.gp` file extension.

## Run the Command File ##

The GeoProcessor is run by using the `gp.bat` (Windows) or `gp.sh` (Linux, Cygwin, Git/MinGW Bash) program.
The `gp` program allows running the GeoProcessor in one of the following modes:

* `gp --commands command-file.gp` - process the specified command file in batch mode
* `gp` - start the GeoProcessor command shell.
	+ Then use the command `run command-file.gp` to run a command file.
	+ Specify the location of the command file as an absolute path or relative to the folder
	where the program was started.
	+ Use the `printenv` command to print information including the working folder.
* `gp --ui` - start the user interface (**under development**)

After running, the output files should have been created.
Errors will be indicated in the window and log file.
