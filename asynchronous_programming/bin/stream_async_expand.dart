void main() async {
  final names = getNames().asyncExpand((name) => times3(name));

  await for (var name in names) {
    print(name);
  }
}

Stream<String> getNames() async* {
  yield 'Jhon';
  yield 'Jane';
  yield 'Jill';
}

Stream<String> times3(String value) => Stream.fromIterable(
      Iterable.generate(3, (_) => value),
    );
