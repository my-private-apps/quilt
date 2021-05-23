import 'package:quilt/run/run.dart' as run;
import 'package:quilt/repl/repl.dart' as repl;

/// Perform actions based on the command
/// [command] The command
/// [params] The flags with associated values
/// [cli] The command line arguments
void performCommand(
    String command, Map<String, String> params, List<dynamic> cli) {
  if (command == 'run') {
    var app = run.QuiltRunCommand(params, cli);
    app.run();
  } else if (command == 'repl') {
    var cli = repl.QuiltRepl.create();
  }
}
