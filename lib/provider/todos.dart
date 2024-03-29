import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoappsqflite/db/database_manager.dart';
import 'package:todoappsqflite/models/todo_model.dart';

class Todos with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool isLoading = false;
  List<TodoModel> itemTodo = [];

  // instansiasi database
  DatabaseManager database = DatabaseManager.instance;

  // Function addTodo
  void addTodo() async {
    isLoading = true;
    notifyListeners();
    Database db = await database.db;

    await db.insert('todos', {
      'title': titleController.text,
      'description': descController.text,
    });

    isLoading = false;
    notifyListeners();
  }

  Future<void> getTodo() async {
    Database db = await database.db;
    List<Map<String, dynamic>> data = await db.query('todos');

    // Menambahkan data
    for (var item in data) {
      itemTodo.add(
        TodoModel(
            id: item['id'],
            title: item['title'],
            description: item['description']),
      );
    }
  }
}
