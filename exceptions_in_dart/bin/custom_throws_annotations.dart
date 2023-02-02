void main() {
  try {
    print("Dog aged 11 is going to run ....");
    Dog(age: 11, isTired: false).run();
  } catch (e) {
    print(e);
  }

  try {
    print("Dog tired dog is going to run ....");
    Dog(age: 2, isTired: true).run();
  } catch (e) {
    print(e);
  }
}

class Throws<T> {
  final List<T> exceptions;
  const Throws(this.exceptions);
}

class DogIsTooOldException implements Exception {
  const DogIsTooOldException();
}

class DogIsTiredException implements Exception {
  const DogIsTiredException();
}

class Animal {
  final int age;

  const Animal({required this.age});

  @Throws([UnimplementedError])
  void run() => throw UnimplementedError();
}

class Dog extends Animal {
  final bool isTired;
  const Dog({required this.isTired, required super.age});

  @Throws([DogIsTiredException, DogIsTooOldException])
  @override
  void run() {
    if (age > 10) {
      throw DogIsTooOldException();
    } else if (isTired) {
      throw DogIsTiredException();
    }
    print("Dog is Running");
    super.run();
  }
}
