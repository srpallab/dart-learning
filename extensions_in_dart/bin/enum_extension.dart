void main(List<String> args) {
  print(AnimalType.cat.isContainsUpperCase);
  print(AnimalType.dog.isContainsUpperCase);
  print(AnimalType.goldFish.isContainsUpperCase);
}

enum AnimalType { cat, dog, goldFish }

extension on Enum {
  bool get isContainsUpperCase => name.contains(RegExp(r'[A-Z]'));
}
