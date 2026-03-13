import 'package:flutter/cupertino.dart';
import 'package:to_do_alpha/data/todo_list.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: todoList.length,

      itemBuilder: (ctx, index) {
        return TodoCard(
          todo: todoList[index],
          onToggled: (value) => _onToggled(index, value),
          onGoDetail: _onGoDetail,
        ); // build cards
      },
    );
  }

  void _onToggled(int index, bool value) {
    setState(() => widget.todoList[index].completed = value);
  }

  void _onGoDetail() {} // todo: navigation for going detail.
}
