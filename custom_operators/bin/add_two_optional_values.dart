void main(List<String> args) {
  print(add());
  print(add(null, 20));
  print(add(10, null));
  print(add(10, 20));
}

int add([int? a, int? b]) {
  return a + b;
}

extension NullableAdd<T extends num> on T? {
  T operator +(T? other) {
    T? shadowThis = this;
    if (this == null && other != null) {
      return other;
    } else if (this != null && other == null) {
      return this as T;
    } else if(shadowThis != null && other != null){
      return (other + shadowThis) as T;
    }
    return 0 as T;
  }
}
