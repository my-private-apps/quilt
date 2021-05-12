module lang.lexer.position;

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
