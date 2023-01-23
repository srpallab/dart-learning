void main() {
  for (final name in names()) {
    print(name);
  }
}
  
Iterable<String> names() sync* {
  yield 'Jhon';
  yield 'Jane';
  yield 'Bob';
  yield* templateNames();
}

Iterable<String> templateNames() sync* {
  yield 'Foo';
  yield 'Bar';
  yield 'Boo';
}
