void main() {
  final meThisYear = Person(age: 32);
  print(meThisYear);
  final meNextYear = meThisYear + 1;
  print(meNextYear);
}

class Person {
  final int age;

  Person({required this.age});

  Person operator +(int age) => Person(age: this.age + 1);

  @override
  String toString() => "Person Age is : $age";
}
