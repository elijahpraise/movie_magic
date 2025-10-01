part of 'top_rated_movie_bloc.dart';

@immutable
sealed class TopRatedMovieState {}

final class TopRatedMovieInitial extends TopRatedMovieState {}

final class TopRatedMovieLoading extends TopRatedMovieState {}

final class TopRatedMovieLoaded extends TopRatedMovieState {
  TopRatedMovieLoaded(this.result);
  final PaginatedResult<Movie> result;
}

final class TopRatedMovieError extends TopRatedMovieState {
  TopRatedMovieError(this.error);
  final ErrorResponse error;
}
