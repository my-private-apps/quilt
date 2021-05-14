import 'package:quilt/arguments/parser.dart' as quilt;

void main(List<String> arguments) {
  var parser = quilt.QuiltArgumentParser(arguments);
  parser.create();
}
