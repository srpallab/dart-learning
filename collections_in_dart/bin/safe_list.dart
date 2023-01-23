import 'dart:collection';

void main() {
  final List<String> names = [];
  try {
    print(names.first);
    print(names.last);
  } catch (e) {
    print(e);
  }

  const notFound = 'NOT-FOUND';
  const defaultValue = 'DEFAULT-VALUE';

  final myList = SafeList(
    defaultValue: defaultValue,
    notFoundValue: notFound,
    values: ['Foo', 'Bar'],
  );

  print(myList);
  print(myList[2]);
  print(myList.last);

  myList.length = 4;

  print(myList);

  myList.length = 0;

  print(myList.first);
  print(myList.last);
}

class SafeList<T> extends ListBase<T> {
  final T defaultValue;
  final T notFoundValue;
  final List<T> _list;

  SafeList(
      {required this.defaultValue,
      required this.notFoundValue,
      List<T>? values})
      : _list = values ?? [];

  @override
  T operator [](index) => index < _list.length ? _list[index] : notFoundValue;

  @override
  void operator []=(index, T value) => _list[index] = value;

  @override
  int get length => _list.length;

  @override
  set length(newLength) {
    if (newLength <= _list.length) {
      _list.length = newLength;
    } else {
      _list.addAll(List.filled(newLength - _list.length, defaultValue));
    }
  }

  @override
  T get first => _list.isNotEmpty ? _list.first : notFoundValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : notFoundValue;
}
