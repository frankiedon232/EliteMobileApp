import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/elite_wordmark.dart';

/// Shown while the stored session is checked (`GET /auth/me`). Continues the native splash: the wordmark
/// in a round badge on the pastel canvas, with the three pastel dots gently pulsing.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final dots = [const Color(0xFF7FD9C4), p.lavender, const Color(0xFFFFB595)];

    return Scaffold(
      body: Center(
        child: Semantics(
          label: 'Elite Mobile is starting',
          child: Container(
            width: 176,
            height: 176,
            decoration: BoxDecoration(color: p.surface, shape: BoxShape.circle, boxShadow: p.shadow),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EliteWordmark(height: 36, color: dark ? Colors.white : AppColors.navy900),
                const SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final (i, c) in dots.indexed)
                      Container(
                            width: 9,
                            height: 9,
                            margin: const EdgeInsets.symmetric(horizontal: 3.5),
                            decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                          )
                          .animate(onPlay: (c) => reduceMotion ? null : c.repeat(reverse: true))
                          .scaleXY(
                            begin: 1,
                            end: 1.45,
                            delay: (i * 160).ms,
                            duration: 480.ms,
                            curve: Curves.easeInOut,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
