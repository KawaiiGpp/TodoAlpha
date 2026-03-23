import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/data/todo_list.dart';
import 'package:to_do_alpha/util/dialog.dart';
import 'package:to_do_alpha/util/text_dialog.dart';
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

  Future<void> _onTodoCreation(String name) async {
    final todo = Todo.createNew(name);
    setState(() => widget.todoList.add(todo));

    try {
      await widget.todoList.save();
    } catch (exception) {
      if (!mounted) return;

      showLightDialog(
        context,

        pageBuilder: (ctx, a1, a2) => TextDialog(
          title: "保存失败",
          subtitle: "新事项未储存，请联系开发者。\n$exception",
          onConfirm: () => Navigator.pop(context),
        ),
      );
    }
  }
}
