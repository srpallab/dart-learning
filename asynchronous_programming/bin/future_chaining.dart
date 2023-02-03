void main() async {
  final lenght = await getFullName().then((value) => calculateLenght(value));
  print(lenght);
}

Future<String> getFullName() => Future.delayed(
      const Duration(seconds: 1),
      () => 'Shafiqur Rahman',
    );

Future<int> calculateLenght(String value) => Future.delayed(
      const Duration(seconds: 1),
      () => value.length,
    );
