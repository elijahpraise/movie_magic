part of 'movie_trailer_bloc.dart';

@immutable
sealed class MovieTrailerState {}

final class MovieTrailerInitial extends MovieTrailerState {}

final class MovieTrailerLoading extends MovieTrailerState {}

final class MovieTrailerLoaded extends MovieTrailerState {
  MovieTrailerLoaded(this.trailers);
  final List<MovieTrailer> trailers;
}

final class MovieTrailerError extends MovieTrailerState {
  MovieTrailerError(this.error);
  final ErrorResponse error;
}
