import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/constants.dart';

/// 轻巧卡片组件
///
/// 外观轻巧，给人以清爽的感觉。
///
/// - [margin] 为卡片外间距
/// - [padding] 为卡片内间距
/// - [child] 为内部包裹的子组件
/// - [onTap] 为点击回调函数，为空则无点击动画
///
/// [onTap] 不为空时，组件被 [InkWell] 包裹。
class LightCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  /// 创建一张卡片
  ///
  /// - [child] 代表子组件
  /// - [onTap] 在被点击时触发
  const LightCard({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: margin,

      decoration: BoxDecoration(
        boxShadow: [shadow],
        borderRadius: borderRadius,
      ),

      child: Material(
        color: scheme.surfaceContainerLowest,
        borderRadius: borderRadius,
        clipBehavior: .antiAlias,
        child: _buildContent(),
      ),
    );
  }

  Widget? _buildContent() {
    final pad = padding;
    final content = pad == null ? child : Padding(padding: pad, child: child);

    return onTap == null ? content : InkWell(onTap: onTap, child: content);
  }
}
