import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The "elite" wordmark: [color] for "elit", Providus gold for the final "e".
class EliteWordmark extends StatelessWidget {
  const EliteWordmark({super.key, this.height = 32, this.color = Colors.white});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/brand/elite_wordmark.svg',
    height: height,
    theme: SvgTheme(currentColor: color),
    semanticsLabel: 'Elite',
  );
}
