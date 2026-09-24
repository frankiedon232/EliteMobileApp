import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../domain/reference_models.dart';
import '../domain/reference_repository.dart';

part 'reference_repository_impl.g.dart';

@Riverpod(keepAlive: true)
ReferenceRepository referenceRepository(Ref ref) => ReferenceRepositoryImpl(ref.watch(apiClientProvider));

class ReferenceRepositoryImpl implements ReferenceRepository {
  ReferenceRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<RemoteConfig> config() async => RemoteConfig.fromJson((await _api.get(ApiEndpoints.config)).object);

  @override
  Future<List<RegionOption>> regions() async =>
      (await _api.get(ApiEndpoints.regions)).list.map(RegionOption.fromJson).toList();

  @override
  Future<List<FilterOption>> filters() async =>
      (await _api.get(ApiEndpoints.filters)).list.map(FilterOption.fromJson).toList();
}
