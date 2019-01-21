# GeoProcessor / Best Practices / Command Files

Best practices for command files are:

1. Document command files with sufficient comments.
2. Consider using version control, such as Git/GitHub, to track changes to command files.
3. Organize data files logically, for example, put data into a `data` folder.
4. Organize process files logically, for example, if multiple command files are used,
consider creating multiple folders, with numbers to cause the folders to sort in sequential order.
5. Use relative paths for file references, for example `data/somefile` and `../data/somefile`.
The command file folder will be set as the working folder (working directory) when the command file is read.
All other file locations should be specified relative to that folder.
This allows the files to be shared with others without having to change file paths.
6. Name GeoProcessor command files with `.gp` file extension.
7. Use the [`StartLog`](../command-ref/StartLog/StartLog.md) command to troubleshoot.
This creates a local log file that is managed with command file and related files.
The command can be commented out if it significantly slows down processing or creates a large log file.
The name of the log file should be the same as the command file, with `.log` appended (or a similar convention).
