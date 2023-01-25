void main() {
  Person myMom = Mom();

  print(myMom.role);
}

enum Role { mum, dad, brother, sister }

class Person {
  final Role role;

  const Person({required this.role});
}

class Mom extends Person {
  const Mom() : super(role: Role.mum);
}
