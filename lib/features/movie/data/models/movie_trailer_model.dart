import 'package:json_annotation/json_annotation.dart';

part 'movie_trailer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieTrailer {
  MovieTrailer({
    required this.id,
    required this.type,
    required this.name,
    required this.key,
    required this.site,
    required this.official,
    this.publishedAt,
  });

  factory MovieTrailer.fromJson(Map<String, dynamic> json) =>
      _$MovieTrailerFromJson(json);

  final String id;
  final String type;
  final String name;
  final String key;
  final String site;
  final bool official;
  final DateTime? publishedAt;

  Map<String, dynamic> toJson() => _$MovieTrailerToJson(this);

  static MovieTrailer? maybeFromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return MovieTrailer.fromJson(json);
    }
    return null;
  }
}
