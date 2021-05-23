import 'package:quilt/lang/lexer/tokens/identifier.dart' as identifier;
import 'package:quilt/lang/position.dart' as position;
import 'package:quilt/exception/exception.dart' as error;
import 'package:quilt/lang/lexer/tokens/comments.dart' as comments;
import 'package:quilt/lang/lexer/tokens/string.dart' as strings;

const digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '_'];

List<dynamic> validTokenCharacters() {
  var tokens = [];
  var character_a = 'A'.codeUnitAt(0);
  var character_z = 'Z'.codeUnitAt(0);
  for(var index=character_a; index <= character_z; index++) {
    tokens.add(String.fromCharCode(index));
  }

  
  character_a = 'a'.codeUnitAt(0);
  character_z = 'z'.codeUnitAt(0);
  for(var index=character_a; index <= character_z; index++) {
    tokens.add(String.fromCharCode(index));
  }

  tokens += digits;
  tokens.remove('.');
  return tokens;
}

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
      if (character == '\n') {
        tokens.add(Token(character, 'NEWLINE'));
      } else if (digits.contains(character) && character != '_') {
        var token = createNumbers();
        tokens.add(token);
      } else if (character == '#') {
        pos.position =
            comments.QuiltComments(data, pos.position).createQuiltComments();
      } else if (['"', "'", '`'].contains(character)) {
        var stringdata = strings.QuiltStringLiterals(data, pos.position)
            .createQuiltStrings(character);
        pos.position = stringdata['position'];
        tokens.add(stringdata['token']);
      } else if (validTokenCharacters().contains(character)) {
        var createIdentifer = identifier.Identifier(data, pos.position);
        var token = createIdentifer.createIdentifier();
        tokens.add(Token(token.identifierName, 'NAME'));
        pos.position = token.position;
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

    // if (numberString.endsWith('_')) {
    //   print(pos.position);
    //   var exception = error.QuiltException('Invalid token $numberString');
    //   exception.raise(true);
    // }

    if (numberString.startsWith('_')) {
      return Token(numberString, 'NAME');
    }

    return Token(numberString, 'NUMBER');
  }
}
