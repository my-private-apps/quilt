import 'package:quilt/lang/lexer/character.dart' as char;
import 'package:quilt/lang/lexer.dart' as lexer;
import 'package:quilt/exception/exception.dart' as error;

bool isIdentifierKeyword(String identifier) {
  var keyword = [];
  return keyword.contains(identifier);
}

class IdentifierToken {
  String identifierName;
  int position;

  IdentifierToken(String name, int pos) {
    identifierName = name;
    position = pos;
  }
}

class Identifier {
  String _data;
  int _position;

  Identifier(String data, int position) {
    _data = data;
    _position = position;
  }

  IdentifierToken createIdentifier() {
    var character = char.CurrentCharacter.character(_data, _position);
    var valid = lexer.validTokenCharacters();
    var identifierName = '';
    while(character != null){
      // if(character == ' ') break;
      if (!valid.contains(character)) {
        break;
      }

      identifierName += character;
      _position += 1;
      character = char.CurrentCharacter.character(_data, _position);
    }

    if(identifierName.isEmpty) {
      error.QuiltException('Identifer name cannot be empty').raise(true);
    }

    return IdentifierToken(identifierName, _position);
  }
}