void main() {
  final personName = personThing.mapIfOfType(
        (Person p) => p.name,
      ) ??
      "Unknown Person";
  print(personName);

  final personNameWrong = personThing.mapIfOfType(
        (Animal p) => p.name,
      ) ??
      "Unknown Person";
  print(personNameWrong);

  final animalName = animalThing.mapIfOfType(
        (Animal a) => a.name,
      ) ??
      "Unknown Animal";
  print(animalName);
}

abstract class Thing {
  final String name;
  const Thing({required this.name});
}

class Person extends Thing {
  final int age;
  const Person({
    required this.age,
    required String name,
  }) : super(name: name);
}

class Animal extends Thing {
  final String species;
  const Animal({
    required this.species,
    required String name,
  }) : super(name: name);
}

const Thing personThing = Person(
  name: "Foo",
  age: 30,
);
const Thing animalThing = Animal(
  species: "car",
  name: "Bar",
);

extension<T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final shadow = this;

    if (shadow is E) {
      return f(shadow);
    } else {
      return null;
    }
  }
}
