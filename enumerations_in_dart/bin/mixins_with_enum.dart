void main() {
  Animal.cat.jump();
  Animal.dog.jump();

  try {
    Animal.fish.jump();
  } catch (e) {
    print(e);
  }
}

mixin canJump {
  int get feetCount;

  void jump() {
    if (feetCount < 1) {
      throw Exception("$this Can't Jump");
    } else {
      print("$this Can Jump");
    }
  }
}

enum Animal with canJump {
  cat(type: "Cat", feetCount: 4),
  dog(type: "Dog", feetCount: 4),
  fish(type: "Fish", feetCount: 0);

  final String type;

  @override
  final int feetCount;

  const Animal({
    required this.type,
    required this.feetCount,
  });


  @override
  String toString() => type;
}
