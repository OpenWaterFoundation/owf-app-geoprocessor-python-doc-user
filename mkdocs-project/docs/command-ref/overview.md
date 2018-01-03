# Learn GeoProcessor / Command Reference / Overview #

This reference section of the documentation provides information about commands that are provided
by the GeoProcessor, as listed below.

* [Command Overview](#command-overview)
* [Commands for Processing Spatial Data Layers](#commands-for-processing-spatial-data-layers)
* [Commands to Control Running](#commands-to-control-running)
* [Commands for Handling Files](#commands-for-handling-files)
* [Commands for Messages and Logging](#commands-for-messages-and-logging)
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

* Need to add

## Commands to Control Running ##

* [\# comment](HashComment/HashComment) - single line comment
* [/\* comment block start](CommentBlockStart/CommentBlockStart) - start of multi-line comment block
* [\*/ comment block end](CommentBlockEnd/CommentBlockEnd) - end of multi-line comment block
* [EndIf](EndIf/EndIf) - indicate the end of an `If` block
* [EndFor](EndFor/EndFor) - indicate the end of a `For` block
* [For](For/For) - indicate the start of a `For` block
* [If](If/If) - indicate the start of an `If` block
* [SetProperty](SetProperty/SetProperty) - set a GeoProcessor property

## Commands for Handling Files ##

* [CopyFile](CopyFile/CopyFile) - copy a file to a new file
* [RemoveFile](RemoveFile/RemoveFile) - remove a file

## Commands for Messages and Logging ##

* [Message](Message/Message) - print a message to the log file
* [StartLog](StartLog/StartLog) - start a new log file

## Utility Commands ##

* [BlankCommand](BlankCommand/BlankCommand) - used for blank lines
* [UnknownCommand](UnknownCommand/UnknownCommand) - used when the command is not recognized
