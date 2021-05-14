import 'package:quilt/exception/exception.dart' as error;

class QuiltArgumentParser {
  int position = 0;
  List<String> arguments;

  QuiltArgumentParser(List<String> arguments){
    this.arguments = arguments;
  }

  void create() {
    var cli = [];
    var enabled = false;
    String command;
    var params = Map<String, String>();

    var character = currentCharacter();
    while(character != '\n') {
      if(position == 0){
        command = character;
        position += 1;
        character = currentCharacter();
        continue;
      }

      if(enabled){
        cli.add(character);
        position += 1;
        character = currentCharacter();
        continue;
      }

      if(character == '--'){
        enabled = true;
        position += 1;
        character = currentCharacter();
        continue;
      }

      if(character == '\n'){ break; }

      if(!character.startsWith('--')){
        var exception = error.QuiltException('$character not a valid argument');
        exception.raise(true);
      }

      var data = character.split('=');
      if(data.length < 2) {
        var exception = error.QuiltException('Lacking characters after or before =');
        exception.raise(true);
      }

      var key = data[0];
      data = data.sublist(1, data.length);
      params[key.toString()] = data.join('=');

      position += 1;
      character = currentCharacter();
    }

    print('$command, $params $cli');
  }

  String currentCharacter() {
    if(position == arguments.length){
      return '\n';
    } else {
      return arguments[position];
    }
  }
}