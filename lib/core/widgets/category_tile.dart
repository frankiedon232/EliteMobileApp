import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Pastel tile: label top-left, large icon bottom-right, optional badge (e.g. offline count).
class CategoryTile extends StatelessWidget {
  const CategoryTile({
    required this.label,
    required this.icon,
    required this.color,
    super.key,
    this.badge,
    this.onTap,
    this.width = 104,
    this.height = 96,
  });

  final String label;
  final IconData icon;
  final Color color;
  final String? badge;
  final VoidCallback? onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    return Semantics(
      button: onTap != null,
      label: badge == null ? label : '$label, $badge',
      excludeSemantics: true,
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(AppTheme.blockRadius),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Positioned(left: 12, top: 10, right: 8, child: Text(label, style: text.labelMedium)),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(color: p.surface.withValues(alpha: 0.7), shape: BoxShape.circle),
                    child: Icon(icon, size: 24, color: p.ink),
                  ),
                ),
                if (badge != null)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: p.inverse, borderRadius: BorderRadius.circular(999)),
                      child: Text(
                        badge!,
                        style: text.labelSmall?.copyWith(color: p.onInverse, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
