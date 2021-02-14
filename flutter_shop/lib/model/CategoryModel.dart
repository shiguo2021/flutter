import "package:json_annotation/json_annotation.dart";

part "CategoryModel.g.dart";

@JsonSerializable()
class CategoryModel {
  String name;
  List<CategoryChildModel> children;
  bool isSelected = false; //这里默认值无效
  CategoryModel(this.name, this.children, this.isSelected);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  static List<CategoryModel> listFromJson(dynamic json) {
    return (json as List)
        ?.map(
          (e) => e == null ? null : CategoryModel.fromJson(e),
        )
        ?.toList();
  }

  static List<Map<String, dynamic>> listToJson(List<CategoryModel> models) {
    return models
        .map((instance) => <String, dynamic>{
              'name': instance.name,
              'isSelected': instance.isSelected,
              'children': instance.children,
            })
        .toList();
  }
}

@JsonSerializable()
class CategoryModels {
  List<CategoryModel> data;
  CategoryModels(this.data);

  factory CategoryModels.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelsToJson(this);
}

@JsonSerializable()
class CategoryChildModel {
  int id;
  String name;
  bool isSelected = false;
  CategoryChildModel({
    this.id,
    this.name,
    this.isSelected,
  });

  factory CategoryChildModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryChildModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryChildModelToJson(this);

  static List<Map<String, dynamic>> listToJson(
      List<CategoryChildModel> models) {
    return models
        .map((instance) => <String, dynamic>{
              'name': instance.name,
              'isSelected': instance.isSelected,
              'id': instance.id,
            })
        .toList();
  }
}
