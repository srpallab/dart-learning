// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart'
    show
        UnmodifiableListView,
        CanonicalizedMap,
        CombinedIterableView,
        mergeMaps;

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
  print('================');
  testCanonicalizedMap();
  print('================');
  testCombinedItrerableView();
  print('================');
  margeMaps();
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

void testCanonicalizedMap() {
  const info = {
    'name': 'Foo',
    'age': 20,
    'sex': 'Male',
    'height': 1.8,
  };

  final canonMap = CanonicalizedMap.from(
    info,
    (key) {
      return key.length;
    },
  );

  print(canonMap);
}

void testCombinedItrerableView() {
  final one = Iterable.generate(3, (int i) => i);
  final two = Iterable.generate(3, (int i) => i + 10);
  final three = Iterable.generate(3, (int i) => i + 100);

  final combined = CombinedIterableView([
    one,
    two,
    three,
  ]);

  print(combined);
  print(combined.length);
  print(combined.isEmpty);
}

void margeMaps() {
  const info = {
    'name': 'Shafiqur Rahman',
    'age': 20,
    'height': 1.8,
  };

  const infoNew = {
    'name': 'Shafiqur Rahman',
    'age': 20,
    'height': 5.8,
    'weight': 110,
  };

  final marge = mergeMaps(
    info,
    infoNew,
    value: (one, two) => two,
  );

  print(marge);
}
