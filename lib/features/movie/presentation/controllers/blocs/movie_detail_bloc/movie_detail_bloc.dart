import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

final movieDetailBloc = MovieDetailBloc();

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<FetchMovieDetails>(_fetch);
  }

  Future<void> _fetch(
    FetchMovieDetails event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(MovieDetailLoading());
    final res = await movieDetailUseCase.call(event.id);
    res.fold(
      (l) => emit(MovieDetailLoaded(l)),
      (r) => emit(MovieDetailError(r)),
    );
  }
}
