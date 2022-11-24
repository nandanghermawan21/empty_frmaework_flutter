import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int counter = 0;

  void addCounter() {
    counter = counter + 1;
    commit();
  }

  void commit() {
    notifyListeners();
  }
}
