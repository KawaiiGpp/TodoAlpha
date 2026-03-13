import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/data/todo_list.dart';
import 'package:to_do_alpha/widget/todo_creation_button.dart';
import 'package:to_do_alpha/widget/todo_listview.dart';

class HomePage extends StatefulWidget {
  final TodoList todoList;

  const HomePage({super.key, required this.todoList});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("待办事项 Alpha")),
      body: TodoListView(todoList: widget.todoList),
      floatingActionButton: TodoCreationButton(onCreation: _onTodoCreation),
    );
  }

  void _onTodoCreation(String name) {
    final todo = Todo.createNew(name);
    setState(() => widget.todoList.add(todo));
  }
}