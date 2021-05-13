module lang.lexer.position;

// Get the current character based on
// the current position
char currentCharacter(string data, int position){
    if(data.length == position){
        return '\x08';
    } else {
        return data[position];
    }
}

class Position
{
    public int position;

    this(int position = 0)
    {
        this.position = position;
    }

    public int increment(int margin = 1)
    {
        this.position += margin;
        return this.position;
    }

    public int decrement(int margin = 1)
    {
        this.position += -margin;
        return this.position;
    }
}
