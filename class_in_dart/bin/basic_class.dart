void main() {
  Person shafiqur = Person("Shafiqur Rahman", 32);
  print(shafiqur);
}

class Person {
  final String name;
  final int age;
  const Person(
    this.name,
    this.age,
  );

  const Person.foo()
      : name = 'Foo',
        age = 20;

  const Person.bar(
    this.age,
  ) : name = 'Bar';

  const Person.other({
    String? name,
    int? age,
  })  : name = name ?? 'Baz',
        age = age ?? 30;
}
