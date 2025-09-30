import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

final trendingMovieBloc = TrendingMovieBloc();

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  TrendingMovieBloc() : super(TrendingMovieInitial()) {
    on<FetchTrendingMovies>(_fetch);
  }

  Future<void> _fetch(
    FetchTrendingMovies event,
    Emitter<TrendingMovieState> emit,
  ) async {
    emit(TrendingMovieLoading());
    final params = TrendingMovieParams(page: event.page);
    final res = await trendingMovieUseCase.call(params);
    res.fold(
      (l) => emit(TrendingMovieLoaded(l)),
      (r) => emit(TrendingMovieError(r)),
    );
  }
}
