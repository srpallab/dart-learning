void main() {
  print(performOperations(10, 20, add));
  print(performOperations(40, 10, minus));

  print(genarateFunctions(10, 50)());
}

// Fast Class Functions
int performOperations(
  a,
  b,
  int Function(int, int) operation,
) => operation(a, b);


int add(a, b) => a + b;
int minus(a, b) => a - b;


// Return Function from a Function
int Function() genarateFunctions(lhs, rhs) => () => lhs + rhs; 
