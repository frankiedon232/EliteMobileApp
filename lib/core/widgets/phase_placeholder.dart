import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'elite_card.dart';

/// Temporary body for screens that are built in a later roadmap phase.
class PhasePlaceholder extends StatelessWidget {
  const PhasePlaceholder({
    required this.icon,
    required this.title,
    required this.phase,
    super.key,
    this.tint,
  });

  final IconData icon;
  final String title;
  final String phase;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    return EliteCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(color: tint ?? p.lavenderSoft, shape: BoxShape.circle),
              child: Icon(icon, size: 38, color: p.ink),
            ),
            const SizedBox(height: 16),
            Text(title, style: text.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: 6),
            Text('Coming in phase $phase', style: text.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
