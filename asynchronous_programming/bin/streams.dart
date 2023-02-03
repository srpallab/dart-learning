void main() async {
  await for (var number in getNumbers()) {
    print(number);
  }

  try {
    await for (var name in getNamse()) {
      print(name);
    }
  } catch (e) {
    print(e);
  }
}

Stream<int> getNumbers() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

Stream<String> getNamse() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield 'Shafiqur Rahman';
  throw Exception('Something Went Wrong');
}
