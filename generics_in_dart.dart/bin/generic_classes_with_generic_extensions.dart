void main() {
  const tuple = Tuple(10, 20.6);
  print(tuple);
  print(tuple.swap());
  print(tuple.sum);
}

class Tuple<L, R> {
  final L left;
  final R right;

  const Tuple(this.left, this.right);

  @override
  String toString() => "Tuple($left, $right)";
}

extension<L, R> on Tuple<L, R> {
  Tuple<R, L> swap() => Tuple(right, left);
}

extension<L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}
