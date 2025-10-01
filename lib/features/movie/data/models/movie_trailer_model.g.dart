// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieTrailer _$MovieTrailerFromJson(Map<String, dynamic> json) => MovieTrailer(
  id: json['id'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  key: json['key'] as String,
  site: json['site'] as String,
  official: json['official'] as bool,
  publishedAt:
      json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
);

Map<String, dynamic> _$MovieTrailerToJson(MovieTrailer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'official': instance.official,
      'published_at': instance.publishedAt?.toIso8601String(),
    };
