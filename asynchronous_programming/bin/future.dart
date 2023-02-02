void main() async {
  print(await getUserName());
  print(await getAddress());
  print(await getPhoneNumber());
  print(await getCountry());
  print(await getCity());
}

Future<String> getUserName() async => 'Shafiqur Rahman';
Future<String> getAddress() => Future.value('123 Main St');
Future<String> getPhoneNumber() => Future.delayed(
      const Duration(seconds: 1),
      () => '555-555-5555',
    );
Future<String> getCountry() async => 'Bangladesh';
Future<String> getCity() async {
  await Future.delayed(const Duration(seconds: 1));
  return "Dhaka";
}
