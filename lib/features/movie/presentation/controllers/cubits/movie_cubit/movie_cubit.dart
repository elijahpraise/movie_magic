import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/shared/data/key_values.dart';
import 'package:movie_magic/features/shared/data/type_def.dart';

final movieCubit = MovieCubit();

class MovieCubit extends Cubit<Movie?> with HydratedMixin {
  MovieCubit() : super(null) {
    hydrate();
  }

  void setMovie(Movie value) => emit(value);

  void reset() => emit(null);

  @override
  Movie? fromJson(Json json) =>
      Movie.maybeFromJson(json[KeyValues.value] as Json?);

  @override
  Json? toJson(Movie? state) {
    final json = Json();
    json[KeyValues.value] = state?.toJson();
    return json;
  }
}
