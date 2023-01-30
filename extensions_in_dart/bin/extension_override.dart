void main() {
  final Person shafiqur = Person(name: "Shafiqur Rahman", age: 32);
  print(ShortDescription(shafiqur).description);
  print(LongDescription(shafiqur).description);
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});
}

extension ShortDescription on Person {
  String get description => "$name ($age)";
}

extension LongDescription on Person {
  String get description => "$name is $age years old";
}
