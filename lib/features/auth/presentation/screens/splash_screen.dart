import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/elite_wordmark.dart';

/// Shown briefly while the stored session is checked (`GET /auth/me`).
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EliteWordmark(height: 44, color: dark ? Colors.white : AppColors.navy900),
            const SizedBox(height: 28),
            SizedBox(
              width: 120,
              child: LinearProgressIndicator(borderRadius: BorderRadius.circular(4), color: p.lavender),
            ),
          ],
        ),
      ),
    );
  }
}
