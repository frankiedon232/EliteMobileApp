import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/page_scaffold.dart';
import '../../../../core/widgets/phase_placeholder.dart';

/// Profile, lookup, backed-out, watchlist, notifications, settings, about, logout. Built across M2–M8.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) => PageScaffold(
    title: 'More',
    body: PhasePlaceholder(
      icon: Icons.grid_view_rounded,
      title: 'More',
      phase: 'M2–M8',
      tint: AppPalette.of(context).peach,
    ),
  );
}
