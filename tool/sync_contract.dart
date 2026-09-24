// Copies the v1 API contract from the backend repo (the source of truth) into this repo's docs/.
//
//   dart run tool/sync_contract.dart           copy + print a diff summary
//   dart run tool/sync_contract.dart --check   only report differences (exit 1 if out of sync)
//
// Backend path: env var ELITE_BACKEND_PATH, default C:\UNET\APP_BACKEND\elite.
// Never edit docs/API_CONTRACT.md or docs/openapi.yaml by hand; change the backend, then re-run this.
import 'dart:io';

const _defaultBackendPath = r'C:\UNET\APP_BACKEND\elite';

/// Target file in this repo → candidate source paths in the backend repo (first existing wins).
const _files = <String, List<String>>{
  'docs/API_CONTRACT.md': ['docs/API_CONTRACT.md'],
  'docs/openapi.yaml': ['openapi.yaml', 'docs/openapi.yaml'],
};

Future<void> main(List<String> args) async {
  final checkOnly = args.contains('--check');
  final backend = Platform.environment['ELITE_BACKEND_PATH']?.trim().isNotEmpty == true
      ? Platform.environment['ELITE_BACKEND_PATH']!.trim()
      : _defaultBackendPath;
  final repoRoot = File.fromUri(Platform.script).parent.parent.path;

  stdout.writeln('Backend repo: $backend');
  if (!Directory(backend).existsSync()) {
    stderr.writeln('ERROR: backend repo not found. Set \$env:ELITE_BACKEND_PATH.');
    exit(2);
  }

  var changed = 0;
  for (final entry in _files.entries) {
    final target = File(_join(repoRoot, entry.key));
    final source = entry.value
        .map((p) => File(_join(backend, p)))
        .firstWhere((f) => f.existsSync(), orElse: () => File(''));
    if (source.path.isEmpty) {
      stderr.writeln('ERROR: ${entry.key}: none of ${entry.value.join(', ')} exist in the backend repo.');
      exit(2);
    }

    final newText = _normalise(source.readAsStringSync());
    final oldText = target.existsSync() ? _normalise(target.readAsStringSync()) : null;

    if (oldText == newText) {
      stdout.writeln('  = ${entry.key}  (unchanged)');
      continue;
    }
    changed++;
    if (oldText == null) {
      stdout.writeln('  + ${entry.key}  (new, ${newText.split('\n').length} lines)');
    } else {
      final summary = _diff(oldText.split('\n'), newText.split('\n'));
      stdout.writeln('  ~ ${entry.key}  (+${summary.added} / -${summary.removed} lines)');
      for (final line in summary.preview) {
        stdout.writeln('      $line');
      }
      if (summary.more > 0) stdout.writeln('      … ${summary.more} more changed lines');
    }
    if (!checkOnly) {
      target.parent.createSync(recursive: true);
      target.writeAsStringSync(newText);
    }
  }

  if (changed == 0) {
    stdout.writeln('Contract is in sync.');
  } else if (checkOnly) {
    stdout.writeln('$changed file(s) out of sync. Run without --check to copy.');
    exit(1);
  } else {
    stdout.writeln('$changed file(s) updated. Review the changes, then update models/tests (M1).');
  }
}

String _join(String a, String b) => '$a${Platform.pathSeparator}${b.replaceAll('/', Platform.pathSeparator)}';

/// Line endings are normalised to LF (the repo stores text as LF, see .gitattributes).
String _normalise(String s) => s.replaceAll('\r\n', '\n');

class _DiffSummary {
  _DiffSummary(this.added, this.removed, this.preview, this.more);
  final int added;
  final int removed;
  final List<String> preview;
  final int more;
}

/// Line diff via LCS (files are a few thousand lines at most). Returns counts and a short preview.
_DiffSummary _diff(List<String> a, List<String> b, {int previewLines = 20}) {
  final n = a.length, m = b.length;
  final lcs = List.generate(n + 1, (_) => List<int>.filled(m + 1, 0));
  for (var i = n - 1; i >= 0; i--) {
    for (var j = m - 1; j >= 0; j--) {
      lcs[i][j] = a[i] == b[j]
          ? lcs[i + 1][j + 1] + 1
          : (lcs[i + 1][j] >= lcs[i][j + 1] ? lcs[i + 1][j] : lcs[i][j + 1]);
    }
  }
  final changes = <String>[];
  var added = 0, removed = 0, i = 0, j = 0;
  while (i < n || j < m) {
    if (i < n && j < m && a[i] == b[j]) {
      i++;
      j++;
    } else if (j < m && (i == n || lcs[i][j + 1] >= lcs[i + 1][j])) {
      changes.add('+ L${j + 1}: ${_trim(b[j])}');
      added++;
      j++;
    } else {
      changes.add('- L${i + 1}: ${_trim(a[i])}');
      removed++;
      i++;
    }
  }
  final preview = changes.take(previewLines).toList();
  return _DiffSummary(added, removed, preview, changes.length - preview.length);
}

String _trim(String s) => s.length > 110 ? '${s.substring(0, 107)}...' : s;
