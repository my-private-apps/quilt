import 'dart:io';
import 'package:quilt/exception/exception.dart' as error;

class QuiltRunCommand {
  Map<String, String> params;
  List<dynamic> cli;

  QuiltRunCommand(Map<String, String> params, List<dynamic> cli){
    this.params = params;
    this.cli = cli;
  }

  void run() {
    var filename = params['--file'];
    if(filename != null){
      var file = File(filename);
      if(!file.existsSync()){
        var exception = error.QuiltException('$filename does not exist');
        exception.raise(true);
      }
      file.readAsString().then((String content) => {
        
      });
    }
  }
}