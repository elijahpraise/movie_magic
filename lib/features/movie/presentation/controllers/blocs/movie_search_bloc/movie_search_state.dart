part of 'movie_search_bloc.dart';

@immutable
sealed class MovieSearchState {}

final class MovieSearchInitial extends MovieSearchState {}

final class MovieSearchLoading extends MovieSearchState {}

final class MovieSearchLoaded extends MovieSearchState {
  MovieSearchLoaded(this.result);
  final PaginatedResult<Movie> result;
}

final class MovieSearchError extends MovieSearchState {
  MovieSearchError(this.error);
  final ErrorResponse error;
}
