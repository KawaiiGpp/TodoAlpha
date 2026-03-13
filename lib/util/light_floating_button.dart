import 'package:flutter/material.dart';

/// 轻巧浮动按钮
///
/// 采用全应用统一的清新轻巧风格。
class LightFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const LightFloatingButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      elevation: 2,
      child: Icon(icon),
    );
  }
}
