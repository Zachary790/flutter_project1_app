import 'package:flutter/material.dart';

class HYCounterViewModel with ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();  // 通知
  }
}