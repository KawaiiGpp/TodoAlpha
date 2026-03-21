import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/light_dialog.dart';

typedef PageBuilder =
    Widget Function(
      BuildContext pageCtx,
      Animation<double> animation1,
      Animation<double> animation2,
    );

typedef TransitionBuilder =
    Widget Function(
      BuildContext transitionCtx,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child,
    );

/// 弹出轻巧风格的弹窗
///
/// 建议搭配Light系列组件使用。
/// 风格与应用统一，背景附带模糊效果。
///
/// [preventPop] 代表是否允许用户返回
Future<void> showLightDialog(
  BuildContext context, {
  required PageBuilder pageBuilder,
  TransitionBuilder? transitionBuilder,
  bool preventPop = false,
}) {
  final tb =
      transitionBuilder ??
      (ctx, a1, a2, child) => LightTransition(animation: a1, child: child);

  Widget buildPage(ctx, a1, a2) => preventPop
      ? PopScope(canPop: false, child: pageBuilder(ctx, a1, a2))
      : pageBuilder(ctx, a1, a2);

  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black12,

    transitionBuilder: tb,
    pageBuilder: buildPage,
  );
}
