import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/shared/data/key_values.dart';
import 'package:movie_magic/features/shared/data/type_def.dart';

final movieGenreCubit = MovieGenreCubit();

class MovieGenreCubit extends Cubit<List<Genre>> with HydratedMixin {
  MovieGenreCubit() : super([]) {
    hydrate();
  }

  void setGenres(List<Genre> value) => emit(value);

  void reset() => emit([]);

  @override
  List<Genre>? fromJson(Map<String, dynamic> json) {
    final data = json[KeyValues.value] as List<dynamic>;
    final therapists = data.map((e) => Genre.fromJson(e as Json)).toList();
    return therapists;
  }

  @override
  Map<String, dynamic>? toJson(List<Genre> state) {
    final json = Json();
    json[KeyValues.value] = state.map((e) => e.toJson()).toList();
    return json;
  }
}
