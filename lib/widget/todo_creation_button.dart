import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/dialog.dart';
import 'package:to_do_alpha/util/light_dialog.dart';
import 'package:to_do_alpha/util/light_floating_button.dart';
import 'package:to_do_alpha/util/text_field_dialog.dart';

class TodoCreationButton extends StatelessWidget {
  final ValueChanged<String> onCreation;

  const TodoCreationButton({super.key, required this.onCreation});

  @override
  Widget build(BuildContext context) {
    return LightFloatingButton(
      icon: Icons.add,

      onPressed: () => showLightDialog(
        context,

        pageBuilder: (ctx, a1, a2) {
          return TextFieldDialog(
            title: const Text("创建待办事项"),
            hintText: "请在此输入事项名称 ...",
            onInputCheck: _onInputCheck,

            onSubmit: (text) {
              Navigator.pop(ctx);
              onCreation(text);
            },
          );
        },

        transitionBuilder: (ctx, a1, a2, child) {
          return LightTransition(sigma: 1.5, animation: a1, child: child);
        },
      ),
    );
  }

  String? _onInputCheck(String input) {
    if (input.isEmpty) {
      return "名称不可为空";
    }

    return null;
  }
}
