import 'envelope.dart';

/// Pagination `meta` (API_CONTRACT §1): `{ page, per_page, total, total_pages }`.
class PageMeta {
  const PageMeta({required this.page, required this.perPage, required this.total, required this.totalPages});

  factory PageMeta.fromJson(Json json) => PageMeta(
    page: json['page'] as int,
    perPage: json['per_page'] as int,
    total: json['total'] as int,
    totalPages: json['total_pages'] as int,
  );

  final int page;
  final int perPage;
  final int total;
  final int totalPages;

  bool get hasNext => page < totalPages;

  /// 1-based index of the first item on this page ("21–40 of 312"), 0 when empty.
  int get firstIndex => total == 0 ? 0 : (page - 1) * perPage + 1;

  int get lastIndex => total == 0 ? 0 : (page * perPage).clamp(0, total);
}

/// One page of a server-paginated list.
class Paged<T> {
  const Paged({required this.items, required this.meta});

  factory Paged.fromEnvelope(Envelope envelope, T Function(Json json) fromJson) =>
      Paged(items: envelope.list.map(fromJson).toList(), meta: PageMeta.fromJson(envelope.requireMeta));

  final List<T> items;
  final PageMeta meta;
}
