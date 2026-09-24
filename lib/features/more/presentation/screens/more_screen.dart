import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_mode_controller.dart';
import '../../../../core/utils/names.dart';
import '../../../../core/widgets/elite_card.dart';
import '../../../../core/widgets/page_scaffold.dart';
import '../../../../core/widgets/segmented_pill.dart';
import '../../../auth/domain/auth_models.dart';
import '../../../auth/presentation/session_controller.dart';

/// Profile, then grouped tiles (docs/UI_DESIGN.md §6.7). Lookup, backed-out, watchlist, notifications,
/// settings and about are wired up in M5–M8.
class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final p = AppPalette.of(context);

    return PageScaffold(
      title: 'More',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (session is SignedIn) _ProfileCard(user: session.user, scope: session.scope),
          const SizedBox(height: AppTheme.cardGap),
          EliteCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Appearance', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                SegmentedPill<ThemeMode>(
                  options: [for (final m in ThemeMode.values) SegmentOption(m, m.label, icon: m.icon)],
                  selected: ref.watch(appThemeModeProvider),
                  onChanged: (m) => ref.read(appThemeModeProvider.notifier).set(m),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.cardGap),
          EliteCard(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              children: [
                _Tile(icon: Icons.search_rounded, tint: p.sky, label: 'Terminal lookup', soon: 'M5'),
                _Tile(
                  icon: Icons.history_toggle_off_rounded,
                  tint: p.peach,
                  label: 'Backed-out terminals',
                  soon: 'M6',
                ),
                _Tile(icon: Icons.star_outline_rounded, tint: p.butter, label: 'Watchlist', soon: 'M6'),
                _Tile(
                  icon: Icons.notifications_none_rounded,
                  tint: p.lavenderSoft,
                  label: 'Notifications',
                  soon: 'M7',
                ),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.cardGap),
          EliteCard(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              children: [
                _Tile(icon: Icons.tune_rounded, tint: p.mint, label: 'Settings', soon: 'M8'),
                _Tile(icon: Icons.info_outline_rounded, tint: p.surfaceMuted, label: 'About', soon: 'M8'),
                _Tile(
                  icon: Icons.logout_rounded,
                  tint: p.danger.withValues(alpha: 0.12),
                  iconColor: p.danger,
                  label: 'Sign out',
                  labelColor: p.danger,
                  onTap: () => _confirmLogout(context, ref),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text('You will need your AD password to sign in again.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Sign out')),
        ],
      ),
    );
    if (ok ?? false) await ref.read(sessionProvider.notifier).logout();
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.user, required this.scope});

  final User user;
  final Scope scope;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    final name = titleCase(user.displayName);
    final regions = scope.allRegions ? 'All regions' : scope.regions.join(', ');

    return EliteCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: p.lavenderSoft,
            child: Text(initials(name), style: text.titleLarge?.copyWith(color: p.lavender)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: text.titleLarge, overflow: TextOverflow.ellipsis),
                if (user.email != null)
                  Text(user.email!, style: text.bodySmall, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    if (user.role != null) _Chip(user.role!, p.lavenderSoft),
                    _Chip(regions, p.mint),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(999)),
    child: Text(
      label,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppPalette.of(context).ink),
    ),
  );
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.icon,
    required this.tint,
    required this.label,
    this.iconColor,
    this.labelColor,
    this.onTap,
    this.soon,
  });

  final IconData icon;
  final Color tint;
  final Color? iconColor;
  final String label;
  final Color? labelColor;
  final VoidCallback? onTap;

  /// Phase in which the destination is built (shown as a hint until then).
  final String? soon;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: tint,
        child: Icon(icon, size: 20, color: iconColor ?? p.ink),
      ),
      title: Text(label, style: text.titleSmall?.copyWith(color: labelColor)),
      trailing: soon != null
          ? Text('Soon', style: text.labelSmall)
          : Icon(Icons.chevron_right_rounded, color: p.inkMuted),
      onTap: onTap,
      enabled: onTap != null || soon == null,
    );
  }
}
