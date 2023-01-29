void main() {
  print({"name": "Shafiqur", "age": 32} + {"height": 5.8});
  print({"name": "Shafiqur", "age": 32} - {"age": 32});
  print({"name": "Shafiqur", "age": 32} * 3);
}

extension MapOperations<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {...this, ...other};

  Map<K, V> operator -(Map<K, V> other) {
    return {...this}..removeWhere(
        (key, value) => other.containsKey(key) && other[key] == value);
  }

  Iterable<Map<K, V>> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield this;
    }
  }
}
