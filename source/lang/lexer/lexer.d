module lang.lexer.lexer;

import std.stdio;

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

    private Token[] tokenise() {
        string current = cast(string) this.currentCharacter();
        while(current !is null){
            if(current == "\n"){
                this.tokens ~= Token(current, "NEWLINE", this.position.position);
            }
            this.position.increment(1);
            current = this.currentCharacter();
        }
        return this.tokens;
    }

    private string currentCharacter(){
        if(this.position.position == this.data.length){
            return null;
        } else {
            char character = this.data[this.position.position];
            return cast(string) character;
        }
    }
}