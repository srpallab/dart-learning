void main() {
  Human().run();
  Fish().swim();
}

class Has2Feet {
  const Has2Feet();
}

mixin CanRun on Has2Feet {
  void run() {
    print("$runtimeType is Running");
  }
}

class Human extends Has2Feet with CanRun {
  const Human();
}

class HasNoFeet {
  const HasNoFeet();
}

mixin CanSwim on HasNoFeet {
  void swim() {
    print("$runtimeType is Swimming");
  }
}

class Fish extends HasNoFeet with CanSwim {
  const Fish();
}
