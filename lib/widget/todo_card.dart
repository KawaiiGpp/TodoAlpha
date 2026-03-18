import 'package:flutter/material.dart';
import 'package:to_do_alpha/data/todo.dart';
import 'package:to_do_alpha/util/light_card.dart';

/// 待办事项卡片
///
/// 显示单个待办事项。
class TodoCard extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool> onToggled;
  final VoidCallback onGoDetail;

  /// 创建一张待办事项卡片
  ///
  /// - [onToggled] 在复选框被更改时触发
  /// - [onGoDetail] 在详情按钮被点击时触发
  const TodoCard({
    super.key,
    required this.todo,
    required this.onToggled,
    required this.onGoDetail,
  });

  @override
  Widget build(BuildContext context) {
    final font = Theme.of(context).textTheme;

    return LightCard(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),

      child: Row(
        children: [
          Checkbox(
            value: todo.completed,
            onChanged: (value) => onToggled(value ?? false),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(todo.name, style: font.titleMedium),
            ),
          ),

          const SizedBox(width: 8),

          IconButton(
            onPressed: onGoDetail,
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
