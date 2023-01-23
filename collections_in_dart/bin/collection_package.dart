// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show UnmodifiableListView;

void main() {
  final names = ['Jhon', 'Jade', 'Cat'];

  names.add('Jack');

  final readOnlyList = UnmodifiableListView(names);

  try {
    readOnlyList.add("Jill");
  } catch (e) {
    print(e);
  }

  Person person = Person(
    name: "Shafiqur Rahman",
    siblings: [Person(name: "Alif")],
  );
  print(person);
  print(person._siblings);

  try {
    person._siblings?.add(Person(name: "Nana"));
  } catch (e) {
    print(e);
  }
  
  print(person._siblings);
}

class Person {
  final String name;
  final List<Person>? _siblings;

  UnmodifiableListView<Person>? get siblings =>
      _siblings == null ? null : UnmodifiableListView(_siblings!);

  Person({required this.name, List<Person>? siblings}) : _siblings = siblings;

  @override
  String toString() => "Name: $name";
}
