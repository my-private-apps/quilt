import 'package:quilt/run/run.dart' as run;

void performCommand(String command, Map<String, String> params, List<dynamic> cli) {
  if(command == 'run'){
    var app = run.QuiltRunCommand(params, cli);
    app.run();
  }
}