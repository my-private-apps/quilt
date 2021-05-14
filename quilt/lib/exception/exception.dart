
import 'dart:io';

class QuiltException {
  String message;
  String file;
  int line;

  QuiltException(String message, String file, int line) {
    this.message = message;
    this.file = file;
    this.line = line;
  }

  void raise(bool fatal) {
    stdout.write(message + '\n');
    exit(1);
  }
}