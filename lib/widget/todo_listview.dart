import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/data/todo_list.dart';
import 'package:to_do_alpha/page/detail_page.dart';
import 'package:to_do_alpha/util/dialog.dart';
import 'package:to_do_alpha/util/light_loader.dart';
import 'package:to_do_alpha/widget/failed_saving_dialog.dart';
import 'package:to_do_alpha/widget/todo_card.dart';

class TodoListView extends StatefulWidget {
  final TodoList todoList;

  const TodoListView({super.key, required this.todoList});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TodoListView> {
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildListView(),
        if (_saving) _buildLoadingIndicatorOverlay(),
      ],
    );
  }

  Widget _buildListView() {
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

  Widget _buildLoadingIndicatorOverlay() {
    return AbsorbPointer(absorbing: true, child: const LightLoader());
  }

  Future<void> _onToggled(Todo todo, bool value) async {
    setState(() {
      _saving = true;
      todo.completed = value;
    });

    try {
      await widget.todoList.save();
    } catch (exception) {
      if (!mounted) return;

      await showLightDialog(
        context,
        pageBuilder: (ctx, a1, a2) => FailedSavingDialog(exception: exception),
      );
    }

    if (!mounted) return;
    setState(() => _saving = false);
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

  void _onDelete(Todo todo) async {
    final todoList = widget.todoList;
    setState(() => todoList.remove(todo));

    try {
      await todoList.save();
    } catch (exception) {
      if (!mounted) return;

      await showLightDialog(
        context,
        pageBuilder: (ctx, a1, a2) => FailedSavingDialog(exception: exception),
      );
    }
  }
}
