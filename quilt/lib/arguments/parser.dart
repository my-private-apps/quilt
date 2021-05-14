
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
    Map<String, String> params;

    var character = currentCharacter();
    while(character != null) {
      if(position == 0){
        command = character;
        position += 1;
        character = currentCharacter();
      }

      if(enabled){
        cli.add(character);
        position += 1;
        character = currentCharacter();
      }

      if(character == '--'){
        enabled = true;
        position += 1;
        character = currentCharacter();
      }

      var isValidCommand = character.startsWith('--');

      position += 1;
      character = currentCharacter();
    }
  }

  String currentCharacter() {
    if(position == arguments.length){
      return null;
    } else {
      return arguments[position];
    }
  }
}