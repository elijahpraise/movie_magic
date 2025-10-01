part of 'movie_search_bloc.dart';

@immutable
sealed class MovieSearchEvent {}

final class SearchForMovie extends MovieSearchEvent {
  SearchForMovie({
    required this.query,
    this.includeAdult,
    this.primaryReleaseYear,
    this.page,
  });
  final String query;
  final bool? includeAdult;
  final String? primaryReleaseYear;
  final int? page;
}
