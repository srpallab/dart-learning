const Map<String, dynamic> json = {'name': 'Shafiqur', 'age': 30};
void main() {
  final String? ageAsString = json.finding<int>(
    'age',
    (age) => age.toString(),
  );
  print(ageAsString);

  final String helloName = json.finding(
    'name',
    (name) => "Hello $name",
  );
  print(helloName);
}

extension Find<K, V, R> on Map<K, V> {
  R? finding<T>(K key, R? Function(T value) cast) {
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    }
    return null;
  }
}
