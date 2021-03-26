import 'package:flutter/material.dart';

class BalanceModel extends ChangeNotifier {
  double value;

  BalanceModel(this.value);

  void add(double value) {
    this.value += value;

    notifyListeners();
  }

  void sub(double value) {
    this.value -= value;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $value';
  }
}
