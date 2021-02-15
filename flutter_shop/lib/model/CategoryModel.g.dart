// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
      json['name'] as String,
      (json['children'] as List)
          ?.map((e) => e == null
              ? null
              : CategoryChildModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['isSelected'] as bool);
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'children': instance.children,
      'isSelected': instance.isSelected
    };

CategoryModels _$CategoryModelsFromJson(Map<String, dynamic> json) {
  return CategoryModels((json['data'] as List)
      ?.map((e) =>
          e == null ? null : CategoryModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CategoryModelsToJson(CategoryModels instance) =>
    <String, dynamic>{'data': instance.data};

CategoryChildModel _$CategoryChildModelFromJson(Map<String, dynamic> json) {
  return CategoryChildModel(
      id: json['id'] as int,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool);
}

Map<String, dynamic> _$CategoryChildModelToJson(CategoryChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected
    };
