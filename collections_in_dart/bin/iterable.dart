void main() {
  final iterable = Iterable.generate(
    20,
    (i) => genarateName(i),
  );

  print(iterable);

  for (final name in iterable.take(2)) {
    print(name);
  }
}

String genarateName(int i) {
  print("Generate Name Called");
  return "Person $i";
}
