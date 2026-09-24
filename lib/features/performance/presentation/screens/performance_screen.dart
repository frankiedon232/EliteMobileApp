import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/page_scaffold.dart';
import '../../../../core/widgets/phase_placeholder.dart';

/// Realtime + Report tabs. Built in M6.
class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) => PageScaffold(
    title: 'Performance',
    subtitle: const Text('Uptime and downtime across your terminals'),
    body: PhasePlaceholder(
      icon: Icons.insights_rounded,
      title: 'Performance',
      phase: 'M6',
      tint: AppPalette.of(context).mint,
    ),
  );
}
