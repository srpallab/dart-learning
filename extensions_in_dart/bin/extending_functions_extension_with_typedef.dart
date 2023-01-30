import 'dart:math' show Random;

void main() {
  print(add.callWithRandomValues());
  print(substract.callWithRandomValues());
}

int add(int a, int b) => a + b;
int substract(int a, int b) => a - b;

typedef IntTypeFunction = int Function(int, int);

extension on IntTypeFunction {
  int callWithRandomValues() {
    final int randomValueOne = Random().nextInt(100);
    final int randomValueTwo = Random().nextInt(200);
    print("R1: $randomValueOne, R2: $randomValueTwo");
    return call(randomValueOne, randomValueTwo);
  }
}
