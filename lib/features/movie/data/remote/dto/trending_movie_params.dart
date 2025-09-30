import 'package:movie_magic/features/shared/data/type_def.dart';

class TrendingMovieParams {
  TrendingMovieParams({this.page});
  final int? page;

  Json toJson() {
    final json = Json();
    if (page != null) json['page'] = page;
    return json;
  }
}
