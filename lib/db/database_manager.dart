import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  // privateConst
  DatabaseManager._privateConst();
  static DatabaseManager instance = DatabaseManager._privateConst();

  Database? _db;
}
