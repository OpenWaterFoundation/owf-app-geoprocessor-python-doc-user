# Learn GeoProcessor / Command Reference / Overview #

This reference section of the documentation provides information about commands that are provided
by the GeoProcessor, as listed below.

* [Command Overview](#command-overview)
* [Commands for Processing Spatial Data Layers](#commands-for-processing-spatial-data-layers)
* [Commands to Control Running](#commands-to-control-running)
* [Commands for Handling Files](#commands-for-handling-files)
* [Commands for Messages and Logging](#commands-for-messages-and-logging)
* [Commands for Testing](#commands-for-testing)
* [Utility Commands](#utility-commands)

---------------------------

## Command Overview ##

GeoProcessor command files contain a list of commands, one command per line.
These commands are processed in sequence from top to bottom.
`For` and `If` control commands, if present, will cause execution order to jump over commands.

Each command adheres to the syntax:

```text
CommandName(ParameterName1="ParameterValue1",ParameterName2="ParameterValue2",...)
```

The following are guidelines for commands:

1. Commands always follow the convention of command name at start with a list of named parameters in parentheses.
The only exceptions are:
	1. Comments starting with `#`.
	2. Block comments `/*` and `*/` that surround one or more command lines.
	3. Command such as `Exit`, which will always have empty list of parameters in the parentheses.
2. Commands are (currently) case-specific.  This may be relaxed in the future.
3. Command and parameter names use mixed case where the first letter of each word is capitalized.
4. Parameter values must generally be surrounded by double quotes, regardless of type.
This convention may be relaxed in the future.
5. Each command must exist on a single line.
6. Spaces at the front of a command for indentation are allowed to improve logic presentation,
such as code levels for `For` and `If` blocks.
Tabs used for indentation are discouraged and may be prohibited in the future because tab width is ambiguous between different users and tools.
7. Blank lines are allowed and will be handled as `BlankCommand` commands.
8. Unknown commands are handled as `UnknownCommand` commands.

## Commands for Processing Spatial Data Layers ##

* [AddGeoLayerAttribute](AddGeoLayerAttribute/AddGeoLayerAttribute) - add an attribute to a GeoLayer
* [ClipGeoLayer](ClipGeoLayer/ClipGeoLayer) - clip a GeoLayer by the boundary of another GeoLayer 
* [CopyGeoLayer](CopyGeoLayer/CopyGeoLayer) - copy a GeoLayer to a new GeoLayer
* [CreateGeoLayer](CreateGeoLayer/CreateGeoLayer) - create a GeoLayer 
* [FreeGeoLayer](FreeGeoLayer/FreeGeoLayer) - remove a GeoLayer from the GeoProcessor
* [MergeGeoLayers](MergeGeoLayers/MergeGeoLayers) - merge multiple GeoLayers into one GeoLayer
* [ReadGeoLayerFromDelimitedFile](ReadGeoLayerFromDelimitedFile/ReadGeoLayerFromDelimitedFile) - read a GeoLayer from a file in delimited file format
* [ReadGeoLayerFromGeoJSON](ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) - read a GeoLayer from a file in GeoJSON format
* [ReadGeoLayerFromShapefile](ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile) - read a GeoLayer from a file in Shapefile format
* [ReadGeoLayersFromFGDB](ReadGeoLayersFromFGDB/ReadGeoLayersFromFGDB) - read GeoLayers from a file geodatabase
* [ReadGeoLayersFromFolder](ReadGeoLayersFromFolder/ReadGeoLayersFromFolder) - read GeoLayers from a folder
* [RemoveGeoLayerAttributes](RemoveGeoLayerAttributes/RemoveGeoLayerAttributes) - remove one or more attributes from a GeoLayer
* [RenameGeoLayerAttribute](RenameGeoLayerAttribute/RenameGeoLayerAttribute) - rename a GeoLayer's attribute
* [SetGeoLayerCRS](SetGeoLayerCRS/SetGeoLayerCRS) - sets a GeoLayer's coordinate reference system
* [SetGeoLayerProperty](SetGeoLayerProperty/SetGeoLayerProperty) - set a GeoGeoLayer property
* [SimplifyGeoLayerGeometry](SimplifyGeoLayerGeometry/SimplifyGeoLayerGeometry) - decreases the verticies in a polygon or line GeoLayer 
* [WriteGeoLayerToDelimitedFile](WriteGeoLayerToDelimitedFile/WriteGeoLayerToDelimitedFile) - write GeoLayer to a file in delimited file format
* [WriteGeoLayerToGeoJSON](WriteGeoLayerToGeoJSON/WriteGeoLayerToGeoJSON) - write GeoLayer to a file in GeoJSON format
* [WriteGeoLayerToShapefile](WriteGeoLayerToShapefile/WriteGeoLayerToShapefile) - write GeoLayer to a file in Shapefile format

## Commands to Control Running ##

* [\# comment](HashComment/HashComment) - single line comment
* [/\* comment block start](CommentBlockStart/CommentBlockStart) - start of multi-line comment block
* [\*/ comment block end](CommentBlockEnd/CommentBlockEnd) - end of multi-line comment block
* [EndIf](EndIf/EndIf) - indicate the end of an `If` block
* [EndFor](EndFor/EndFor) - indicate the end of a `For` block
* [For](For/For) - indicate the start of a `For` block
* [If](If/If) - indicate the start of an `If` block
* [RunCommands](RunCommands/RunCommands) - run a command file, useful to automate running all tests or a multi-step workflow
* [RunProgram](RunProgram/RunProgram) - run a program
* [SetProperty](SetProperty/SetProperty) - set a GeoProcessor property
* [SetPropertyFromGeoLayer](SetPropertyFromGeoLayer/SetPropertyFromGeoLayer) - set a GeoProcessor property from a GeoLayer property

## Commands for Handling Files ##

* [CopyFile](CopyFile/CopyFile) - copy a file to a new file
* [RemoveFile](RemoveFile/RemoveFile) - remove a file
* [WebGet](WebGet/WebGet) - download a file from URL

## Commands for Messages and Logging ##

* [Message](Message/Message) - print a message to the log file
* [StartLog](StartLog/StartLog) - start a new log file

## Commands for Testing ##

* [CompareFiles](CompareFiles/CompareFiles) - compare files and optionally warn/fail if different/same
* [CreateRegressionTestCommandFile](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile) - create a master command file to automate running all tests
* [RunCommands](RunCommands/RunCommands) - used when running a test suite
* [StartRegressionTestResultsReport](StartRegressionTestResultsReport/StartRegressionTestResultsReport) - start (open) a file to receive regression test results
* [WriteCommandSummaryToFile](WriteCommandSummaryToFile/WriteCommandSummaryToFile) - write a summary of command log messages to a file
* [WriteGeoLayerPropertiesToFile](WriteGeoLayerPropertiesToFile/WriteGeoLayerPropertiesToFile) - write GeoLayer properties to file
* [WritePropertiesToFile](WritePropertiesToFile/WritePropertiesToFile) - write properties to file

## Utility Commands ##

* [# Comment](Comment/Comment) - single line comments
* [Blank](Blank/Blank) - used for blank lines
* [UnknownCommand](UnknownCommand/UnknownCommand) - used when the command is not recognized
