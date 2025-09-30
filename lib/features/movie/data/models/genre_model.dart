import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre extends Equatable {
  const Genre({required this.id, required this.name});
  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  static Genre? maybeFromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return Genre.fromJson(json);
    }
    return null;
  }

  @override
  List<Object?> get props => [id, name];
}
