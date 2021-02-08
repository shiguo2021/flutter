import "package:flutter/material.dart";

class Counter with ChangeNotifier {
  int _value = 3;

  int get value => _value;

  // Counter(this._value);

  void add() {
    _value++;
    notifyListeners();
  }
}
