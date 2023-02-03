void main() async {
  await for (var name in allNames()) {
    print(name);
  }
}

Stream<String> maleNames() async* {
  yield "Jhon";
  yield "Jake";
  yield "Alif";
  yield "Anik";
}

Stream<String> femaleName() async* {
  yield "Sara";
  yield "Sana";
  yield "Sahara";
  yield "Anika";
}

Stream<String> allNames() async* {
  yield* maleNames();
  yield* femaleName();
}
