void main() {
  print("Bar Zap Nap Lap Nap" - "Nap");
}

extension SubtractString on String {
  String operator -(String other) {
    String newString = replaceAll(other, '');
    return newString;
  }
}
