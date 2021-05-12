module lang.lexer.lexer;

import std.stdio;
import core.stdc.stdlib;

import lang.lexer.position;
import lang.lexer.token;

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
        while(current){
            if(current == '\n'){
                const tokenString = "" ~ current;
                this.tokens ~= Token(tokenString, "NEWLINE", this.position.position);
            }
            this.position.increment(1);
            current = this.currentCharacter();
        }
        return this.tokens;
    }

    // get the element at the current index in
    // the iterable
    private char currentCharacter(){
        if(this.position.position == this.data.length){
            exit(0);
        } 
        char character = this.data[this.position.position];
        return character;
    }
}