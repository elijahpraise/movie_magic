import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_company_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompany extends Equatable {
  const ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);

  static ProductionCompany? maybeFromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return ProductionCompany.fromJson(json);
    }
    return null;
  }

  @override
  List<Object?> get props => [id, name];
}
