import 'dart:isolate';
import 'dart:io';
import 'dart:convert';

void main() async {
  do {
    stdout.writeln("Say Something");
    final line = stdin.readLineSync(encoding: utf8);
    switch (line?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        exit(0);
      default:
        final mag = await getResponse(line!);
        print(mag);
    }
  } while (true);
}

Future<String> getResponse(String message) async {
  final ReceivePort rp = ReceivePort();
  await Isolate.spawn(_getResponse, rp.sendPort);

  final boardcastingReceivePort = rp.asBroadcastStream();
  final SendPort communicationSendPort = await boardcastingReceivePort.first;
  communicationSendPort.send(message);
  return boardcastingReceivePort
      .takeWhile((element) => element is String)
      .cast<String>()
      .take(1)
      .first;
}

void _getResponse(SendPort sp) async {
  final ReceivePort rp = ReceivePort();
  sp.send(rp.sendPort);

  await for (var userMessage
      in rp.takeWhile((element) => element is String).cast<String>()) {
    for (var msg in messagesAndResponses.entries) {
      if (
        msg.key.trim().toLowerCase()
        == userMessage.trim().toLowerCase()
      ) {
        sp.send(msg.value);
        continue;
      }
    }
    sp.send("I don't know how to response to that");
  }
}

const messagesAndResponses = {
  '': 'Ask me a question like "How are you?"',
  'Hello': 'Hi',
  'How are you?': 'Fine',
  'What are you doing?': 'Learning about Isolates in Dart!',
  'Are you having fun?': 'Yeah sure!',
};
