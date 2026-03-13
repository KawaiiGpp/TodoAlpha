import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/constants.dart';
import 'package:to_do_alpha/util/dialog.dart';

/// 轻巧弹窗组件
///
/// 与应用统一的风格，
/// 推荐搭配 [showLightDialog] 使用。
///
/// - [title] 为标题组件
/// - [content] 为内容组件
/// - [onConfirm] 为点击确认时触发的回调
class LightDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final VoidCallback onConfirm;

  const LightDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return AlertDialog(
      title: title,
      content: content,

      backgroundColor: scheme.surface.withAlpha(215),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),

      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("取消"),
        ),

        FilledButton(onPressed: onConfirm, child: const Text("确定")),
      ],
    );
  }
}

/// 毛玻璃背景遮罩
///
/// 与应用统一风格，
/// 推荐搭配 [showLightDialog] 使用。
///
/// - [sigma] 背景虚化程度，默认为1.5
class LightTransition extends StatelessWidget {
  final double sigma;
  final Animation<double> animation;
  final Widget child;

  const LightTransition({
    super.key,
    this.sigma = 1.5,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}
