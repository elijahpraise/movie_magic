part of 'trending_movie_bloc.dart';

@immutable
sealed class TrendingMovieEvent {}

final class FetchTrendingMovies extends TrendingMovieEvent {
  FetchTrendingMovies({this.page});
  final int? page;
}
