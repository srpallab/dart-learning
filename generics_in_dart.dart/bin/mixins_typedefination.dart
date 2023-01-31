void main() {
  final Person shfiqur = Person(height: 200);
  print(shfiqur.height);

  final Animal tom = Animal(height: 19.8);
  print(tom.height);
}

mixin GetHeight<H extends num> {
  H get height;
}

typedef HasIntHeight = GetHeight<int>;
typedef HasDoubleHeight = GetHeight<double>;

class Person with HasIntHeight {
  @override
  final int height;

  const Person({required this.height});
}

class Animal with HasDoubleHeight {
  @override
  final double height;

  const Animal({required this.height});
}
