import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'movie_genre_event.dart';
part 'movie_genre_state.dart';

final movieGenreBloc = MovieGenreBloc();

class MovieGenreBloc extends Bloc<MovieGenreEvent, MovieGenreState> {
  MovieGenreBloc() : super(MovieGenreInitial()) {
    on<FetchMovieGenres>(_fetch);
  }

  Future<void> _fetch(
    FetchMovieGenres event,
    Emitter<MovieGenreState> emit,
  ) async {
    emit(MovieGenreLoading());
    final res = await movieGenreUseCase.call(null);
    res.fold((l) => emit(MovieGenreLoaded(l)), (r) => emit(MovieGenreError(r)));
  }
}
