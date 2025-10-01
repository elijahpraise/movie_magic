import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'movie_trailer_event.dart';
part 'movie_trailer_state.dart';

final movieTrailerBloc = MovieTrailerBloc();

class MovieTrailerBloc extends Bloc<MovieTrailerEvent, MovieTrailerState> {
  MovieTrailerBloc() : super(MovieTrailerInitial()) {
    on<FetchMovieTrailer>(_fetch);
  }

  Future<void> _fetch(
    FetchMovieTrailer event,
    Emitter<MovieTrailerState> emit,
  ) async {
    emit(MovieTrailerLoading());
    final res = await movieTrailerUseCase.call(event.id);
    res.fold(
      (l) => emit(MovieTrailerLoaded(l)),
      (r) => emit(MovieTrailerError(r)),
    );
  }
}
