import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/shared/data/key_values.dart';
import 'package:movie_magic/features/shared/data/type_def.dart';

final watchlistCubit = WatchlistCubit();

class WatchlistCubit extends Cubit<List<Movie>> with HydratedMixin {
  WatchlistCubit() : super([]);

  void setWatchList(List<Movie> value) => emit(value);

  void addMoviesToWatchList(List<Movie> value) => emit([...state, ...value]);

  void addToWatchList(Movie value) => emit([...state, value]);

  void removeWatchList(Movie value) => emit([...state]..remove(value));

  void reset() => emit([]);

  @override
  List<Movie>? fromJson(Map<String, dynamic> json) {
    final data = json[KeyValues.value] as List<dynamic>;
    final movies = data.map((e) => Movie.fromJson(e as Json)).toList();
    return movies;
  }

  @override
  Map<String, dynamic>? toJson(List<Movie> state) {
    final json = Json();
    json[KeyValues.value] = state.map((e) => e.toJson()).toList();
    return json;
  }
}
