# GeoProcessor / Running / Command Line (Interpreter) #

The GeoProcessor can be run from the command line as an interpreter,
which is helpful to guide the user in selecting appropriate options.
The following are considerations specific to this variant.

* When the interpreter is run, the prompt `gp> ` is shown on the command line until the interpreter is exited.
* The interpreter is the default run mode when `gp` is run without `--ui` or `--commands commandFile`.

The following interpreter commands are recognized:

| **Interpreter Command** | **Type**    | **Description** |
| ----------------------- | ----------- | --------------- |
| `exit`                  | Control     | Exit the interpreter. |
| `help`                  | Information | Print interpreter commands that are available. |
| `run command-file.gp`   | Run mode    | Run a command file. |
| `printenv`              | Information | Print information including the working folder. |
| `ui`                    | Run mode    | Start the user interface. |
