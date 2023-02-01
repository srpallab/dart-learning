void main() {
  print(Person(age: 30).ageRounded);
  print(Person(age: 30.88).ageRounded);
}

class Person<T extends num> {
  final T age;

  const Person({
    required this.age,
  });

  int get ageRounded => age.round();
}
