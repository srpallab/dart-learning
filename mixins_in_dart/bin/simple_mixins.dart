void main() {
  Person shafiqur = Person();
  shafiqur.walk(speed: 10.0);
  shafiqur.jump(speed: 1.0);
}

mixin HasSpeed{
  abstract double speed;
}

mixin CanJump on HasSpeed{
  void jump({required double speed}){
    print("$runtimeType is jumping in speed of $speed");
    this.speed = speed;
  }
}

mixin CanWalk on HasSpeed {
  void walk({required double speed}){
    print("$runtimeType is walking in speed of $speed");
    this.speed = speed;
  }
}


class Person with HasSpeed, CanJump, CanWalk {
  Person() : speed = 0.0;

  @override
  double speed;
}
