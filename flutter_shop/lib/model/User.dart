import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

//这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class Animal {
  List<User> list;
  int sex;

  Animal({this.list, this.sex});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return _$AnimalFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnimalToJson(this);
  }
}
