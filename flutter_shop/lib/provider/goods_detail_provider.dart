import 'package:flutter/material.dart';
import "package:flutter_shop/model/GoodsDetailModel.dart";
import "package:flutter_shop/service/service_methd.dart";

class GoodsDetailProvider with ChangeNotifier {
  GoodsDetailModel detailModel;

  int tabbarSelectedAt = 0;

  Future<GoodsDetailModel> loadData() {
    final result = getRequest("goodsDetail").then((value) {
      detailModel = GoodsDetailModel.fromJson(value);
      notifyListeners();
      return detailModel;
    });
    return result;
  }

  tabbarClickAt(int index) {
    tabbarSelectedAt = index;
    notifyListeners();
  }
}
