import 'dart:isolate';

void main() async {
  await for (final msg in getMessage().take(2)) {
    print(msg);
  }
  print("========================================");
  await for (final msg in getMessageAgain().take(20)) {
    print(msg);
  }
}

Stream<String> getMessage() {
  final ReceivePort rp = ReceivePort();
  return Isolate.spawn(_getMessages, rp.sendPort)
      .asStream()
      .asyncExpand((_) => rp)
      .takeWhile((element) => element is String)
      .cast();
}

Stream<String> getMessageAgain() async* {
  final ReceivePort rp = ReceivePort();
  await Isolate.spawn(_getMessages, rp.sendPort);
  await for (final mag
      in rp.takeWhile((element) => element is String).cast<String>()) {
    yield mag;
  }
}

void _getMessages(SendPort sp) async {
  await for (final now in Stream.periodic(
    Duration(seconds: 1),
    (_) => DateTime.now().toIso8601String(),
  )) {
    sp.send(now);
  }
}
