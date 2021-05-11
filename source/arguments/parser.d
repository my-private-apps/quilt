module arguments.parser;

import std.stdio;
import utils.string;

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

        this.createArgumentParser(this.arguments);
    }

    private int createArgumentParser(string[] arguments) {
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

            bool isValidCommand = StringUtilities.startsWith(current, "--");
            if(!isValidCommand){
                throw new Exception(current, " is not a valid argument");
            }

            this.position += 1;
            current = this.currentCharacter();
        }

        writeln(command, parameters);
        return 0;
    }

    private string currentCharacter() {
        if(this.length == this.position){
            return null;
        } else {
            return this.arguments[this.position];
        }
    }
}