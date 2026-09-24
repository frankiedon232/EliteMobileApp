import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/config_providers.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_health.dart';
import '../../../../core/router/app_shell.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/status_colors.dart';
import '../../../../core/utils/names.dart';
import '../../../../core/widgets/category_tile.dart';
import '../../../../core/widgets/elite_card.dart';
import '../../../../core/widgets/phase_placeholder.dart';
import '../../../../core/widgets/pill_chip.dart';
import '../../../../core/widgets/round_icon_button.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../auth/presentation/session_controller.dart';
import '../../../reference/domain/reference_models.dart';

/// Overview tab (docs/UI_DESIGN.md §6.3). M0/M1: layout, category tiles and the API connection card;
/// live numbers arrive in M4.
class OverviewScreen extends ConsumerWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    final session = ref.watch(sessionProvider);
    final firstName = session is SignedIn ? titleCase(session.user.displayName).split(' ').first : null;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          color: p.lavender,
          onRefresh: () => ref.refresh(apiHealthProvider.future),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, AppShell.bottomInset),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.screenPadding),
                child: Row(
                  children: [
                    const PillChip(label: 'All regions', icon: Icons.place_rounded, showChevron: true),
                    const Spacer(),
                    RoundIconButton(icon: Icons.search_rounded, tooltip: 'Find a terminal', onPressed: () {}),
                    const SizedBox(width: 10),
                    RoundIconButton(
                      icon: Icons.notifications_none_rounded,
                      tooltip: 'Notifications',
                      badge: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName == null
                          ? greeting(DateTime.now())
                          : '${greeting(DateTime.now())}, $firstName',
                      style: text.bodyLarge?.copyWith(color: p.inkMuted),
                    ),
                    const SizedBox(height: 4),
                    Text('Your ATM estate\nat a glance', style: text.displaySmall),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 96,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.screenPadding),
                  children: [
                    CategoryTile(
                      label: 'Online',
                      icon: Icons.wifi_rounded,
                      color: p.mint,
                      onTap: () => context.go(Routes.terminalsFiltered(TerminalFilter.online.key)),
                    ),
                    const SizedBox(width: 10),
                    CategoryTile(
                      label: 'Offline',
                      icon: Icons.wifi_off_rounded,
                      color: p.peach,
                      onTap: () => context.go(Routes.terminalsFiltered(TerminalFilter.offline.key)),
                    ),
                    const SizedBox(width: 10),
                    CategoryTile(
                      label: 'Cash',
                      icon: Icons.payments_rounded,
                      color: p.sky,
                      onTap: () => context.go(Routes.terminalsFiltered(TerminalFilter.lowCash.key)),
                    ),
                    const SizedBox(width: 10),
                    CategoryTile(
                      label: 'Performance',
                      icon: Icons.insights_rounded,
                      color: p.lavenderSoft,
                      onTap: () => context.go(Routes.performance),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppTheme.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SectionHeader(title: 'Connection'),
                    _ApiConnectionCard(),
                    SizedBox(height: 28),
                    SectionHeader(title: 'Real-time status'),
                    PhasePlaceholder(icon: Icons.donut_large_rounded, title: 'Live dashboard', phase: 'M4'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApiConnectionCard extends ConsumerWidget {
  const _ApiConnectionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = AppPalette.of(context);
    final config = ref.watch(appConfigProvider);
    final health = ref.watch(apiHealthProvider);
    final text = Theme.of(context).textTheme;

    final (color, icon, label) = switch (health) {
      AsyncData(:final value) when value.status == 'ok' => (
        StatusColors.active,
        StatusColors.activeIcon,
        'Connected · API ${value.version}',
      ),
      AsyncData(:final value) => (
        StatusColors.closed,
        Icons.warning_amber_rounded,
        'API status: ${value.status}',
      ),
      AsyncError(:final error) => (StatusColors.offline, StatusColors.offlineIcon, _describe(error)),
      _ => (StatusColors.unknown, Icons.sync_rounded, 'Checking…'),
    };

    return EliteCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${config.env.name[0].toUpperCase()}${config.env.name.substring(1)} API',
                  style: text.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(label, style: text.bodyMedium?.copyWith(color: color)),
                const SizedBox(height: 2),
                Text(
                  config.stagingHostIp == null
                      ? Uri.parse(config.apiBaseUrl).host
                      : '${Uri.parse(config.apiBaseUrl).host} via ${config.stagingHostIp}',
                  style: text.bodySmall,
                ),
              ],
            ),
          ),
          if (health.isLoading)
            SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: p.lavender),
            )
          else
            RoundIconButton(
              icon: Icons.refresh_rounded,
              tooltip: 'Retry',
              background: p.surfaceMuted,
              size: 40,
              onPressed: () => ref.invalidate(apiHealthProvider),
            ),
        ],
      ),
    );
  }

  static String _describe(Object error) => error is Failure ? error.message : 'Cannot reach the API.';
}
