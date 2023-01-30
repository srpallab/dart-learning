void main() {
  print([1,2,3].sum);
  print([1.2,3.3,4.5].sum);
}


extension SumIt<T extends num> on Iterable<T> {
  T get sum => reduce((value, element) => value + element as T); 
}
