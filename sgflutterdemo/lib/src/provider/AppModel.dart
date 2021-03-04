import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel with ChangeNotifier {
  bool isLogin = false;

  void initModel() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLogin = false;
    sp.clear();
    notifyListeners();
  }

  void readModel() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLogin = sp.getBool("@isLogin") == true;
    notifyListeners();
  }

  void setModel(String key, dynamic value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value is bool) {
      sp.setBool(key, value);
    }
    if (value is String) {
      sp.setString(key, value);
    }
    notifyListeners();
  }

/**tab_bottom设置 */
  int tabIndex = 0;
  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
