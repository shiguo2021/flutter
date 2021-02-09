import "package:flutter/material.dart";

import '../model/CategoryModel.dart';

class CategoryChild with ChangeNotifier {
  List<CategoryChildModel> categoryChildren = [];

  void setChildren(List list) {
    categoryChildren = list;
    notifyListeners();
  }
}
