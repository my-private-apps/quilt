module error.error;

import std.stdio;
import core.stdc.stdlib;

class QuiltException {
    private string message;
    private bool fatal;

    this(string message, bool fatal){
        this.message = message;
        this.raiseException();
    }

    // Raise the exception and exit from'
    // the program if the error is fatal
    private void raiseException() {
        writeln("[ERROR]:" ~this.message);
        exit(1);
    }
}