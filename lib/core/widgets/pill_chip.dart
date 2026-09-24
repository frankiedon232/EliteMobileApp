import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// White pill with a leading icon in a coloured circle (e.g. the region selector), optional chevron.
class PillChip extends StatelessWidget {
  const PillChip({
    required this.label,
    required this.icon,
    super.key,
    this.iconColor,
    this.onTap,
    this.showChevron = false,
  });

  final String label;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final accent = iconColor ?? p.lavender;
    return Material(
      color: p.surface,
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 6, 14, 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
                child: Icon(icon, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showChevron) ...[
                const SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: p.inkMuted),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
