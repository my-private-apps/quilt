import 'package:quilt/lang/position.dart' as position;

class Token {
  dynamic value;
  String type;

  Token(dynamic value, String type){
    this.value = value;
    this.type = type;
  }
}

class LexicalAnalyser {
  String data;
  position.Position pos = position.Position(0);
  List<Token> tokens = [];

  LexicalAnalyser(String data){
    this.data = data;
  }

  List<Token> tokenise() {
    var character = currentCharacter();
    while(character != null){
      if(character == '\n'){
        tokens.add(Token(character, 'NEWLINE'));
      } 

      pos.increment();
      character = currentCharacter();
    }
    return tokens;
  }

  String currentCharacter() {
    if(data.length == pos.position){
      return null;
    } else {
      return data[pos.position];
    }
  }
}