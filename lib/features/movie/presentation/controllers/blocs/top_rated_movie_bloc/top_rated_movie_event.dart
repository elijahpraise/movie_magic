part of 'top_rated_movie_bloc.dart';

@immutable
sealed class TopRatedMovieEvent {}

final class FetchTopRatedMovies extends TopRatedMovieEvent {
  FetchTopRatedMovies({this.page});
  final int? page;
}
