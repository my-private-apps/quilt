module lang.lexer.token;

struct Token {
    private string value;
    private string tokenType;
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