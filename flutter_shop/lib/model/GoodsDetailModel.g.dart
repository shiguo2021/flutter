// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GoodsDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetailModel _$GoodsDetailModelFromJson(Map<String, dynamic> json) {
  return GoodsDetailModel(
      goodsName: json['goodsName'],
      goodsUrl: json['goodsUrl'],
      NO: json['NO'],
      price: (json['price'] as num)?.toDouble(),
      marketprice: (json['marketprice'] as num)?.toDouble());
}

Map<String, dynamic> _$GoodsDetailModelToJson(GoodsDetailModel instance) =>
    <String, dynamic>{
      'goodsName': instance.goodsName,
      'goodsUrl': instance.goodsUrl,
      'NO': instance.NO,
      'price': instance.price,
      'marketprice': instance.marketprice
    };
