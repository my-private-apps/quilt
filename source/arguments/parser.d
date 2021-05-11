module arguments.parser;

import std.stdio;
import std.string;
import std.stdio;
import std.array;

import utils.string;
import error.error;

class ArgumentParseResults {
    public immutable string command;
    public string[string] params;
    public string[] arguments;

    this(string command, string[string] parameters, string[] args){
        this.command = command;
        this.params = parameters;
        this.arguments = args;
    }
}

class ArgumentParser {
    // the command line arguments
    private string[] arguments;
    private int length;

    // the argument parser position
    private int position = 0;

    // The constructor for the argument parser
    // the argument parser function takes in
    // a set of arguments which is parsed and
    // executed accordingly
    this(string[] arguments){
        this.arguments = arguments;
        this.length = cast(int) this.arguments.length;

        ArgumentParseResults results =  this.createArgumentParser(this.arguments);
        writeln(results.params, results.arguments);
    }

    private ArgumentParseResults createArgumentParser(string[] arguments) {
        string[] args = [];
        bool argsEnabled = false;
        string current = this.currentCharacter();
        string[string] parameters;
        string command;

        while(current !is null){
            // If the posiition is 0 or if the current
            // character is the executable name, skip the
            // argument and go to the next
            if(this.position == 0){
                this.position += 1; 
                current = this.currentCharacter();
                continue;
            }

            if(this.position == 1){
                command = current;
                this.position += 1;
                current = this.currentCharacter();
                continue;
            }

            if(argsEnabled){
                args ~= current;
                this.position += 1;
                current = this.currentCharacter();
                continue;
            }

            if(current == "--"){
                argsEnabled = true;
                this.position += 1;
                current = this.currentCharacter();
                continue;
            }

            // Checks if the command starts with double
            // hiphens(-)
            immutable bool isValidCommand = StringUtilities.startsWith(current, "--");
            if(!isValidCommand){
                throw new Exception(current~" is not a valid argument");
            }

            string[] data = current.split("=");
            if(data.length !is 2){
                QuiltException error = new QuiltException("Unexpected argument parameter", true);
            }

            parameters[data[0]] = data[1];

            this.position += 1;
            current = this.currentCharacter();
        }

        return new ArgumentParseResults(command, parameters, args);
    }

    private string currentCharacter() {
        if(this.length == this.position){
            return null;
        } else {
            return this.arguments[this.position];
        }
    }
}