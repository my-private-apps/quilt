module lang.run.run;

import std.stdio;
import std.file;

import error.error;
import lang.lexer.lexer;

class QuitRunCommand {
    private string[string] parameters;
    private string[] arguments;

    this(string[string] params, string[] arguments){
        this.parameters = params;
        this.arguments = arguments;

        immutable string filename = this.findFilename(this.parameters);
        if(filename){
            this.run(filename);
        }
    }

    private string findFilename(string[string] params){
        return this.parameters.get("--file", null);
    }

    private void run(immutable string filename){
        immutable bool exists = filename.exists;
        if(exists){
            if(filename.isFile){
                File file = File(filename, "r");
                string source = file.readln();
                file.close();

                QuiltLexer lexer = new QuiltLexer(source);
                writeln(lexer.tokenise());
            } else {
                QuiltException error = new QuiltException(filename ~ " is not a file", true);
            }
        } else {
            QuiltException error = new QuiltException(filename ~ " does not exist", true);
        }
    }
}