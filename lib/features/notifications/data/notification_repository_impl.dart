import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/paged.dart';
import '../domain/notification_models.dart';
import '../domain/notification_repository.dart';

part 'notification_repository_impl.g.dart';

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) =>
    NotificationRepositoryImpl(ref.watch(apiClientProvider));

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<DeviceRegistration> registerDevice({
    required String token,
    required String platform,
    String? appVersion,
    PreferencesPatch? preferences,
  }) async {
    final envelope = await _api.post(
      ApiEndpoints.devices,
      body: {
        'token': token,
        'platform': platform,
        'app_version': ?appVersion,
        if (preferences != null && !preferences.isEmpty) 'preferences': preferences.toJson(),
      },
    );
    return DeviceRegistration.fromJson(envelope.object);
  }

  @override
  Future<DeviceRegistration> updatePreferences(String token, PreferencesPatch patch) async {
    if (patch.isEmpty) throw ArgumentError.value(patch, 'patch', 'must change at least one field');
    final envelope = await _api.put(ApiEndpoints.devicePreferences(token), body: patch.toJson());
    return DeviceRegistration.fromJson(envelope.object);
  }

  @override
  Future<void> unregisterDevice(String token) => _api.delete(ApiEndpoints.device(token));

  @override
  Future<Paged<NotificationItem>> inbox({int page = 1, int perPage = 20}) async => Paged.fromEnvelope(
    await _api.get(ApiEndpoints.notifications, query: {'page': page, 'per_page': perPage}),
    NotificationItem.fromJson,
  );
}
