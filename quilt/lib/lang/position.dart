class Position {
  int position;

  Position(int position) {
    this.position = position;
  }

  int increment({int by = 1}) {
    position += by;
    return position;
  }

  int decrement({int by = 1}) {
    position -= 1;
    return position;
  }
}
