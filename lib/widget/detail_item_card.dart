import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/light_card.dart';

class DetailItemCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String content;

  const DetailItemCard({
    super.key,
    required this.icon,
    required this.name,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final font = theme.textTheme;

    return LightCard(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),

          Text(name, style: font.titleMedium),
          const SizedBox(width: 24),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,

              child: Text(content, style: font.titleMedium),
            ),
          ),
        ],
      ),
    );
  }
}
