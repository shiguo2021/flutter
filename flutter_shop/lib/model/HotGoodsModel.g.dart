// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotGoodsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotGoodsModel _$HotGoodsModelFromJson(Map<String, dynamic> json) {
  return HotGoodsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      marketprice: json['marketprice'] as int,
      url: json['url'] as String);
}

Map<String, dynamic> _$HotGoodsModelToJson(HotGoodsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'marketprice': instance.marketprice,
      'url': instance.url
    };
