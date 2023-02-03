void main() async {
  await for (final character in getNames().asyncExpand(
    (name) => getCharacters(name),
  )) {
    print(character);
  };
}

Stream<String> getCharacters(String fromName) async* {
  for (var i = 0; i < fromName.length; i++) {
    await Future.delayed(const Duration(milliseconds: 300));
    yield fromName[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(milliseconds: 200));
  yield "Shafiqur";
  await Future.delayed(const Duration(milliseconds: 200));
  yield "Rahman";
}
