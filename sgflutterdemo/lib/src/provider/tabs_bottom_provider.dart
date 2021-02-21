import 'package:flutter/material.dart';

class TabsBottomProvider with ChangeNotifier {
  int tabIndex = 0;

  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
