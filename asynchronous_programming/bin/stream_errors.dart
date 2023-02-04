import 'dart:async';

void main() async {
  await for (var name in allNames().absorbeErrorUsingHandleError()) {
    print(name);
  }
  print("=====================================================");
  await for (var name in allNames().absorbeErrorUsingTransformerHandler()) {
    print(name);
  }
  print("=====================================================");
  await for (var name in allNames().absorbeErrorUsingTransformer()) {
    print(name);
  }
}

extension AbsorbeErrors<T> on Stream<T> {
  Stream<T> absorbeErrorUsingHandleError() => handleError((_, __) => {});
  Stream<T> absorbeErrorUsingTransformerHandler() => transform(
        StreamTransformer.fromHandlers(
          handleError: (_, __, sink) {
            sink.close();
          },
        ),
      );

  Stream<T> absorbeErrorUsingTransformer() => transform(StreamErrorAbsorber());
}

class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();
    stream.listen(
      controller.sink.add,
      onError: (_) {},
      onDone: controller.close,
    );
    return controller.stream;
  }
}

Stream<String> allNames() async* {
  yield "Jhon";
  yield "Jake";
  yield "Alif";
  yield "Anik";
  throw "All out of names";
}
