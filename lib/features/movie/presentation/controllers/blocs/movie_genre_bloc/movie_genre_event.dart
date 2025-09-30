part of 'movie_genre_bloc.dart';

@immutable
sealed class MovieGenreEvent {}

final class FetchMovieGenres extends MovieGenreEvent {}
