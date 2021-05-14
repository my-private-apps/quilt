import 'dart:io';

class QuiltException {
  String message;

  QuiltException(String message) {
    this.message = message;
  }

  void raise(bool fatal) {
    stdout.write(message + '\n');
    exit(1);
  }
}
