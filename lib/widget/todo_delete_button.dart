import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/dialog.dart';
import 'package:to_do_alpha/util/light_floating_button.dart';
import 'package:to_do_alpha/util/text_dialog.dart';

class TodoDeleteButton extends StatelessWidget {
  final VoidCallback onDelete;

  const TodoDeleteButton({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return LightFloatingButton(
      icon: Icons.delete,

      onPressed: () {
        showLightDialog(
          context,

          pageBuilder: (ctx, a1, a2) {
            return TextDialog(
              title: "确认删除吗？",
              subtitle: "删除后不可撤销，你确定吗？",

              onConfirm: () {
                Navigator.pop(ctx);
                onDelete();
              },
            );
          },
        );
      },
    );
  }
}
