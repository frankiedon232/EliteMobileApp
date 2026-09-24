import 'package:elite_mobile/core/utils/app_version.dart';
import 'package:elite_mobile/core/utils/names.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('compareVersions', () {
    expect(compareVersions('1.0.0', '1.0.0'), 0);
    expect(compareVersions('1.0.9', '1.0.10'), lessThan(0));
    expect(compareVersions('2.0.0', '1.9.9'), greaterThan(0));
    expect(compareVersions('1.2', '1.2.0'), 0);
    expect(compareVersions('1.2.0-staging', '1.2.0'), 0);
    expect(isVersionBelow('1.0.0', '1.0.1'), isTrue);
    expect(isVersionBelow('1.0.1', '1.0.1'), isFalse);
  });

  test('titleCase / initials', () {
    expect(titleCase('john  doe'), 'John Doe');
    expect(titleCase('ADEBAYO'), 'Adebayo');
    expect(initials('John Doe'), 'JD');
    expect(initials('Admin'), 'A');
    expect(initials('  '), '?');
  });

  test('greeting', () {
    expect(greeting(DateTime(2026, 9, 24, 8)), 'Good morning');
    expect(greeting(DateTime(2026, 9, 24, 13)), 'Good afternoon');
    expect(greeting(DateTime(2026, 9, 24, 19)), 'Good evening');
  });
}
