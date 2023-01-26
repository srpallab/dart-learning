void main() {
  Set<Cat> cats = <Cat>{
    Cat(name: "Tom", age: 2),
    Cat(name: "Mat", age: 3),
    Cat(name: "Tom", age: 2),
  };

  cats.forEach(print);
}

enum PetType { cat, dog }

mixin Pet {
  String get name;
  int get age;
  PetType get petType;

  @override
  String toString() => '$runtimeType name: $name, age: $age';

  @override
  int get hashCode => Object.hash(name, age, petType);

  @override
  bool operator ==(Object other) => other.hashCode == hashCode;
}

class Cat with Pet {
  @override
  final int age;

  @override
  final String name;

  @override
  final PetType petType;

  Cat({
    required this.age,
    required this.name,
  }) : petType = PetType.cat;
}
