/// Compares `x.y.z` versions (ignores `-suffix` / `+build`). Negative if [a] < [b], 0 if equal.
int compareVersions(String a, String b) {
  List<int> parts(String v) =>
      v.split(RegExp('[-+]')).first.split('.').map((p) => int.tryParse(p.trim()) ?? 0).toList();
  final pa = parts(a), pb = parts(b);
  for (var i = 0; i < 3; i++) {
    final x = i < pa.length ? pa[i] : 0;
    final y = i < pb.length ? pb[i] : 0;
    if (x != y) return x.compareTo(y);
  }
  return 0;
}

bool isVersionBelow(String version, String minimum) => compareVersions(version, minimum) < 0;
