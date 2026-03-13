import 'package:flutter/material.dart';

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

Future<void> showLightDialog(
  BuildContext context, {
  required PageBuilder pageBuilder,
  required TransitionBuilder transitionBuilder,
}) {
  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black12,

    pageBuilder: pageBuilder,
    transitionBuilder: transitionBuilder,
  );
}
