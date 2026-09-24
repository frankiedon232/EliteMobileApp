import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_client.dart';
import 'api_endpoints.dart';

part 'api_health.g.dart';

/// Result of `GET /health` (no auth).
typedef ApiHealth = ({String status, String version});

/// Connectivity check against the configured API. Used by the M0 shell and later by About.
@riverpod
Future<ApiHealth> apiHealth(Ref ref) async {
  final data = (await ref.watch(apiClientProvider).get(ApiEndpoints.health)).object;
  return (status: data['status'] as String? ?? 'unknown', version: data['version'] as String? ?? '?');
}
