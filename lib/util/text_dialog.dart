import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/light_dialog.dart';

class TextDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onConfirm;

  const TextDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    final content = subtitle == null ? null : Text(subtitle);

    return LightDialog(
      title: Text(title),
      content: content,
      onConfirm: onConfirm,
    );
  }
}
