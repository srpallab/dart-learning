void main() async {
  try {
    print(
      await getFullName(
        firstName: "Shafiqur",
        lastName: "Rahman",
      ),
    );
    print(
      await getFullName(
        firstName: "",
        lastName: "",
      ),
    );
  } catch (e) {
    print("First or Last Name missing.");
  }
}

Future<String> getFullName({
  required String firstName,
  required String lastName,
}) {
  if (firstName.isEmpty || lastName.isEmpty) {
    throw FirstOrLastNameMissiongException();
  } else {
    return Future.value('$firstName $lastName');
  }
}

class FirstOrLastNameMissiongException implements Exception {
  const FirstOrLastNameMissiongException();
}
