import 'package:quilt/lang/lexer.dart';

class Variables {
  dynamic variables = {};

  void add(String name, Token value, bool muted){
    variables[name] = {'token':value, 'muted':muted};
  }
}