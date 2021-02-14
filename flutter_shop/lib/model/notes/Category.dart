import 'package:json_annotation/json_annotation.dart';
part 'Category.g.dart';

/**
 * 这样就可以执行下面的命令
 * 
 * flutter packages pub run build_runner build
 * 或者
 * flutter packages pub run build_runner watch
 */

// dependencies:
//   # Your other regular dependencies here
//   json_annotation: ^2.0.0

// dev_dependencies:
//   # Your other dev_dependencies here
//   build_runner: ^1.0.0
//   json_serializable: ^2.0.0
@JsonSerializable()
class Category {
  String mallCategoryId; //类别编号
  String mallCategoryName; //类别名称
  List<dynamic> bxMallSubDto;
  // dynamic comments;
  // Null comments;  //不能用Null 会报错
  String image;

  // Category(
  //   this.mallCategoryId,
  //   this.mallCategoryName,
  //   this.bxMallSubDto,
  //   // this.comments,
  //   this.image,
  // );

  // factory Category.fromJson(Map<String, dynamic> json) =>
  //     _$CategoryFromJson(json);

  // Map<String, dynamic> toJson() => _$CategoryToJson(this);

  // factory CategoryModel.fromJson(Map<String, dynamic> json) {
  //   return _$ModelFromJson(json);
  // }

  // Map<String, dynamic> toJson() {
  //   return _$ModelToJson(this);
  // }

}
