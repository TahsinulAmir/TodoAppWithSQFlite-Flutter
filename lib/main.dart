import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappsqflite/provider/todos.dart';
import 'package:todoappsqflite/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => Todos(), child: TodoScreen()),
    );
  }
}
