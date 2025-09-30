import 'package:json_annotation/json_annotation.dart';
import 'package:movie_magic/features/movie/data/models/movie_model.dart';
import 'package:movie_magic/features/movie/data/models/production_company_model.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetail extends Movie {
  const MovieDetail({
    required super.id,
    required super.adult,
    required super.genreIds,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    super.backdropPath,
    super.originalLanguage,
    super.originalTitle,
    super.voteAverage,
    super.voteCount,
    this.budget,
    this.revenue,
    this.homepage,
    this.tagline,
    this.productionCompanies,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  final double? budget;
  final double? revenue;
  final String? homepage;
  final String? tagline;
  final List<ProductionCompany>? productionCompanies;

  @override
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  static MovieDetail? maybeFromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return MovieDetail.fromJson(json);
    }
    return null;
  }
}
