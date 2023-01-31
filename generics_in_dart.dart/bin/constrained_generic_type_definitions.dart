void main() {
  const momAndDad = {'mom': Person(), 'dad': Person()};
  const sonAndDaughterAndFish = {
    'son': Person(),
    'daughter': Person(),
    'fish': Fish(),
  };

  final allValues = [momAndDad, sonAndDaughterAndFish];

  describe(allValues);
}

mixin CanBreathe {
  void breathe();
}

typedef BreathingThings<T extends CanBreathe> = Map<String, T>;

void describe(List<BreathingThings> values) {
  for (final map in values) {
    for (final mapKeyAndValues in map.entries) {
          print("Calling ${mapKeyAndValues.key}");
          mapKeyAndValues.value.breathe();
    }
  }
}

class Person with CanBreathe {
  const Person();

  @override
  void breathe() {
    print("$this is Breathing");
  }
}

class Fish with CanBreathe {
  const Fish();

  @override
  void breathe() {
    print("$this is Breathing...");
  }
}
