import 'package:quilt/lang/position.dart' as position;
import 'package:quilt/exception/exception.dart' as error;
import 'package:quilt/lang/lexer/tokens/comments.dart' as comments;

const digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '_'];

class Token {
  dynamic value;
  String type;

  Token(dynamic value, String type) {
    this.value = value;
    this.type = type;
  }
}

class LexicalAnalyser {
  String data;
  position.Position pos = position.Position(0);
  List<Token> tokens = [];

  LexicalAnalyser(String data) {
    this.data = data;
  }

  List<Token> tokenise() {
    var character = currentCharacter();
    while (character != null) {
      print(character);
      if (character == '\n') {
        tokens.add(Token(character, 'NEWLINE'));
      } else if (digits.contains(character)) {
        var token = createNumbers();
        print(token.value);
        tokens.add(token);
      } else if(character == '#'){
        pos.position = comments.QuiltComments(data, pos.position).createQuiltComments();
      }

      pos.increment();
      character = currentCharacter();
    }
    return tokens;
  }

  String currentCharacter() {
    if (data.length == pos.position) {
      return null;
    } else {
      return data[pos.position];
    }
  }

  Token createNumbers() {
    var numberString = '';
    var character = currentCharacter();
    var dots = 0;

    while (character != null && digits.contains(character)) {
      numberString += character;
      if (character == '.') {
        dots += 1;
      }
      pos.increment();
      character = currentCharacter();
    }
    if (dots > 1) {
      var exception = error.QuiltException(
          '$numberString contains more than one decimal points');
      exception.raise(true);
    }

    if (numberString.startsWith('.')) {
      numberString = '0' + numberString;
    }
    if (numberString.endsWith('.')) {
      numberString += '0';
    }

    if(numberString.endsWith('_')){
      var exception = error.QuiltException('Invalid token $numberString');
      exception.raise(true);
    }
    
    if(numberString.startsWith('_')){
      return Token(numberString, 'NAME');
    }

    return Token(numberString, 'NUMBER');
  }
}
