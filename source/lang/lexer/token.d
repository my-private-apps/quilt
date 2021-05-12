module lang.lexer.token;

struct Token {
    // The value of the token
    // value = 4, 5, 6 etc
    private string value;

    // Type of the token
    // Keyword, Number, Strings etc
    private string tokenType;

    // The starting position of token
    private int position;

    public string getValue() {
        return this.value;
    }

    public string type(){
        return this.tokenType;
    }

    public int getPos(){
        return this.position;
    }
}