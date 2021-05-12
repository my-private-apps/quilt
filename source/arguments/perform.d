module arguments.perform;

import lang.run.run;

void performCommandActions(string command, string[string] params, string[] arguments){
    if(command == "run"){
        QuitRunCommand run = new QuitRunCommand(params, arguments);
    }
}
  