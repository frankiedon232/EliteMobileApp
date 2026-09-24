import 'package:flutter/material.dart';

/// Brand colours: logo, app icon and splash only (docs/UI_DESIGN.md §1).
abstract final class AppColors {
  static const navy900 = Color(0xFF011F53);
  static const gold500 = Color(0xFFFCB815);
  static const red500 = Color(0xFFE5353F);

  /// Soft card shadow for light mode (`0 8 24 rgba(40,32,90,0.06)`); dark mode has none.
  static const cardShadow = [BoxShadow(color: Color(0x0F28205A), offset: Offset(0, 8), blurRadius: 24)];
}

/// Light/dark design tokens (docs/UI_DESIGN.md §1), registered as a [ThemeExtension].
/// Read them with `AppPalette.of(context)`.
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.canvas,
    required this.surface,
    required this.surfaceMuted,
    required this.ink,
    required this.inkMuted,
    required this.outline,
    required this.inverse,
    required this.onInverse,
    required this.lavender,
    required this.lavenderSoft,
    required this.mint,
    required this.peach,
    required this.sky,
    required this.butter,
    required this.danger,
    required this.shadow,
  });

  static const light = AppPalette(
    canvas: Color(0xFFF3F2FB),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF7F6FD),
    ink: Color(0xFF15161C),
    inkMuted: Color(0xFF6F7182),
    outline: Color(0xFFECEAF6),
    inverse: Color(0xFF111318),
    onInverse: Color(0xFFFFFFFF),
    lavender: Color(0xFF8B7CF6),
    lavenderSoft: Color(0xFFE4E0FF),
    mint: Color(0xFFCFF1EA),
    peach: Color(0xFFFFE3D6),
    sky: Color(0xFFDDEBFF),
    butter: Color(0xFFFFF1CC),
    danger: Color(0xFFDC2626),
    shadow: AppColors.cardShadow,
  );

  static const dark = AppPalette(
    canvas: Color(0xFF0E0F15),
    surface: Color(0xFF191A23),
    surfaceMuted: Color(0xFF21222D),
    ink: Color(0xFFF2F2F7),
    inkMuted: Color(0xFF9A9CAD),
    outline: Color(0xFF2A2B37),
    inverse: Color(0xFFFFFFFF),
    onInverse: Color(0xFF111318),
    lavender: Color(0xFFA79BFF),
    lavenderSoft: Color(0xFF2E2A4D),
    mint: Color(0xFF1D3A35),
    peach: Color(0xFF43302A),
    sky: Color(0xFF1E2C44),
    butter: Color(0xFF3D3522),
    danger: Color(0xFFFF5A5A),
    shadow: [],
  );

  final Color canvas;
  final Color surface;
  final Color surfaceMuted;
  final Color ink;
  final Color inkMuted;
  final Color outline;

  /// Primary pill button background (black in light mode, white in dark mode) and its content colour.
  final Color inverse;
  final Color onInverse;

  final Color lavender;
  final Color lavenderSoft;
  final Color mint;
  final Color peach;
  final Color sky;
  final Color butter;
  final Color danger;
  final List<BoxShadow> shadow;

  static AppPalette of(BuildContext context) => Theme.of(context).extension<AppPalette>()!;

  @override
  AppPalette copyWith({
    Color? canvas,
    Color? surface,
    Color? surfaceMuted,
    Color? ink,
    Color? inkMuted,
    Color? outline,
    Color? inverse,
    Color? onInverse,
    Color? lavender,
    Color? lavenderSoft,
    Color? mint,
    Color? peach,
    Color? sky,
    Color? butter,
    Color? danger,
    List<BoxShadow>? shadow,
  }) => AppPalette(
    canvas: canvas ?? this.canvas,
    surface: surface ?? this.surface,
    surfaceMuted: surfaceMuted ?? this.surfaceMuted,
    ink: ink ?? this.ink,
    inkMuted: inkMuted ?? this.inkMuted,
    outline: outline ?? this.outline,
    inverse: inverse ?? this.inverse,
    onInverse: onInverse ?? this.onInverse,
    lavender: lavender ?? this.lavender,
    lavenderSoft: lavenderSoft ?? this.lavenderSoft,
    mint: mint ?? this.mint,
    peach: peach ?? this.peach,
    sky: sky ?? this.sky,
    butter: butter ?? this.butter,
    danger: danger ?? this.danger,
    shadow: shadow ?? this.shadow,
  );

  @override
  AppPalette lerp(AppPalette? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppPalette(
      canvas: l(canvas, other.canvas),
      surface: l(surface, other.surface),
      surfaceMuted: l(surfaceMuted, other.surfaceMuted),
      ink: l(ink, other.ink),
      inkMuted: l(inkMuted, other.inkMuted),
      outline: l(outline, other.outline),
      inverse: l(inverse, other.inverse),
      onInverse: l(onInverse, other.onInverse),
      lavender: l(lavender, other.lavender),
      lavenderSoft: l(lavenderSoft, other.lavenderSoft),
      mint: l(mint, other.mint),
      peach: l(peach, other.peach),
      sky: l(sky, other.sky),
      butter: l(butter, other.butter),
      danger: l(danger, other.danger),
      shadow: t < 0.5 ? shadow : other.shadow,
    );
  }
}
