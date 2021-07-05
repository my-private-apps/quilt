import 'package:quilt/exception/exception.dart';
import 'package:quilt/lang/lexer.dart';
import 'package:quilt/lang/variables.dart';

class Parser {
  List<Token> tokens;
  Variables variables = Variables();

  Parser(List<Token> tokens) {
    this.tokens = tokens;
  }

  void parse() {
    for (var index = 0; index < tokens.length; index++) {
      var token = tokens[index];
      if (token.type == 'ASSIGN') {
        var previous = index == 0 ? null : tokens[index - 1];
        dynamic muted = index < 2 ? null : tokens[index - 2];
        var value = index + 1 == tokens.length ? null : tokens[index + 1];
        if (value == null || previous == null) {
          QuiltException('Value not specified').raise(true);
        }
        muted = muted == null ? false : muted.value == 'mut';
        variables.add(previous.value, value, muted);
      }
    }
    print(variables.variables);
  }
}
