void main() async {
  final db = Database();

  try {
    await db.open();
    await db.getData();
  } on DatabaseNotOpendException {
    print("Please open the database first.");
  } finally {
    await db.close();
  }
}

class Database {
  bool _isDbOpen = false;

  Future<void> open() {
    return Future.delayed(Duration(seconds: 1), () {
      _isDbOpen = true;
      print("Database Opened");
    });
  }

  Future<String> getData() {
    if (!_isDbOpen) {
      throw DatabaseNotOpendException();
    }
    return Future.delayed(
      Duration(seconds: 1),
      () {
        print("Data Sending...");
        return 'Data';
      },
    );
  }

  Future<void> close() {
    return Future.delayed(Duration(seconds: 1), () {
      _isDbOpen = false;
      print("Database Closed");
    });
  }
}

class DatabaseNotOpendException implements Exception {
  @override
  String toString() => "Database not opened Exception.";
}
