import 'package:quilt/run/run.dart' as run;

/// Perform actions based on the command
/// [command] The command
/// [params] The flags with associated values
/// [cli] The command line arguments
void performCommand(
    String command, Map<String, String> params, List<dynamic> cli) {
  if (command == 'run') {
    var app = run.QuiltRunCommand(params, cli);
    app.run();
  }
}
