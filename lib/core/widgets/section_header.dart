import 'package:flutter/material.dart';

/// Section title on the left and a lavender "View all" (or other action) on the right.
class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, super.key, this.actionLabel = 'View all', this.onAction});

  final String title;
  final String actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
          if (onAction != null)
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8)),
              child: Text(actionLabel),
            ),
        ],
      ),
    );
  }
}
