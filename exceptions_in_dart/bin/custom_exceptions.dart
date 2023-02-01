void main() {
  try {
    Person(name: "Shafiqur Rahman", age: -1,);
  } on InvalidAgeException catch (e, stackTrace) {
    print(e);
    print(stackTrace);
  }
}

class InvalidAgeException implements Exception {
  final int age;
  final String message;

  InvalidAgeException({required this.age, required this.message,});

  @override
  String toString() => "Age: $age, $message";
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age}) {
    if (age < 0) {
      throw InvalidAgeException(age: age, message: "Age can't be nagative.",);
    } else if (age > 140) {
      throw InvalidAgeException(age: age, message: "Age can't be more than 140",);
    }
  }
}
