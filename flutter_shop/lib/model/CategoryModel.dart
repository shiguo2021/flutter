import "package:json_annotation/json_annotation.dart";

part "CategoryModel.g.dart";

@JsonSerializable()
class CategoryModel {
  String name;
  CategoryModel(this.name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryModels {
  List<CategoryModel> data;
  CategoryModels(this.data);

  factory CategoryModels.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelsToJson(this);
}
