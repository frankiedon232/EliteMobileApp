import 'package:flutter/material.dart';

import '../../../../core/widgets/page_scaffold.dart';
import '../../../../core/widgets/phase_placeholder.dart';
import '../../../../core/widgets/round_icon_button.dart';

/// Monitoring list: one screen parameterised by the v1 filter key. Built in M5.
class TerminalsScreen extends StatelessWidget {
  const TerminalsScreen({required this.filter, super.key});

  final String filter;

  @override
  Widget build(BuildContext context) => PageScaffold(
    title: 'Terminals',
    subtitle: Text('Filter: $filter'),
    actions: [RoundIconButton(icon: Icons.tune_rounded, tooltip: 'Filters', onPressed: () {})],
    body: PhasePlaceholder(icon: Icons.atm_rounded, title: 'Terminals · filter "$filter"', phase: 'M5'),
  );
}
