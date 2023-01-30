void main() {
  print(1.to(20));
  print(20.to(10));
}

extension on int {
  Iterable<int> to(int end, {bool inclusive = true}) => this < end
      ? [for (int i = this; i < end; i++) i, if (inclusive) end]
      : [for (int i = this; i > end; i--) i, if (inclusive) end];
}
