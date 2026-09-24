import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_store.g.dart';

/// Encrypted key-value storage (Android Keystore / iOS Keychain). The only place the access token lives.
abstract interface class SecureStore {
  Future<String?> read(String key);

  /// Writes [value]; `null` deletes the key.
  Future<void> write(String key, String? value);

  Future<void> delete(Iterable<String> keys);
}

@Riverpod(keepAlive: true)
SecureStore secureStore(Ref ref) => FlutterSecureStore();

class FlutterSecureStore implements SecureStore {
  FlutterSecureStore([FlutterSecureStorage? storage])
    : _storage =
          storage ??
          const FlutterSecureStorage(
            iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
          );

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String? value) =>
      value == null ? _storage.delete(key: key) : _storage.write(key: key, value: value);

  @override
  Future<void> delete(Iterable<String> keys) async {
    for (final key in keys) {
      await _storage.delete(key: key);
    }
  }
}
