import 'package:movie_magic/features/shared/data/type_def.dart';

class SearchMovieParams {
  SearchMovieParams({
    required this.query,
    this.includeAdult,
    this.primaryReleaseYear,
    this.page,
  });
  final String query;
  final bool? includeAdult;
  final String? primaryReleaseYear;
  final int? page;

  Json toJson() {
    final json = Json();
    json['query'] = query;
    if (includeAdult != null) json['include_adult'] = includeAdult;
    if (page != null) json['page'] = page;
    if (primaryReleaseYear != null) {
      json['primary_release_year'] = primaryReleaseYear;
    }
    return json;
  }
}
