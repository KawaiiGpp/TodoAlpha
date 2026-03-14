import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/light_dialog.dart';

/// 纯文本弹窗组件
///
/// 基于 [LightDialog]，保持统一的风格。
///
/// [title] 代表标题文本
/// [subtitle] 可选，代表内容或副标题
/// [onConfirm] 当确认点击时触发
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
