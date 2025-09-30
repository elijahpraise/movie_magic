part of 'discover_movie_bloc.dart';

@immutable
sealed class DiscoverMovieEvent {}

final class DiscoverMovies extends DiscoverMovieEvent {
  DiscoverMovies({
    this.includeAdult,
    this.releaseDate,
    this.sortBy,
    this.page,
    this.year,
  });
  final bool? includeAdult;
  final String? releaseDate;
  final String? sortBy;
  final int? page;
  final int? year;
}
