import 'terminal_models.dart';

abstract interface class TerminalRepository {
  /// `GET /terminals`: one page, server-side filter/search/sort (+ facets when requested).
  Future<TerminalPage<Terminal>> list(TerminalQuery query, {int page = 1});

  /// `GET /terminals/of-interest` (the query's filter is ignored by the server).
  Future<TerminalPage<Terminal>> ofInterest(TerminalQuery query, {int page = 1});

  /// `GET /terminals/backed-out`.
  Future<TerminalPage<BackedOutTerminal>> backedOut(TerminalQuery query, {int page = 1});

  /// `GET /terminals/{id}`. Throws NotFound when missing, not monitored or out of scope.
  Future<TerminalDetail> detail(String terminalId);

  /// `GET /terminals/export` → CSV saved at [savePath].
  Future<CsvExport> export(TerminalQuery query, {required String savePath});
}
