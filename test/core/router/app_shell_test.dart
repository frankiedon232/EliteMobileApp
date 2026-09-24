import 'package:elite_mobile/app.dart';
import 'package:elite_mobile/core/config/app_config.dart';
import 'package:elite_mobile/core/config/config_providers.dart';
import 'package:elite_mobile/core/network/api_health.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shell shows 4 tabs and the API status, and switches tabs', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(
              env: AppEnv.staging,
              apiBaseUrl: 'https://elite.unetapps.com/mobile/api/v1',
              appVersion: '1.0.0',
              stagingHostIp: '10.0.2.2',
              flavor: 'staging',
            ),
          ),
          apiHealthProvider.overrideWith((ref) async => (status: 'ok', version: '1.0.0')),
        ],
        child: const EliteApp(),
      ),
    );
    await tester.pumpAndSettle();

    for (final label in ['Overview', 'Terminals', 'Performance', 'More']) {
      expect(find.byTooltip(label), findsOneWidget);
    }
    expect(find.text('Connected · API 1.0.0'), findsOneWidget);
    expect(find.text('elite.unetapps.com via 10.0.2.2'), findsOneWidget);

    await tester.tap(find.byTooltip('Terminals'));
    await tester.pumpAndSettle();
    expect(find.text('Terminals · filter "all"'), findsOneWidget);
  });
}
