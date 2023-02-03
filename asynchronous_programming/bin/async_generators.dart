void main() async {
  await for (final number in numbers()) {
    print(number);
  }
  print("=================================");
  await for (final number in numbers(end: 10, func: evenNumber)) {
    print(number);
  }
  print("=================================");
  await for (final number in numbers(end: 10, func: oddNumber)) {
    print(number);
  }
}

bool evenNumber(int number) => number % 2 == 0;
bool oddNumber(int number) => number % 2 != 0;

typedef IsIncluded = bool Function(int value);

Stream<int> numbers({
  int start = 0,
  int end = 4,
  IsIncluded? func,
}) async* {
  for (var i = start; i < end; i++) {
    if (func == null || func(i)) {
      yield i;
    }
  }
}
