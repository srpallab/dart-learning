void main() {
  Cat tom = Cat(age: 2);
  tom.increment();
  print(tom.age);
}

mixin HasAge {
  abstract int age;
  void increment() => age++;
}

class Cat with HasAge {
  @override
  int age;

  Cat({required this.age});
}
