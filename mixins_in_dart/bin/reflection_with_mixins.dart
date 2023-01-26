import 'dart:mirrors';

void main() {
  final shafiqur = Person(name: "Shafiqur Rahman", age: 32);
  print(shafiqur);

  final myHouse = House(address: "North Madartek", rooms: 4);
  print(myHouse);
}

mixin HasDescription {
  @override
  String toString() {
    final reflection = reflect(this);
    final thisType = MirrorSystem.getName(
      reflection.type.simpleName,
    );

    final variables =
        reflection.type.declarations.values.whereType<VariableMirror>();
    final poperties = <String, dynamic>{
      for (final variable in variables)
        variable.asKey: reflection
            .getField(
              variable.simpleName,
            )
            .reflectee,
    }.toString();
    return '$thisType = $poperties';
  }
}

extension AsKey on VariableMirror {
  String get asKey {
    final fieldName = MirrorSystem.getName(simpleName);
    final fieldType = MirrorSystem.getName(type.simpleName);
    return '$fieldName ($fieldType)';
  }
}

class Person with HasDescription {
  final String name;
  final int age;

  const Person({required this.name, required this.age});
}

class House with HasDescription {
  final String address;
  final int rooms;

  House({required this.address, required this.rooms});
}
