void main() {
  const myCar = Car();
  print(myCar);
  myCar.accelerate();
  myCar.decelerate();

  const myTruck = Truck();
  print(myTruck);
  myTruck.accelerate();
  myTruck.decelerate();
}

enum VehicleType { car, cycle, truck, motorcycle }

abstract class Vehicle {
  final VehicleType vehicleType;
  const Vehicle({required this.vehicleType});

  void accelerate() => print("$this $vehicleType is accrelerating");
  void decelerate() => print("$this $vehicleType is decelerating");
}

class Car extends Vehicle {
  const Car() : super(vehicleType: VehicleType.car);
}

class Truck implements Vehicle {
  const Truck();

  @override
  void accelerate() => print("Truck is accrelerating");

  @override
  void decelerate() => print("Truck is decelerating");

  @override
  // TODO: implement vehicleType
  VehicleType get vehicleType => VehicleType.truck;
}
