void main() {
  final shafiqur = Person(name: "Shafiqur Rahman", car: Car.teslaModelY,);

  switch(shafiqur.car) {
    case Car.teslaModel3:
    case Car.teslaModelY:
    case Car.teslaModelS:
      print('${shafiqur.name} has ${shafiqur.car}');
      break;
  }
}

class Person{
  final String name;
  final Car car;

  const Person({ required this.name,
      required this.car,});
}


enum Car {
  teslaModel3(
    "Model 3",
    43990,
    272,
    5,
    "RWD",
  ),
  teslaModelY(
    "Model Y",
    53490,
    330,
    7,
    "AWD Dual Motor",
  ),
  teslaModelS(
    "Model S",
    94990,
    405,
    5,
    "AWD Dual Motor",
  );
  
  
  final String model;
  final int price;
  final int range;
  final int seats;
  final String drive;

  const Car(this.model, this.price, this.range, this.seats, this.drive);

  @override
  String toString() => "Tesla : $model, Price $price";
}
