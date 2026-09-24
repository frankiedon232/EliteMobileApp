import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Floating capsule bottom bar, icons only: Overview · Terminals · Performance · More
/// (docs/UI_DESIGN.md §4). Screens add bottom padding of [AppShell.bottomInset].
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  /// Space screens keep free at the bottom so content scrolls clear of the floating bar.
  static const bottomInset = 104.0;

  static const _items = [
    (Icons.space_dashboard_outlined, Icons.space_dashboard_rounded, 'Overview'),
    (Icons.atm_outlined, Icons.atm_rounded, 'Terminals'),
    (Icons.insights_outlined, Icons.insights_rounded, 'Performance'),
    (Icons.grid_view_outlined, Icons.grid_view_rounded, 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: p.surface,
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
            boxShadow: const [BoxShadow(color: Color(0x1A28205A), blurRadius: 30, offset: Offset(0, 10))],
          ),
          child: Row(
            children: [
              for (final (i, (icon, activeIcon, label)) in _items.indexed)
                Expanded(
                  child: _NavItem(
                    icon: icon,
                    activeIcon: activeIcon,
                    label: label,
                    selected: i == navigationShell.currentIndex,
                    // Re-tapping the active tab returns to its root.
                    onTap: () =>
                        navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: Tooltip(
        message: label,
        child: InkResponse(
          onTap: onTap,
          radius: 32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: AppTheme.motion,
                child: Icon(
                  selected ? activeIcon : icon,
                  key: ValueKey(selected),
                  size: 26,
                  color: selected ? p.lavender : p.inkMuted,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: AppTheme.motion,
                curve: AppTheme.motionCurve,
                width: selected ? 18 : 0,
                height: 4,
                decoration: BoxDecoration(color: p.lavender, borderRadius: BorderRadius.circular(2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
