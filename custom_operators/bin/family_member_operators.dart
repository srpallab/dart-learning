void main() {
  final FamilyMember mom = FamilyMember(name: "Mom");
  final FamilyMember dad = FamilyMember(name: "Dad");

  final Family family = mom + dad;

  print(family);
}

extension ToFamily on FamilyMember {
  Family operator +(FamilyMember other) => Family(members: [this, other],); 
}


class Family {
  final List<FamilyMember> members;

  Family({ required this.members });

  @override
  String toString() => 'Family Members: $members';
}

class FamilyMember{
  final String name;

  FamilyMember({ required this.name });

  @override
  String toString() => 'Family Member Name: $name';
}
