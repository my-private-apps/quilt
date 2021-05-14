import 'dart:io';
import 'package:quilt/lang/lexer.dart' as lexer;

abstract class QuiltRepl {
  static void create() {
    var exit = false;
    while(!exit){
      stdout.write('> ');
      var data = stdin.readLineSync();
      if(data == '.exit'){
        exit = true;
      }
      
      var tokens = lexer.LexicalAnalyser('$data\n').tokenise();
      tokens.forEach((element) {
          print(element.value + ' ' + element.type);
      });
    }
  }
}