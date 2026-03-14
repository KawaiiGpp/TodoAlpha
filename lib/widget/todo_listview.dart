import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/data/todo_list.dart';
import 'package:to_do_alpha/page/detail_page.dart';
import 'package:to_do_alpha/widget/todo_card.dart';

class TodoListView extends StatefulWidget {
  final TodoList todoList;

  const TodoListView({super.key, required this.todoList});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    final todoList = widget.todoList;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 6),
      itemCount: todoList.length,

      itemBuilder: (ctx, index) {
        final todo = todoList[index];

        return TodoCard(
          todo: todo,
          onToggled: (value) => _onToggled(todo, value),
          onGoDetail: () => _onGoDetail(todo),
        );
      },
    );
  }

  void _onToggled(Todo todo, bool value) {
    setState(() => todo.completed = value);
  }

  void _onGoDetail(Todo todo) {
    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (ctx) {
          return DetailPage(todo: todo, onDelete: () => _onDelete(todo));
        },
      ),
    );
  }

  void _onDelete(Todo todo) {
    setState(() => widget.todoList.remove(todo));
  }
}
