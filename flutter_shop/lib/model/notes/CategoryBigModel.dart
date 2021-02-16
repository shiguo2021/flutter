class CateroryBigModel {
  String mallCategoryId; //类别编号
  String mallCategoryName; //类别名称
  List<dynamic> bxMallSubDto;
  Null comments;
  String image;

  // CateroryBigModel({
  //   this.mallCategoryId,
  //   this.mallCategoryName,
  //   this.bxMallSubDto,
  //   this.comments,
  //   this.image,
  // });

  // factory CateroryBigModel.fromJson(dynamic json) {
  //   return CateroryBigModel(
  //     mallCategoryId: json["mallCategoryId"],
  //     mallCategoryName: json["mallCategoryName"],
  //     bxMallSubDto: json["bxMallSubDto"],
  //     comments: json["comments"],
  //     image: json['image'],
  //   );
  // }

  CateroryBigModel(
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image,
  );

  /***两种写法 */
  // CateroryBigModel.fromJson(dynamic json)
  //     : mallCategoryId = json['mallCategoryId'],
  //       mallCategoryName = json['mallCategoryName'],
  //       bxMallSubDto = json['bxMallSubDto'],
  //       comments = json['comments'],
  //       image = json['image'];

  CateroryBigModel.fromJson(dynamic json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    bxMallSubDto = json['bxMallSubDto'];
    comments = json['comments'];
    image = json['image'];
  }
}

class CategoryBigListModel {
  List<CateroryBigModel> data;
  CategoryBigListModel(this.data);

  factory CategoryBigListModel.fromJson(List json) {
    return CategoryBigListModel(
      json.map((e) => CateroryBigModel.fromJson(e)).toList(),
    );
  }
}
