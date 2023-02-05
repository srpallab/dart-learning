import 'dart:isolate';
import 'dart:io';
import 'dart:convert';

void main() async {
  final responder = await Responder.create();

  do {
    stdout.writeln("Say Something or type ('exit') to end: ");
    final line = stdin.readLineSync(encoding: utf8);
    switch (line?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        exit(0);
      default:
        final mag = await responder.getResponse(line!);
        print(mag);
    }
  } while (true);
}

class Responder {
  final ReceivePort rp;
  final Stream<dynamic> broardcastRp;
  final SendPort communicatorSendPort;

  Responder({
    required this.rp,
    required this.broardcastRp,
    required this.communicatorSendPort,
  });

  static Future<Responder> create() async {
    final ReceivePort rp = ReceivePort();
    Isolate.spawn(_getResponse, rp.sendPort);

    final broadcastRp = rp.asBroadcastStream();
    final SendPort communicatorSendPort = await broadcastRp.first;

    return Responder(
      rp: rp,
      broardcastRp: broadcastRp,
      communicatorSendPort: communicatorSendPort,
    );
  }

  Future<String> getResponse(String message) async {
    print(message);
    communicatorSendPort.send(message);
    return broardcastRp
        .takeWhile((element) => element is String)
        .cast<String>()
        .take(1)
        .first;
  }
}

void _getResponse(SendPort sp) async {
  final ReceivePort rp = ReceivePort();
  sp.send(rp.sendPort);

  final messages = rp.takeWhile((element) => element is String).cast<String>();

  await for (var message in messages) {
    for (var myResponse in messagesAndResponses.entries) {
      if (myResponse.key.trim().toLowerCase() == message.trim().toLowerCase()) {
        sp.send(myResponse.value);
        break;
      }
    }
  }
}

const messagesAndResponses = {
  '': 'Ask me a question like "How are you?"',
  'Hello': 'Hi',
  'How are you?': 'Fine',
  'What are you doing?': 'Learning about Isolates in Dart!',
  'Are you having fun?': 'Yeah sure!',
};
