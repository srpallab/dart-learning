void main() {
  const information = {
    'name': 'Shafiqur Rahman',
    'age': 32,
    'height': 5.8,
    'isMailed': false,
    'address': {'street': 'Main Street', 'city': 'New work'}
  };

  for (var entry in information.entries) {
    print("${entry.key} has a value ${entry.value}");
  }
}
