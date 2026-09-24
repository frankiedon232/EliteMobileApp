import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Illustration built from icons: a big icon in a white circle on concentric pastel rings, with two
/// small floating chips. Used by onboarding and login (docs/UI_DESIGN.md §6.1–6.2).
class PastelIllustration extends StatelessWidget {
  const PastelIllustration({
    required this.icon,
    required this.color,
    super.key,
    this.chips = const [],
    this.size = 220,
  });

  final IconData icon;
  final Color color;

  /// Up to two small icons floating around the main one.
  final List<IconData> chips;
  final double size;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    Widget ring(double d, double alpha) => Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: p.surface.withValues(alpha: alpha),
      ),
    );
    Widget chip(IconData i) => Container(
      width: size * 0.22,
      height: size * 0.22,
      decoration: BoxDecoration(color: p.surface, shape: BoxShape.circle, boxShadow: p.shadow),
      child: Icon(i, size: size * 0.1, color: p.lavender),
    );

    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ring(size, 0.25),
            ring(size * 0.74, 0.45),
            Container(
              width: size * 0.48,
              height: size * 0.48,
              decoration: BoxDecoration(color: p.surface, shape: BoxShape.circle, boxShadow: p.shadow),
              child: Icon(icon, size: size * 0.22, color: p.ink),
            ),
            if (chips.isNotEmpty) Positioned(top: size * 0.08, right: size * 0.06, child: chip(chips[0])),
            if (chips.length > 1) Positioned(bottom: size * 0.1, left: size * 0.04, child: chip(chips[1])),
          ],
        ),
      ),
    );
  }
}
