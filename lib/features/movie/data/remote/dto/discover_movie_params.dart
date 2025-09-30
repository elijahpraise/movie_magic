import 'package:movie_magic/features/shared/data/type_def.dart';

class DiscoverMovieParams {
  DiscoverMovieParams({
    this.includeAdult,
    this.releaseDate,
    this.sortBy,
    this.page,
    this.year,
  });
  final bool? includeAdult;
  final String? releaseDate;
  final String? sortBy;
  final int? page;
  final int? year;

  Json toJson() {
    final json = Json();
    if (includeAdult != null) json['include_adult'] = includeAdult;
    if (releaseDate != null) json['release_date'] = releaseDate;
    if (sortBy != null) json['sort_by'] = sortBy;
    if (page != null) json['page'] = page;
    if (year != null) json['year'] = year;
    return json;
  }
}
