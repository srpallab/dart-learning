void main() {
  print([1, 2, 3] - [3]);
  print([1, 2, 3] - [1, 2, 3]);
}

extension SubtractingIterable<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) =>
      where((element) => !other.contains(element));
}
