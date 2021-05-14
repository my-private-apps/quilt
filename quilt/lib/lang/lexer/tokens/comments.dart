import 'package:quilt/lang/lexer/character.dart' as char;

class QuiltComments {
  String data;
  int position;

  QuiltComments(String data, int position){
    this.data = data;
    this.position = position;
  }

  int createQuiltComments() {
    var character = char.CurrentCharacter.character(data, position);
    while(character != null){
      if(character == '\n') {
        break;
      }
      position += 1;
      character = char.CurrentCharacter.character(data, position);
    }
    return position;
  }
}