import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class SegmentOption<T> {
  const SegmentOption(this.value, this.label, {this.icon});

  final T value;
  final String label;
  final IconData? icon;
}

/// Pill-shaped segmented control: the selected option is a black pill (like "One Way / Round Trip").
class SegmentedPill<T> extends StatelessWidget {
  const SegmentedPill({required this.options, required this.selected, required this.onChanged, super.key});

  final List<SegmentOption<T>> options;
  final T selected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: p.surfaceMuted, borderRadius: BorderRadius.circular(999)),
      child: Row(
        children: [
          for (final o in options)
            Expanded(
              child: Semantics(
                button: true,
                selected: o.value == selected,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onChanged(o.value),
                  child: AnimatedContainer(
                    duration: AppTheme.motion,
                    curve: AppTheme.motionCurve,
                    height: 44,
                    decoration: BoxDecoration(
                      color: o.value == selected ? p.inverse : Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (o.icon != null) ...[
                          Icon(o.icon, size: 18, color: o.value == selected ? p.onInverse : p.inkMuted),
                          const SizedBox(width: 6),
                        ],
                        Flexible(
                          child: Text(
                            o.label,
                            overflow: TextOverflow.ellipsis,
                            style: text.labelMedium?.copyWith(
                              color: o.value == selected ? p.onInverse : p.inkMuted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
