import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoappsqflite/db/database_manager.dart';

class Todos with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // instansiasi database
  DatabaseManager database = DatabaseManager.instance;

  // Function addTodo
  void addTodo() async {
    Database db = await database.db;

    await db.insert('todos', {
      'title': titleController.text,
      'description': descController.text,
    });
  }
}
