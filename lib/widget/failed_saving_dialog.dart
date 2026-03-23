import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/text_dialog.dart';

class FailedSavingDialog extends StatelessWidget {
  final Object exception;

  const FailedSavingDialog({super.key, required this.exception});

  @override
  Widget build(BuildContext context) {
    return TextDialog(
      title: "保存失败",
      subtitle: "更改未保存，请联系开发者：$exception",
      onConfirm: () => Navigator.pop(context),
    );
  }
}
