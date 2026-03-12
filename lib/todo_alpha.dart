import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/page/home_page.dart';

class TodoAlpha extends StatefulWidget {
  const TodoAlpha({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TodoAlpha> {
  final todoList = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
      home: HomePage(todoList: todoList),
    );
  }
}
