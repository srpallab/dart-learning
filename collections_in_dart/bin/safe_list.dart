import 'dart:collection';

void main() {
  final List<String> names = [];
  try {
    print(names.first);
    print(names.last);
  } catch (e) {
    print(e);
  }
}

class SafeList<T> extends ListBase<T> {
  final T defaultValue;
  final T notFoundValue;
  final List<T> _list;

  SafeList(
    {
      required this.defaultValue,
      required this.notFoundValue,
      List<T>? values
    }
  ) : _list = values ?? [];

  
  @override
  T operator [](index) {
    // TODO: implement []
    throw UnimplementedError();
  }

  @override
  void operator []=(index, T value) {
    // TODO: implement []=
  }


  @override
  int get length => _list.length;

  @override
  set length(newLength) {
    // TODO: implement length
  }

  
}
