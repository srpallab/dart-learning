void main(List<String> arguments) {
  final person1 = Person(name: "Shafiqur Rahman", age: 32);
  final person2 = Person(name: "Shafiqur Rahman", age: 32);
  final person3 = person1;
  final robot = Robot(name: "Shafiqur Rahman", age: 32);

  print(person1.hashCode);
  print(person2.hashCode);
  print(robot.hashCode);

  print(identical(person1, person2));
  print(identical(person1, person3));

  
  final ai = {person1, person2, robot};
  print(ai);

  
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
  bool operator ==(Object other) =>
  identical(this, other)
  || other is Person
  && name == other.name
  && age == other.age;

}


class Robot {
  final String name;
  final int age;

  Robot({required this.name, required this.age});

  @override
  String toString() => 'Robot: $name, Age $age';

  
  @override
  int get hashCode => Object.hash(name, age);

  @override
  bool operator ==(Object other) =>
  identical(this, other)
  || other is Robot
  && name == other.name
  && age == other.age;

}
