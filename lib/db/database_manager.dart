import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  // privateConst
  DatabaseManager._privateConst();
  static DatabaseManager instance = DatabaseManager._privateConst();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    // create database name todo
    Directory docDirectory = await getApplicationDocumentsDirectory();

    // Create path
    String path = join(docDirectory.path, 'todo.db');

    //  create table
    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        return await database.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  // Close database
  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}
