void main() {
  final jhonDoe = Person(name: "Jhon Doe");
  final janeDoe = Person(name: "Jane Doe");

  final doeFamily = WrongImplementationOfFamily(
    members: [jhonDoe, janeDoe],
  );

  print(doeFamily);
  print(doeFamily.memberCount);


  final doeFamilyCorrect = CorrectImplementationOfFamily(
    members: [jhonDoe, janeDoe],
  );

  print(doeFamilyCorrect);
  print(doeFamilyCorrect.memberCount);
}

class Person {
  final String name;
  
  Person({required this.name});
}

class WrongImplementationOfFamily {
  final Iterable<Person> members;
  late int memberCount;

  WrongImplementationOfFamily({ required this.members }) {
    memberCount = getMembersCount();
  }

  int getMembersCount() {
    print("Getting Members Count");
    return members.length;
  }  
}


class CorrectImplementationOfFamily {
  final Iterable<Person> members;
  late int memberCount = getMembersCount();

  CorrectImplementationOfFamily({ required this.members });

  int getMembersCount() {
    print("Getting Members Count");
    return members.length;
  }  
}
