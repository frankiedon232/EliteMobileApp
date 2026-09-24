import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../session_controller.dart';
import '../widgets/pastel_illustration.dart';

/// 3 slides, shown once (FEATURES §1.1; copy from docs/LEGACY_APP.md §2.1).
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _Slide {
  const _Slide(this.title, this.body, this.icon, this.chips, this.tint);

  final String title;
  final String body;
  final IconData icon;
  final List<IconData> chips;
  final Color Function(AppPalette) tint;
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  var _page = 0;

  static final _slides = [
    _Slide(
      'Your ATM estate,\nin your pocket',
      'Elite Mobile gives you the real-time status of the entire ATM estate. Check your ATMs right here, '
          'right now.',
      Icons.atm_rounded,
      [Icons.wifi_rounded, Icons.payments_rounded],
      (p) => p.mint,
    ),
    _Slide(
      'Sign in with\nyour AD account',
      'Elite Mobile uses Active Directory authentication, so only approved and authorised users can sign in.',
      Icons.badge_rounded,
      [Icons.verified_user_rounded, Icons.key_rounded],
      (p) => p.lavenderSoft,
    ),
    _Slide(
      'Secure from\nend to end',
      'Elite Mobile runs on a secure layer: all data, including your sign-in, is encrypted in transit.',
      Icons.shield_rounded,
      [Icons.lock_rounded, Icons.fingerprint_rounded],
      (p) => p.sky,
    ),
  ];

  bool get _isLast => _page == _slides.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() => ref.read(onboardingSeenProvider.notifier).complete();

  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(duration: AppTheme.motion, curve: AppTheme.motionCurve);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                child: AnimatedOpacity(
                  opacity: _isLast ? 0 : 1,
                  duration: AppTheme.motion,
                  child: TextButton(onPressed: _isLast ? null : _finish, child: const Text('Skip')),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final s = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.screenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: s.tint(p),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            alignment: Alignment.center,
                            child: LayoutBuilder(
                              builder: (context, c) => PastelIllustration(
                                icon: s.icon,
                                chips: s.chips,
                                color: s.tint(p),
                                size: (c.biggest.shortestSide * 0.8).clamp(140, 260),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(s.title, style: text.displaySmall),
                        const SizedBox(height: 12),
                        Text(s.body, style: text.bodyLarge?.copyWith(color: p.inkMuted)),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(AppTheme.screenPadding, 20, AppTheme.screenPadding, 20),
              child: Row(
                children: [
                  Semantics(
                    label: 'Page ${_page + 1} of ${_slides.length}',
                    child: Row(
                      children: [
                        for (var i = 0; i < _slides.length; i++)
                          AnimatedContainer(
                            duration: AppTheme.motion,
                            curve: AppTheme.motionCurve,
                            margin: const EdgeInsets.only(right: 6),
                            width: i == _page ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: i == _page ? p.lavender : p.outline,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: _next,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_isLast ? 'Get started' : 'Continue'),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
