void main() {
  final Person person = Person(age: 10);
  print(person);
  person.age = 0;
  print(person);

  try {
    person.age = -1;
  } catch (e) {
    print(e);
  } finally {
    print(person);
  }
}

class Person {
  int _age;

  Person({
    required int age,
  }) : _age = age;

  int get age => _age;

  set age(int value) {
    if (value < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    _age = value;
  }

  @override
  String toString() => "Person(age: $age)";
}
