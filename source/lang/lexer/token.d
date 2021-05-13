module lang.lexer.token;

class Token {
    public string value;
    public string type;
    public int end;

    this(string value, string type, int end){
        this.value = value;
        this.type = type;
        this.end = end;
    }
}