// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['name'] as String, json['email'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'name': instance.name, 'email': instance.email};

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return Animal(
      list: (json['list'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      sex: json['sex'] as int);
}

Map<String, dynamic> _$AnimalToJson(Animal instance) =>
    <String, dynamic>{'list': instance.list, 'sex': instance.sex};
