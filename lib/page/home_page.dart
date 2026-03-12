import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo_list.dart';
import 'package:to_do_alpha/panel/todo_listview.dart';

class HomePage extends StatelessWidget {
  final TodoList todoList;

  const HomePage({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("待办事项 Alpha")),
      body: TodoListView(todoList: todoList),
    );
  }
}
