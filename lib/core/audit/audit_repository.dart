import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/api_client.dart';
import '../network/api_endpoints.dart';

part 'audit_repository.g.dart';

@Riverpod(keepAlive: true)
AuditRepository auditRepository(Ref ref) => AuditRepository(ref.watch(apiClientProvider));

/// `POST /audit` for region change, lookup, report query and export (FEATURES §10).
/// User and IP come from the session server-side. Best effort: never breaks the user's action.
class AuditRepository {
  AuditRepository(this._api);

  final ApiClient _api;

  Future<void> log({required String action, required String targetView, required String module}) async {
    try {
      await _api.post(
        ApiEndpoints.audit,
        body: {
          'action': _cap(action, 800),
          'target_view': _cap(targetView, 300),
          'module': _cap(module, 100),
        },
      );
    } on Object {
      // Audit failures are not shown to the user.
    }
  }

  static String _cap(String s, int max) => s.length <= max ? s : s.substring(0, max);
}
