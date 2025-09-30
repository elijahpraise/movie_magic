part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailLoaded extends MovieDetailState {
  MovieDetailLoaded(this.movie);
  final MovieDetail movie;
}

final class MovieDetailError extends MovieDetailState {
  MovieDetailError(this.error);
  final ErrorResponse error;
}
