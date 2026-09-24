import 'dart:async';

import 'package:elite_mobile/core/theme/typography.dart';

/// Runs before every test file: no network font fetching in tests.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  AppTypography.useGoogleFonts = false;
  await testMain();
}
