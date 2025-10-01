import 'package:movie_magic/features/shared/data/type_def.dart';

class TopRatedMovieParams {
  TopRatedMovieParams({this.page});
  final int? page;

  Json toJson() {
    final json = Json();
    if (page != null) json['page'] = page;
    return json;
  }
}
