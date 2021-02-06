// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(json['name'] as String);
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{'name': instance.name};

CategoryModels _$CategoryModelsFromJson(Map<String, dynamic> json) {
  return CategoryModels((json['data'] as List)
      ?.map((e) =>
          e == null ? null : CategoryModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CategoryModelsToJson(CategoryModels instance) =>
    <String, dynamic>{'data': instance.data};
