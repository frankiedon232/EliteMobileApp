import '../../../core/network/paged.dart';
import 'notification_models.dart';

abstract interface class NotificationRepository {
  /// `POST /devices`: upsert this phone's FCM token (every login and token refresh).
  Future<DeviceRegistration> registerDevice({
    required String token,
    required String platform,
    String? appVersion,
    PreferencesPatch? preferences,
  });

  /// `PUT /devices/{token}/preferences` (partial update; must not be empty).
  Future<DeviceRegistration> updatePreferences(String token, PreferencesPatch patch);

  /// `DELETE /devices/{token}` (idempotent).
  Future<void> unregisterDevice(String token);

  /// `GET /notifications`: the caller's inbox, newest first.
  Future<Paged<NotificationItem>> inbox({int page = 1, int perPage = 20});
}
