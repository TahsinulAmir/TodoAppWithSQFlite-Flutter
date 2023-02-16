import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:todoappsqflite/provider/todos.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    Todos todos = Provider.of<Todos>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: todos.titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: todos.descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (todos.titleController.text.isNotEmpty &&
                    todos.descController.text.isNotEmpty) {
                  todos.addTodo();
                }
                Navigator.pop(context);
              },
              child: Text(todos.isLoading ? "Loading..." : "Add"),
            ),
          ],
        ),
      ),
    );
  }
}
