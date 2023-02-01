void main() {
  final listTwo = ["Foo", "Bar", "Baz", "Baa"];
  sort(listTwo, ascending: true);
  sort(listTwo, ascending: false);
}

// final listOne = [10, 20, 30, 40, 80, 50, 70, 60, 90, 100];
// final listThree = [4.6, 5.6, 4.9, 10.0, 1.3];

int isLessThan<T extends Comparable>(T a, T b) => a.compareTo(b);
int isGreaterThan<T extends Comparable>(T a, T b) => b.compareTo(a);

void sort(List<String> list, {required bool ascending}) {
  final comparator = ascending ? isLessThan : isGreaterThan;
  print([...list]..sort(comparator));
}
