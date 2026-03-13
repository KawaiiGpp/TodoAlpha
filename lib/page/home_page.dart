import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/data/todo_list.dart';
import 'package:to_do_alpha/panel/todo_listview.dart';
import 'package:to_do_alpha/util/dialog.dart';
import 'package:to_do_alpha/widget/light_dialog.dart';
import 'package:to_do_alpha/widget/text_field_dialog.dart';

class HomePage extends StatelessWidget {
  final TodoList todoList;

  const HomePage({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("待办事项 Alpha")),
      body: TodoListView(todoList: todoList),
      floatingActionButton: _buildTodoCreationButton(context),
    );
  }

  FloatingActionButton _buildTodoCreationButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showLightDialog(
        context,

        pageBuilder: (ctx, a1, a2) {
          return TextFieldDialog(
            title: const Text("创建待办事项"),
            hintText: "请在此输入事项名称 ...",
            onSubmit: (text) {},
            onInputCheck: _onInputCheck,
          );
        },

        transitionBuilder: (ctx, a1, a2, child) {
          return LightTransition(sigma: 1.5, animation: a1, child: child);
        },
      ),

      elevation: 2,
      child: const Icon(Icons.add),
    );
  }

  String? _onInputCheck(String input) {
    if (input.isEmpty) return "名称不可为空";
    return null;
  }

  void _onNewTodoCreated(Todo todo) {}
}
