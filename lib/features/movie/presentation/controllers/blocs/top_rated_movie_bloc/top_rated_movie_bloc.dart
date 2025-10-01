import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

final topRatedMovieBloc = TopRatedMovieBloc();

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  TopRatedMovieBloc() : super(TopRatedMovieInitial()) {
    on<FetchTopRatedMovies>(_fetch);
  }

  Future<void> _fetch(
    FetchTopRatedMovies event,
    Emitter<TopRatedMovieState> emit,
  ) async {
    emit(TopRatedMovieLoading());
    final params = TopRatedMovieParams(page: event.page);
    final res = await topRatedMovieUseCase.call(params);
    res.fold(
      (l) => emit(TopRatedMovieLoaded(l)),
      (r) => emit(TopRatedMovieError(r)),
    );
  }
}
