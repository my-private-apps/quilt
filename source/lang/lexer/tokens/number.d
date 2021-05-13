module lang.lexer.tokens.number;

import std.stdio;
import std.conv;

import lang.lexer.position;
import lang.lexer.token;
import lang.lexer.lexer;
import utils.arrays;
import utils.string;
import error.error;

class NumberToken(NumberType){
    public NumberType number;
    public int position;

    this(NumberType number, int position){
        this.number = number;
        this.position = position;
    }
}

class Numbers {
    private string data;
    private int position;

    this(string data, int position){
        this.data = data;
        this.position = position;
    }

    public NumberToken!double createNumber() {
        char character = currentCharacter(this.data, this.position);
        string numberString = "";

        while (character !is '\x08' && ArrayUtilities.contains!char(digits, character)){
            numberString ~= character;
            this.position += 1;
            character = currentCharacter(this.data, this.position);
        }

        if(numberString.length > 0){
            if(numberString[0] == '.'){
                numberString = '0' ~ numberString;
            }

            if(numberString[numberString.length-1] == '.'){
                numberString ~= '0';
            }
        }

        int points = StringUtilities.count(numberString, '.');
        if(points > 1){
            QuiltException error = new QuiltException(to!string(points) ~ " decimal points in " ~ numberString, true);
        }

        return new NumberToken!double(to!double(numberString), this.position);
    }
}
// currentCharacter