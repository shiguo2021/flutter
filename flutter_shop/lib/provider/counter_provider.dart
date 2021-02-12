import "package:flutter/material.dart";

class CounterProvider with ChangeNotifier {
  int _value = 3;
  String _name = "sg";
  int get value => _value;

  String get name => _name;

  // Counter(this.value);

  void add() {
    _value++;
    notifyListeners();
  }
}
