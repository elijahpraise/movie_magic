import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'discover_movie_event.dart';
part 'discover_movie_state.dart';

final discoverMovieBloc = DiscoverMovieBloc();

class DiscoverMovieBloc extends Bloc<DiscoverMovieEvent, DiscoverMovieState> {
  DiscoverMovieBloc() : super(DiscoverMovieInitial()) {
    on<DiscoverMovies>(_fetch);
  }

  Future<void> _fetch(
    DiscoverMovies event,
    Emitter<DiscoverMovieState> emit,
  ) async {
    emit(DiscoverMovieLoading());
    final params = DiscoverMovieParams(
      includeAdult: event.includeAdult,
      page: event.page,
      releaseDate: event.releaseDate,
      sortBy: event.sortBy,
      year: event.year,
    );
    final res = await discoverMovieUseCase.call(params);
    res.fold(
      (l) => emit(DiscoverMovieLoaded(l)),
      (r) => emit(DiscoverMovieError(r)),
    );
  }
}
