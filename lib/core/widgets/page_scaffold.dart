import 'package:flutter/material.dart';

import '../router/app_shell.dart';
import '../theme/app_theme.dart';
import 'round_icon_button.dart';

/// Screen layout from docs/UI_DESIGN.md §4: round icon buttons on top, a large title (two lines
/// allowed) and a muted subtitle, then the scrollable body.
class PageScaffold extends StatelessWidget {
  const PageScaffold({
    required this.title,
    required this.body,
    super.key,
    this.subtitle,
    this.leading,
    this.actions = const [],
    this.inShell = true,
  });

  final String title;
  final Widget? subtitle;
  final Widget body;

  /// Usually a back [RoundIconButton]; null on tab roots.
  final Widget? leading;
  final List<Widget> actions;

  /// Leaves room for the floating bottom bar.
  final bool inShell;

  static Widget back(BuildContext context) => RoundIconButton(
    icon: Icons.arrow_back_rounded,
    tooltip: 'Back',
    onPressed: () => Navigator.of(context).maybePop(),
  );

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(AppTheme.screenPadding, 12, AppTheme.screenPadding, 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (leading != null || actions.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            ?leading,
                            const Spacer(),
                            for (final (i, a) in actions.indexed) ...[
                              if (i > 0) const SizedBox(width: 10),
                              a,
                            ],
                          ],
                        ),
                      ),
                    Text(title, style: text.headlineLarge),
                    if (subtitle != null) ...[
                      const SizedBox(height: 6),
                      DefaultTextStyle.merge(
                        style: text.bodyMedium?.copyWith(color: text.bodySmall?.color),
                        child: subtitle!,
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                AppTheme.screenPadding,
                0,
                AppTheme.screenPadding,
                inShell ? AppShell.bottomInset : 24,
              ),
              sliver: SliverToBoxAdapter(child: body),
            ),
          ],
        ),
      ),
    );
  }
}
