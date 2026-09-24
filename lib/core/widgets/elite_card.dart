import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Base card: white, radius 28, soft shadow in light mode, optional ripple (docs/UI_DESIGN.md §5).
class EliteCard extends StatelessWidget {
  const EliteCard({
    required this.child,
    super.key,
    this.onTap,
    this.padding = const EdgeInsets.all(AppTheme.cardPadding),
    this.color,
    this.radius = AppTheme.cardRadius,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final shape = BorderRadius.circular(radius);
    return DecoratedBox(
      decoration: BoxDecoration(color: color ?? p.surface, borderRadius: shape, boxShadow: p.shadow),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
