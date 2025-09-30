class PaginatedResult<T> {
  PaginatedResult({
    required this.results,
    required this.count,
    required this.page,
    required this.totalPages,
  });
  final List<T> results;
  final int count;
  final int page;
  final int totalPages;
}
