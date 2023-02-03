import 'dart:async';

void main() async {
  await for (var name in maleNames.capitalize) {
    print(name);
  }
  print("=====================================");
  await for (var name in maleNames.capitalizeUsingMap) {
    print(name);
  }
}

Stream<String> maleNames = Stream.fromIterable([
  "Jhon",
  "Jake",
  "Alif",
  "Anik",
]);

extension on Stream<String> {
  Stream<String> get capitalize => transform(ToUpperCase());

  Stream<String> get capitalizeUsingMap => map((event) => event.toUpperCase());
}

class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> strem) {
    return strem.map((event) => event.toUpperCase());
  }
}
