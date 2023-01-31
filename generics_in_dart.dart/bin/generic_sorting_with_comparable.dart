void main() {
  sort(ascending: true);
  sort(ascending: false);
}

final listOne = [10, 20, 30, 40, 80, 50, 70, 60, 90, 100];
final listTwo = ["Foo", "Bar", "Baz"];
final listThree = [4.6, 5.6, 4.9, 10.0, 1.3];

int isLessThan<T extends Comparable>(T a, T b) => a.compareTo(b);
int isGreaterThan<T extends Comparable>(T a, T b) => b.compareTo(a);

void sort({required bool ascending}) {
  final comparator = ascending ? isLessThan : isGreaterThan;
  print([...listOne]..sort(comparator));
  print([...listTwo]..sort(comparator));
  print([...listThree]..sort(comparator));
}
