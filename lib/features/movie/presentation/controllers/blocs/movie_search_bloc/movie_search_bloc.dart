import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

final movieSearchBloc = MovieSearchBloc();

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  MovieSearchBloc() : super(MovieSearchInitial()) {
    on<SearchForMovie>(_fetch);
  }

  Future<void> _fetch(
    SearchForMovie event,
    Emitter<MovieSearchState> emit,
  ) async {
    emit(MovieSearchLoading());
    final params = SearchMovieParams(
      query: event.query,
      page: event.page,
      includeAdult: event.includeAdult,
      primaryReleaseYear: event.primaryReleaseYear,
    );
    final res = await movieSearchUseCase.call(params);
    res.fold(
      (l) => emit(MovieSearchLoaded(l)),
      (r) => emit(MovieSearchError(r)),
    );
  }
}
