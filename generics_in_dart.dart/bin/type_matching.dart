void main() {
  print(doTypesMatch(10, 10));
  print(doTypesMatch('10', 10));
}


bool doTypesMatch<L, R>(L a, R b) => L == R;
