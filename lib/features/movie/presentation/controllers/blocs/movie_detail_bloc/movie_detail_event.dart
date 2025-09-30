part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

final class FetchMovieDetails extends MovieDetailEvent {
  FetchMovieDetails(this.id);
  final String id;
}
