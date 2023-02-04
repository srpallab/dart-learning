import 'dart:async';

void main() async {
  await nonBroadcastStreamExample();
  await broadcastStreamExample();
}

Future<void> nonBroadcastStreamExample() async {
  final controller = StreamController<String>();
  controller.sink.add("Bob");
  controller.sink.add("Marle");
  controller.sink.add("Huda");

  try {
    await for (var name in controller.stream) {
      print(name);
      await for (var name in controller.stream) {
        print(name);
      }
    }
  } catch (e) {
    print(e);
  }

  controller.close();
}

Future<void> broadcastStreamExample() async {
  late final StreamController<String> controller;

  controller = StreamController<String>.broadcast();

  final subOne = controller.stream.listen((event) {
    print("Sub One: $event");
  });

  final subTwo = controller.stream.listen((event) {
    print("Sub Two: $event");
  });

  controller.sink.add("Bob");
  controller.sink.add("Marle");
  controller.sink.add("Huda");

  controller.close();
  controller.onCancel = () {
    print("Cancle");
    subOne.cancel();
    subTwo.cancel();
  };
}
