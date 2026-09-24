import 'package:elite_mobile/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fakes.dart';

void main() {
  testWidgets('signed in: 4 tabs, API status, tab switching and tile deep link', (tester) async {
    final secure = MemorySecureStore();
    await seedSession(secure);
    await tester.pumpWidget(
      ProviderScope(
        overrides: appOverrides(secure: secure, prefs: MemoryPrefs(), auth: FakeAuthRepository()),
        child: const EliteApp(),
      ),
    );
    await tester.pumpAndSettle();

    for (final label in ['Overview', 'Terminals', 'Performance', 'More']) {
      expect(find.byTooltip(label), findsOneWidget);
    }
    expect(find.text('Connected · API 1.0.0'), findsOneWidget);
    expect(find.text('elite.unetapps.com via 10.0.2.2'), findsOneWidget);

    await tester.tap(find.text('Offline'));
    await tester.pumpAndSettle();
    expect(find.text('Terminals · filter "offline"'), findsOneWidget);

    await tester.tap(find.byTooltip('Performance'));
    await tester.pumpAndSettle();
    expect(find.text('Uptime and downtime across your terminals'), findsOneWidget);
  });
}
