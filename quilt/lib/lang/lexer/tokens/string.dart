import 'package:quilt/lang/lexer/character.dart' as char;
import 'package:quilt/lang/lexer.dart' as lexer;
import 'package:quilt/exception/exception.dart' as error;

class QuiltStringLiterals {
  String data;
  int position;

  QuiltStringLiterals(String data, int position) {
    this.data = data;
    this.position = position;
  }

  /// Returns a map of different objects
  /// [position] - The string end position
  /// [token] - The string token
  Map<String, dynamic> createQuiltStrings(String element) {
    var character = char.CurrentCharacter.character(data, position);
    var count = 0;
    var stringdata = '';
    while (character != null) {
      if (character == element) {
        count += 1;
      }

      stringdata += character;

      if (count == 2) {
        break;
      }

      position += 1;
      character = char.CurrentCharacter.character(data, position);
    }

    /// Check some length constraints with specific
    /// [element]s. SingleQuotes can only be used for
    /// strings of length one
    /// Backtiicks is the only element which can be used for
    /// multiline strings
    if (element == "'") {
      if ((stringdata.length - 2) != 1) {
        var length = stringdata.length - 2;
        var exception = error.QuiltException(
            'Single quotes are used for string literals of length one, but got $stringdata of length $length');
        exception.raise(true);
      }
    }

    /// Check if the string contains a newline
    /// and verifies that the [element] in a backticks
    if (stringdata.contains('\n') && element != '`') {
      var exception = error.QuiltException(
          'Multiline strings can only be used with backticks');
      exception.raise(true);
    }

    return <String, dynamic>{
      'position': position,
      'token': lexer.Token(stringdata, 'STRING')
    };
  }
}
