void main() {
  final String string = 'abracadabra';

  var result = {
    for (final char in string.split('')) 'abc'.contains(char) ? null : char
  }.cast<String>()
    ..removeAll([null]);

  print(result);

  final numberUpTo100 = Iterable.generate(100);

  final oddNumbers = [
    for (final number in numberUpTo100)
      if (number % 2 != 0) number
  ];

  final evenNumbers = [
    for (final number in numberUpTo100)
      if (number % 2 == 0) number
  ];

  print(numberUpTo100);
  print(evenNumbers);
  print(oddNumbers);

  final names = [
    'Shafiqur Rahman',
    'Habibur Rahman',
    'Hamidur Rahman',
  ];

  final mapFormList = {for (final name in names) name: name.length};

  print(mapFormList);
}
