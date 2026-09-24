import 'package:elite_mobile/app.dart';
import 'package:elite_mobile/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fakes.dart';

void main() {
  late MemorySecureStore secure;
  late MemoryPrefs prefs;
  late FakeAuthRepository auth;

  setUp(() {
    secure = MemorySecureStore();
    prefs = MemoryPrefs();
    auth = FakeAuthRepository();
  });

  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: appOverrides(secure: secure, prefs: prefs, auth: auth),
        child: const EliteApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder field(String label) => find.widgetWithText(TextFormField, label);

  testWidgets('first launch: onboarding → Skip → login', (tester) async {
    prefs.onboardingSeen = false;
    await pumpApp(tester);

    expect(find.textContaining('Your ATM estate'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Sign in with'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
    expect(prefs.onboardingSeen, isTrue);
  });

  testWidgets('both fields are validated before calling the API', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your username'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);

    await tester.enterText(field('Username'), 'john.doe');
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();
    expect(
      find.text('Enter your password'),
      findsOneWidget,
      reason: 'legacy bug #1: empty password was sent',
    );
    expect(auth.calls, isEmpty);
  });

  testWidgets('invalid credentials: friendly message, password cleared, still on login', (tester) async {
    auth.loginError = const InvalidCredentials();
    await pumpApp(tester);

    await tester.enterText(field('Username'), 'john.doe');
    await tester.enterText(field('Password'), 'wrong');
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('Incorrect username or password.'), findsOneWidget);
    expect(find.text('wrong'), findsNothing);
    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('rate limited shows the wait time', (tester) async {
    auth.loginError = const RateLimited(retryAfter: Duration(seconds: 600));
    await pumpApp(tester);

    await tester.enterText(field('Username'), 'john.doe');
    await tester.enterText(field('Password'), 'pw');
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('Too many attempts. Try again in 10 min.'), findsOneWidget);
  });

  testWidgets('successful login → Overview with greeting; username remembered', (tester) async {
    await pumpApp(tester);

    await tester.enterText(field('Username'), 'john.doe');
    await tester.enterText(field('Password'), 'pw');
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();

    expect(find.textContaining(', John'), findsOneWidget);
    expect(prefs.rememberedUsername, 'john.doe');
  });

  testWidgets('remembered username is prefilled', (tester) async {
    prefs.rememberedUsername = 'jane.roe';
    await pumpApp(tester);
    expect(find.text('jane.roe'), findsOneWidget);
  });

  testWidgets('stored session opens Overview; Sign out (confirmed) returns to login', (tester) async {
    await seedSession(secure);
    await pumpApp(tester);
    expect(find.textContaining('Your ATM estate'), findsOneWidget);

    await tester.tap(find.byTooltip('More'));
    await tester.pumpAndSettle();
    expect(find.text('John Doe'), findsOneWidget);

    await tester.tap(find.text('Sign out'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Sign out'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    expect(auth.calls, contains('logout'));
    expect(secure.values, isEmpty);
  });

  testWidgets('session expired on start → login shows why', (tester) async {
    await seedSession(secure);
    auth.meError = const SessionExpired();
    await pumpApp(tester);
    expect(find.text(SessionExpired.defaultMessage), findsOneWidget);
  });

  testWidgets('build older than min_app_version → force update screen', (tester) async {
    await seedSession(secure);
    await tester.pumpWidget(
      ProviderScope(
        overrides: appOverrides(
          secure: secure,
          prefs: prefs,
          auth: auth,
          reference: FakeReferenceRepository(minAppVersion: '9.0.0'),
        ),
        child: const EliteApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Update required'), findsOneWidget);
  });
}
