part of 'trending_movie_bloc.dart';

@immutable
sealed class TrendingMovieState {}

final class TrendingMovieInitial extends TrendingMovieState {}

final class TrendingMovieLoading extends TrendingMovieState {}

final class TrendingMovieLoaded extends TrendingMovieState {
  TrendingMovieLoaded(this.result);
  final PaginatedResult<Movie> result;
}

final class TrendingMovieError extends TrendingMovieState {
  TrendingMovieError(this.error);
  final ErrorResponse error;
}
