import 'package:uuid/uuid.dart';
void main() {
  final uuidOne = const Uuid().v4();
  final uuidTwo = const Uuid().v4();

  Person shafiqur = Person(id: uuidOne, name: "Shafiqur Rahman", age: 32);
  Person alif = Person(id: uuidTwo, name: "Alif", age: 16);
  Person pallab = Person(id: uuidOne, name: "Pallab", age: 32);

  if (shafiqur == pallab) {
    print("Shafiqur and Pallab is same person.");
  } else {
    print("Shafiqur and Pallab is not same person.");
  }

  if (shafiqur == alif) {
    print("Shafiqur and Alif is same person.");
  } else {
    print("Shafiqur and Alif is not same person.");
  }


  if (pallab == alif) {
    print("Pallab and Alif is same person.");
  } else {
    print("Pallab and Alif is not same person.");
  }
  
}

mixin HasIndentifier {
  String get id;

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is HasIndentifier &&
          other.id == id;
}

class Person with HasIndentifier {
  @override
  final String id;

  final String name;
  final int age;

  Person({required this.id, required this.name, required this.age,});
}
