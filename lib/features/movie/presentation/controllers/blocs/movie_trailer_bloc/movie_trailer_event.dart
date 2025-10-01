part of 'movie_trailer_bloc.dart';

@immutable
sealed class MovieTrailerEvent {}

final class FetchMovieTrailer extends MovieTrailerEvent {
  FetchMovieTrailer(this.id);
  final String id;
}
