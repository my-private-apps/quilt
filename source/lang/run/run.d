module lang.run.run;

import std.stdio;

class QuitRunCommand {
    private string[string] parameters;
    private string[] arguments;

    this(string[string] params, string[] arguments){
        this.parameters = params;
        this.arguments = arguments;
        writeln(this.findFilename(this.parameters));
    }

    private string findFilename(string[string] params){
        return this.parameters.get("--file", null);
    }
}