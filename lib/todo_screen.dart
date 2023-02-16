import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:todoappsqflite/add_todo.dart';
import 'package:todoappsqflite/provider/todos.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => Todos(),
                child: AddTodo(),
              ),
            ),
          );
        },
        child: Icon(Icons.add_task),
      ),
      appBar: AppBar(
        title: Text("Todos"),
      ),
    );
  }
}
