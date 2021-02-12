import "package:json_annotation/json_annotation.dart";
part "HotGoodsModel.g.dart";

@JsonSerializable()
class HotGoodsModel {
  int id;
  String title;
  int price;
  int marketprice;
  String url;

  HotGoodsModel({
    this.id,
    this.title,
    this.price,
    this.marketprice,
    this.url,
  });

  factory HotGoodsModel.fromJson(dynamic json) => _$HotGoodsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotGoodsModelToJson(this);

  static List<HotGoodsModel> listFromJson(dynamic json) {
    return (json as List)
        ?.map(
          (e) => e == null ? null : HotGoodsModel.fromJson(e),
        )
        .toList();
  }

  static List<Map<String, dynamic>> listToJson(List<HotGoodsModel> models) {
    return models
        .map((instance) => <String, dynamic>{
              'id': instance.id,
              'title': instance.title,
              'price': instance.price,
              'marketprice': instance.marketprice,
              'url': instance.url
            })
        .toList();
  }
}
