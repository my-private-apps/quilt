module arguments.parser;

import std.stdio;

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

        while(current !is null){
            writeln(current);

            this.position += 1;
            current = this.currentCharacter();
        }
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