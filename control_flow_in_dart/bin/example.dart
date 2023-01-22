void main() {
  describe(1);
  describe(1.1);
  describe('Hello');
  describe(true);
  describe({'key': 'value'});
  describe([1, 2, 3]);
}


// Switch Case
void describe<T>(T value){
  switch (T) {
    case int:
      print("This is an integer");
      break;
    case double:
      print("This is a Double");
      break;
    case String:
      print("This is a String");
      break;
   case bool:
      print("This is a Boolean");
      break;
    case Map<String, String>:
      print("This is a Map");
      break;      
    default:
      print("Sorry Something Went Wrong.");
      break;
  }
}
