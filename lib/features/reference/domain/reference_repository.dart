import 'reference_models.dart';

abstract interface class ReferenceRepository {
  /// `GET /config` (no auth).
  Future<RemoteConfig> config();

  /// `GET /regions`: regions inside the user's scope, "All" first.
  Future<List<RegionOption>> regions();

  /// `GET /filters`.
  Future<List<FilterOption>> filters();
}
