# GeoProcessor / Running / Command Line (Batch) #

The GeoProcessor can be run from the command line in batch modes, which facilitates batch product generation,
automated testing, and other automated workflow processes.
The following are considerations specific to this variant:

*   Run in batch mode using a command line: `gp --commands command-file.gp`
*   The folder for the command file is set as the working directory (working folder),
    which is used to convert relative paths in commands to absolute paths.
