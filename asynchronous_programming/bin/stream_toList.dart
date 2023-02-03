void main() async {
  final names = await maleNames().toList();

  for (var name in names) {
    print(name);
  }
}

Stream<String> maleNames() async* {
  yield "Jhon";
  yield "Jake";
  yield "Alif";
  yield "Anik";
}
