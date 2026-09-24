import 'package:elite_mobile/core/router/auth_redirect.dart';
import 'package:elite_mobile/core/router/routes.dart';
import 'package:elite_mobile/features/auth/presentation/session_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fakes.dart';

void main() {
  final signedIn = SignedIn(user: testUser, scope: testScope, expiresAt: DateTime(2030));

  String? go(String location, SessionState session, {bool onboarding = true, bool update = false}) =>
      authRedirect(
        location: Uri.parse(location),
        session: session,
        onboardingSeen: onboarding,
        forceUpdate: update,
      );

  test('force update wins over everything', () {
    expect(go('/home', signedIn, update: true), Routes.update);
    expect(go('/login', const SignedOut(), update: true), Routes.update);
    expect(go('/update', signedIn, update: true), isNull);
  });

  test('while restoring: splash, remembering the deep link', () {
    expect(go('/terminal/123', const SessionRestoring()), '/?from=%2Fterminal%2F123');
    expect(go('/', const SessionRestoring()), isNull);
  });

  test('first launch → onboarding', () {
    expect(go('/home', const SignedOut(), onboarding: false), Routes.onboarding);
    expect(go('/onboarding', const SignedOut(), onboarding: false), isNull);
  });

  test('signed out → login from anywhere', () {
    expect(go('/home', const SignedOut()), Routes.login);
    expect(go('/terminals?filter=offline', const SignedOut()), Routes.login);
    expect(go('/login', const SignedOut()), isNull);
  });

  test('signed in: public pages → home, or the remembered deep link', () {
    expect(go('/login', signedIn), Routes.home);
    expect(go('/onboarding', signedIn), Routes.home);
    expect(go('/?from=%2Fterminals%3Ffilter%3Doffline', signedIn), '/terminals?filter=offline');
    expect(go('/?from=%2Flogin', signedIn), Routes.home, reason: 'never bounce back to a public page');
    expect(go('/?from=https%3A%2F%2Fevil.example', signedIn), Routes.home, reason: 'only in-app paths');
    expect(go('/home', signedIn), isNull);
    expect(go('/terminals?filter=no_cash', signedIn), isNull);
  });
}
