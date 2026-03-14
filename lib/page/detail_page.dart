import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/widget/todo_delete_button.dart';
import 'package:to_do_alpha/widget/todo_detail_listview.dart';

class DetailPage extends StatelessWidget {
  final Todo todo;
  final VoidCallback onDelete;

  const DetailPage({super.key, required this.todo, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("事项详情")),
      body: TodoDetailListView(todo: todo),

      floatingActionButton: TodoDeleteButton(
        onDelete: () => _onDelete(context),
      ),
    );
  }

  void _onDelete(BuildContext context) {
    Navigator.pop(context);
    onDelete();
  }
}
