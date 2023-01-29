void main() {
  Person mom = Person(name: "Mom", age: 55);
  Person dad = Person(name: "Dad", age: 62);
  Person son = Person(name: "Son", age: 32);
  Person daughter = Person(name: "Daughter", age: 13);

  Family newFamily = mom + [dad, son];
  print(newFamily);

  Pet cat = Pet(name: "Tom", age: 2);
  Pet mouse = Pet(name: "Jerry", age: 2);

  newFamily = newFamily & [cat, mouse];

  print(newFamily);

  newFamily += daughter;

  print(newFamily);
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  @override
  String toString() => "Person: $name";
}

class Pet {
  final String name;
  final int age;

  Pet({required this.name, required this.age});

  @override
  String toString() => "Pet: $name";
}

class Family {
  final List<Person> members;
  final List<Pet> pets;

  Family({
    required this.members,
    required this.pets,
  });

  @override
  String toString() => "Family Members: $members, Pets: $pets";
}

extension AddFmailyMemberOrPet on Person {
  Family operator +(List<Person> other) => Family(
        members: [this, ...other],
        pets: [],
      );

  Family operator &(List<Pet> other) => Family(
        members: [this],
        pets: [...other],
      );
}

extension AddPet on Family {
  Family operator &(List<Pet> other) => Family(
        members: members,
        pets: [...pets, ...other],
      );

  Family operator +(Person other) => Family(
        members: [...members, other],
        pets: pets,
      );

  Family operator ^(Family other) => Family(
        members: [...members, ...other.members],
        pets: [...pets, ...other.pets],
      );
}
