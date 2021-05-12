module lang.lexer.lexer;

import std.stdio;

import lang.lexer.position;
import lang.lexer.token;
import utils.arrays;

const char[] digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

class QuiltLexer {
    private string data;
    private Position position = new Position(0);
    private int line = 1;
    private Token[] tokens;

    this(string data){
        this.data = data;
    }

    // Tokenise the string into different lexer
    // tokens which can be used for evaluation
    public Token[] tokenise() {
        char current = this.currentCharacter();
        // Keep on checking for characters
        // until the end of the file
        while(current !is '\x08'){
            writeln(current);
            if(current == '\n'){
                const tokenString = "" ~ current;
                this.tokens ~= Token(tokenString, "NEWLINE", this.position.position);
            } else if(ArrayUtilities.contains!char(digits, current)){
               
            }
            this.position.increment(1);
            current = this.currentCharacter();
        }

        writeln(this.tokens.length);
        return this.tokens;
    }

    // get the element at the current index in
    // the iterable
    private char currentCharacter(){
        if(this.position.position == this.data.length){
            return '\x08';
        } 
        char character = this.data[this.position.position];
        return character;
    }
}