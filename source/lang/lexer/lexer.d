module lang.lexer.lexer;

import std.stdio;
import std.conv;

import lang.lexer.position;
import lang.lexer.token;
import utils.arrays;
import lang.lexer.tokens.number;

const char[] digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];

class QuiltLexer
{
    private string data;
    private Position position = new Position(0);
    private int line = 1;
    private Token[] tokens;

    this(string data)
    {
        this.data = data;
    }

    // Tokenise the string into different lexer
    // tokens which can be used for evaluation
    public Token[] tokenise()
    {
        char current = this.currentCharacter();
        // Keep on checking for characters
        // until the end of the file
        while (current !is '\x08')
        {
            writeln(current);
            if (current == '\n')
            {
                string character = "" ~ current;
                this.tokens ~= new Token(character, "NEWLINE", this.position.position);
            }
            else if (ArrayUtilities.contains!char(digits, current))
            {
                Numbers number = new Numbers(this.data, this.position.position);
                NumberToken!double data = number.createNumber();
                this.tokens ~= new Token(to!string(data.number), "NUMBER", data.position);
                this.position = new Position(data.position);
            }
            this.position.increment(1);
            current = this.currentCharacter();
        }

        writeln(this.tokens.length);
        return this.tokens;
    }

    // get the element at the current index in
    // the iterable
    private char currentCharacter()
    {
        if (this.position.position == this.data.length)
        {
            return '\x08';
        }
        char character = this.data[this.position.position];
        return character;
    }
}
