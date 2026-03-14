import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/util/constants.dart';
import 'package:to_do_alpha/widget/detail_item_card.dart';

class TodoDetailPanel extends StatelessWidget {
  final Todo todo;

  const TodoDetailPanel({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 5),

      children: [
        DetailItemCard(
          icon: Icons.font_download,
          name: "名称",
          content: todo.name,
        ),

        DetailItemCard(
          icon: Icons.event_available,
          name: "创建日期",
          content: dateFormat.format(todo.createTime),
        ),

        DetailItemCard(
          icon: Icons.check_box,
          name: "已完成",
          content: todo.completed ? "是" : "否",
        ),
      ],
    );
  }
}
