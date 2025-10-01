// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: (json['id'] as num).toInt(),
  adult: json['adult'] as bool,
  overview: json['overview'] as String,
  title: json['title'] as String,
  releaseDate: json['release_date'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  genreIds:
      (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
  originalLanguage: json['original_language'] as String?,
  originalTitle: json['original_title'] as String?,
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'adult': instance.adult,
  'overview': instance.overview,
  'title': instance.title,
  'release_date': instance.releaseDate,
  'popularity': instance.popularity,
  'genre_ids': instance.genreIds,
  'poster_path': instance.posterPath,
  'vote_count': instance.voteCount,
  'backdrop_path': instance.backdropPath,
  'vote_average': instance.voteAverage,
  'original_language': instance.originalLanguage,
  'original_title': instance.originalTitle,
};
