part of 'discover_movie_bloc.dart';

@immutable
sealed class DiscoverMovieState {}

final class DiscoverMovieInitial extends DiscoverMovieState {}

final class DiscoverMovieLoading extends DiscoverMovieState {}

final class DiscoverMovieLoaded extends DiscoverMovieState {
  DiscoverMovieLoaded(this.result);
  final PaginatedResult<Movie> result;
}

final class DiscoverMovieError extends DiscoverMovieState {
  DiscoverMovieError(this.error);
  final ErrorResponse error;
}
