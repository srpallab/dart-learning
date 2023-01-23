void main() {
  addToDictionaryWrong();
  addToDictionaryCorrect();
}

void addToDictionaryWrong() {
  const info = {
    'name': 'Foo',
    'age': 20,
    'height': 1.8,
  };

  final result = info;

  try {
    result.addAll({'weight': 80});
  } catch (e) {
    print(e);
  }
}

void addToDictionaryCorrect() {
  const info = {
    'name': 'Foo',
    'age': 20,
    'height': 1.8,
  };

  final result = {...info}..addAll({'weight': 80});
  print(result);
}
