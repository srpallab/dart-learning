void main() {
  print(2.toMyInt());
  print(3.8.toMyInt());
  print([1, 2.0, "Hello"].toMyInt());
}

extension ToInt on Object {
  int toMyInt() {
    final list = [
      if (this is Iterable<Object>)
        ...this as Iterable<Object>
      else if (this is int)
        this as int
      else
        (double.tryParse(toString()) ?? 0.0).round()
    ];
    print(list);
    final result = list.map(
      (e) => (double.tryParse(e.toString()) ?? 0.0).round()
    ).reduce(
      (value, element) => value + element
    );
    return result;
  }
}
