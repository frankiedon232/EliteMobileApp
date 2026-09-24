import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../domain/auth_models.dart';
import '../domain/auth_repository.dart';

part 'auth_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(ref.watch(apiClientProvider));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<LoginResult> login({
    required String username,
    required String password,
    required LoginDevice device,
  }) async {
    final envelope = await _api.post(
      ApiEndpoints.login,
      body: {'username': username, 'password': password, 'device': device.toJson()},
    );
    return LoginResult.fromJson(envelope.object);
  }

  @override
  Future<void> logout() => _api.post(ApiEndpoints.logout);

  @override
  Future<SessionInfo> me() async => SessionInfo.fromJson((await _api.get(ApiEndpoints.me)).object);
}
