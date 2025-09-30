part of 'movie_genre_bloc.dart';

@immutable
sealed class MovieGenreState {}

final class MovieGenreInitial extends MovieGenreState {}

final class MovieGenreLoading extends MovieGenreState {}

final class MovieGenreLoaded extends MovieGenreState {
  MovieGenreLoaded(this.genres);
  final List<Genre> genres;
}

final class MovieGenreError extends MovieGenreState {
  MovieGenreError(this.error);
  final ErrorResponse error;
}
