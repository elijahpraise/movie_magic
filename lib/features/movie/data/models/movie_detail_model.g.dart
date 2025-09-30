// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
  id: (json['id'] as num).toInt(),
  adult: json['adult'] as bool,
  genreIds:
      (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  posterPath: json['poster_path'] as String,
  releaseDate: json['release_date'] as String,
  title: json['title'] as String,
  backdropPath: json['backdrop_path'] as String?,
  originalLanguage: json['original_language'] as String?,
  originalTitle: json['original_title'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
  budget: (json['budget'] as num?)?.toDouble(),
  revenue: (json['revenue'] as num?)?.toDouble(),
  homepage: json['homepage'] as String?,
  tagline: json['tagline'] as String?,
  productionCompanies:
      (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'popularity': instance.popularity,
      'genre_ids': instance.genreIds,
      'vote_count': instance.voteCount,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'homepage': instance.homepage,
      'tagline': instance.tagline,
      'production_companies': instance.productionCompanies,
    };
