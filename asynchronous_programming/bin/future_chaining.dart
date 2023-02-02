void main() {}

Future<String> getFullName() => Future.delayed(
      const Duration(seconds: 1),
      () => 'Shafiqur Rahman',
    );

Future<int> calculateLenght(String value) => Future.delayed(
      const Duration(seconds: 1),
      () => value.length,
    );
