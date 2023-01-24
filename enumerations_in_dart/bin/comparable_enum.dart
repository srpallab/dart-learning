void main(List<String> args) {
  print(TeslaCars.values);
  print([...TeslaCars.values]..sort());
}

enum TeslaCars implements Comparable<TeslaCars> {
  modelX(weightInKG: 2.2),
  modelS(weightInKG: 2.1),
  model3(weightInKG: 1.8),
  modelY(weightInKG: 2.4);

  final double weightInKG;

  const TeslaCars({required this.weightInKG});

  @override
  int compareTo(other) => weightInKG.compareTo(other.weightInKG);
}
