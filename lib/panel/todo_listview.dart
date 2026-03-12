import 'package:flutter/cupertino.dart';
import 'package:to_do_alpha/data/todo_list.dart';

class TodoListView extends StatefulWidget {
  final TodoList todoList;

  const TodoListView({super.key, required this.todoList});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    final list = widget.todoList.items;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) {
        return Container(); // build cards
      },
    );
  }
}
