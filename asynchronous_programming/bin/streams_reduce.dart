void main() async {
  final sum = await allAges().reduce((lhs, rhs) => lhs + rhs);
  print(sum);
}

Stream<int> allAges() async* {
  yield 10;
  yield 20;
  yield 30;
  yield 40;
  yield 50;
  yield 60;
  yield 70;
  yield 80;
  yield 90;
  yield 100;
}
