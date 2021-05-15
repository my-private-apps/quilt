
import 'dart:io';

/// Error objects thrown in the case of a program failure.
///
/// An `Error` object represents a program failure that the programmer
/// should have avoided.
///
/// Examples include using single quotations for strings of length 
/// greater than 1
///

class QuiltRuntimeException {
  String _exceptionMessage;
  String _exceptionType;
  String _file;
  int _linenumber;

  QuiltRuntimeException(String message, String type, String file, int line, bool isFatal){
    _exceptionMessage = message;
    _exceptionType = type;
    _file = file;
    _linenumber = line;

    _raiseQuiltException(isFatal);
  }

  /// Raise the exception and exit the
  /// program if the error is a fatal error
  void _raiseQuiltException(bool isFatal) {
    print('[$_file :$_linenumber]$_exceptionMessage');
    if(isFatal) {
      exit(1);
    }
  }

  /// Convert the error message into a string
  /// object.
  /// [_exceptionType] [_exceptionMessage]
  String toString() {
    return '[$_exceptionType] $_exceptionMessage';
  }
}