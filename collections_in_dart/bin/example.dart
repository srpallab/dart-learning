void main(List<String> arguments) {
  final person1 = Person(name: "Shafiqur Rahman", age: 32);
  final person2 = Person(name: "Shafiqur Rahman", age: 32);

  print(person1.hashCode);
  print(person2.hashCode);

  final persons = {person1, person2};
  print(persons);
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  @override
  String toString() => 'Person: $name, Age $age';

  
  @override
  int get hashCode => Object.hash(name, age);

  @override
  bool operator ==(Object other) => identical(this, other);
}
