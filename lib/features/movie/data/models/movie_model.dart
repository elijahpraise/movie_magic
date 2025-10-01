import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.adult,
    required this.overview,
    required this.title,
    required this.releaseDate,
    required this.popularity,
    required this.genreIds,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  final int id;
  final bool adult;
  final String overview;
  final String title;
  final String releaseDate;
  final double popularity;
  final List<int> genreIds;
  final String? posterPath;
  final int? voteCount;
  final String? backdropPath;
  final double? voteAverage;
  final String? originalLanguage;
  final String? originalTitle;

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static Movie? maybeFromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return Movie.fromJson(json);
    }
    return null;
  }

  @override
  List<Object?> get props => [id];
}
