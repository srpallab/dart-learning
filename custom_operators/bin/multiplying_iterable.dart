void main(List<String> args) {
  final List<String> names = ["Shafiqur Rahman", "Pallab", "Alif"];

  final Iterable<String> threeTimesNames = names * 3;
  print(threeTimesNames);
}

extension ToMultipyIterable<T> on Iterable<T> {
  Iterable<T> operator *(int times) sync* {
    for (int i = 0; i < times; i++) {
      yield* this;
    }
  }
}
