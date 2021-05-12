module arguments.perform;

import lang.run.run;

// Peform functions based on the command
void performCommandActions(string command, string[string] params, string[] arguments){
    if(command == "run"){
        QuitRunCommand run = new QuitRunCommand(params, arguments);
    }
}
  