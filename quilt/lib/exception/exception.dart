import 'dart:io';

class QuiltException {
  String message;

  QuiltException(String message) {
    this.message = message;
  }

  void raise(bool fatal) {
    print(message + '\n');
    exit(1);
  }
}                    
