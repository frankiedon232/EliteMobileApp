import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Type scale (docs/UI_DESIGN.md §2): Urbanist for UI, JetBrains Mono for ids and amounts.
/// All numbers use tabular figures.
abstract final class AppTypography {
  static const tabular = [FontFeature.tabularFigures()];

  /// Tests set this to false (test/flutter_test_config.dart) so no fonts are fetched.
  static bool useGoogleFonts = true;

  static TextTheme textTheme(Color ink, Color inkMuted) {
    TextStyle s(double size, FontWeight weight, {Color? color, double? height, double? spacing}) {
      final style = TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color ?? ink,
        height: height,
        letterSpacing: spacing,
        fontFeatures: tabular,
      );
      return useGoogleFonts ? GoogleFonts.urbanist(textStyle: style) : style;
    }

    return TextTheme(
      displayLarge: s(40, FontWeight.w600, height: 1.1, spacing: -0.8),
      displayMedium: s(34, FontWeight.w600, height: 1.1, spacing: -0.6),
      displaySmall: s(30, FontWeight.w600, height: 1.15, spacing: -0.4),
      headlineLarge: s(28, FontWeight.w600, height: 1.2, spacing: -0.4),
      headlineMedium: s(24, FontWeight.w600, height: 1.2, spacing: -0.2),
      headlineSmall: s(20, FontWeight.w600, height: 1.25),
      titleLarge: s(18, FontWeight.w600, height: 1.3),
      titleMedium: s(16, FontWeight.w600, height: 1.3),
      titleSmall: s(14, FontWeight.w600, height: 1.3),
      bodyLarge: s(15, FontWeight.w500, height: 1.45),
      bodyMedium: s(14, FontWeight.w500, height: 1.45),
      bodySmall: s(12, FontWeight.w500, color: inkMuted, height: 1.4),
      labelLarge: s(15, FontWeight.w600),
      labelMedium: s(13, FontWeight.w600),
      labelSmall: s(12, FontWeight.w500, color: inkMuted),
    );
  }

  /// Monospaced style for terminal ids and amounts in tables.
  static TextStyle mono({double size = 14, FontWeight weight = FontWeight.w500, Color? color}) {
    final style = TextStyle(fontSize: size, fontWeight: weight, color: color, fontFeatures: tabular);
    return useGoogleFonts
        ? GoogleFonts.jetBrainsMono(textStyle: style)
        : style.copyWith(fontFamily: 'monospace');
  }
}
