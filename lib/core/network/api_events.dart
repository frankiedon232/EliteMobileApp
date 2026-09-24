import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_events.g.dart';

/// Global reactions to API responses (docs/ARCHITECTURE.md §4): the session layer listens and
/// logs out on [sessionExpired]; the router shows the force-update screen on [upgradeRequired].
enum ApiEvent { sessionExpired, upgradeRequired }

class ApiEventBus {
  final _controller = StreamController<ApiEvent>.broadcast();

  Stream<ApiEvent> get stream => _controller.stream;

  void emit(ApiEvent event) => _controller.add(event);

  Future<void> dispose() => _controller.close();
}

@Riverpod(keepAlive: true)
ApiEventBus apiEventBus(Ref ref) {
  final bus = ApiEventBus();
  ref.onDispose(bus.dispose);
  return bus;
}
