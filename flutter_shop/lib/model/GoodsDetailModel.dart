import 'package:flutter/material.dart';
import "package:json_annotation/json_annotation.dart";
part 'GoodsDetailModel.g.dart';

@JsonSerializable()
class GoodsDetailModel {
  String goodsName;
  String goodsUrl;
  String NO;
  double price;
  double marketprice;

  GoodsDetailModel({
    @required this.goodsName,
    this.goodsUrl,
    @required this.NO,
    this.price,
    this.marketprice,
  });

  factory GoodsDetailModel.fromJson(Map<String, dynamic> json) {
    return _$GoodsDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoodsDetailModelToJson(this);
  }
}
