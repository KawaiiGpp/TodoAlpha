import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/dialog.dart';

/// 轻巧加载动画
///
/// 与应用统一的风格，
/// 推荐搭配 [showLightDialog] 使用以实现背景模糊。
class LightLoader extends StatelessWidget {
  const LightLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        strokeCap: StrokeCap.round,
        valueColor: AlwaysStoppedAnimation<Color>(scheme.primary),
        backgroundColor: scheme.primary.withAlpha(50)
      ),
    );
  }
}
