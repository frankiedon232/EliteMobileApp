import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../domain/terminal_models.dart';
import '../domain/terminal_repository.dart';

part 'terminal_repository_impl.g.dart';

@Riverpod(keepAlive: true)
TerminalRepository terminalRepository(Ref ref) => TerminalRepositoryImpl(ref.watch(apiClientProvider));

class TerminalRepositoryImpl implements TerminalRepository {
  TerminalRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<TerminalPage<Terminal>> list(TerminalQuery query, {int page = 1}) async => TerminalPage.fromEnvelope(
    await _api.get(ApiEndpoints.terminals, query: query.toQueryParameters(page: page)),
    Terminal.fromJson,
  );

  @override
  Future<TerminalPage<Terminal>> ofInterest(TerminalQuery query, {int page = 1}) async =>
      TerminalPage.fromEnvelope(
        await _api.get(ApiEndpoints.terminalsOfInterest, query: query.toQueryParameters(page: page)),
        Terminal.fromJson,
      );

  @override
  Future<TerminalPage<BackedOutTerminal>> backedOut(TerminalQuery query, {int page = 1}) async =>
      TerminalPage.fromEnvelope(
        await _api.get(ApiEndpoints.terminalsBackedOut, query: query.toQueryParameters(page: page)),
        BackedOutTerminal.fromJson,
      );

  @override
  Future<TerminalDetail> detail(String terminalId) async =>
      TerminalDetail.fromJson((await _api.get(ApiEndpoints.terminal(terminalId.trim()))).object);

  @override
  Future<CsvExport> export(TerminalQuery query, {required String savePath}) async {
    final headers = await _api.download(
      ApiEndpoints.terminalsExport,
      savePath,
      query: query.toQueryParameters(page: null),
    );
    return CsvExport(
      filePath: savePath,
      totalCount: int.tryParse(headers.value('x-total-count') ?? ''),
      truncated: headers.value('x-export-truncated')?.toLowerCase() == 'true',
    );
  }
}
