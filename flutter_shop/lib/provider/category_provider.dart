import "package:flutter/material.dart";

import '../model/CategoryModel.dart';
import '../model/HotGoodsModel.dart';
import '../service/service_methd.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryChildModel> categoryChilds = [];
  List<CategoryModel> categorys = [];
  List<HotGoodsModel> hotGoods = [];

  void initData(List<CategoryModel> list) {
    if (list.length > 0) {
      list.first.isSelected = true;
      CategoryChildModel allModel =
          CategoryChildModel(id: 0, name: "全部", isSelected: true);
      categoryChilds = [allModel]..addAll(list.first.children);
    }
    categorys = list;
    fetchHotGoods();
    notifyListeners();
  }

  void categoryClickAt(int index) {
    categorys.forEach((e) {
      e.isSelected = false;
    });
    categorys[index].isSelected = true;

    List<CategoryChildModel> list =
        categorys.where((e) => e.isSelected == true).toList()[0].children;
    List filterList =
        list.where((element) => element.isSelected == true).toList();
    // print({'filterList': filterList});

    bool isSelected = filterList.length == 0;

    CategoryChildModel allModel =
        CategoryChildModel(id: 0, name: "全部", isSelected: isSelected);
    categoryChilds = [allModel];
    categoryChilds.addAll(list);

    fetchHotGoods();
    notifyListeners();
  }

  void categoryChildClickAt(int index) {
    categoryChilds.forEach((element) {
      element.isSelected = false;
    });
    categoryChilds[index].isSelected = true;

    fetchHotGoods();
    notifyListeners();
  }

  void fetchHotGoods() async {
    hotGoods = [];
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 350));

    CategoryModel category =
        categorys.where((element) => element.isSelected == true).first;
    CategoryChildModel categoryChild =
        categoryChilds.where((element) => element.isSelected == true).first;

    var value = await getRequest("hotGoods");
    List<HotGoodsModel> models = HotGoodsModel.listFromJson(value);
    print({
      'category-name': category.name,
      'categoryChild-name': categoryChild.name,
      // 'hotGoods': HotGoodsModel.listToJson(models),
    });

    hotGoods = models;
    notifyListeners();
  }

  // Future<List<HotGoodsModel>> fetchHotGoods() async {
  //   dynamic value = await getRequest("hotGoods");
  //   List<HotGoodsModel> models = HotGoodsModel.listFromJson(value);
  //   print({'models': HotGoodsModel.listToJson(models)});
  //   return models;
  // }

  Future<List<CategoryModel>> fetchCategorys() async {
    dynamic value = await getRequest("categorys");
    List<CategoryModel> models = CategoryModel.listFromJson(value);
    print({'models': CategoryModel.listToJson(models)});
    return models;
  }
}
