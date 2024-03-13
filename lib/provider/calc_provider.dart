
import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier {
  bool isMax = false;
  bool isMin = true;
  int number = 0;
  void increment(bool isDarkMode) {
    isMin = false;
    if (number < 10 && isDarkMode) {
      number = number + 2;
    }
    if (number < 10) {
      number++;
    } else if (number >= 10) {
      isMax = true;
    }
    notifyListeners();
  }

  void decrement(bool isDarkMode) {
    if (number > 0 && isDarkMode) {
      number = number - 2;
    } else if (number > 0) {
      number--;
    } else if (number <= 0) {
      isMin = true;
    }
    notifyListeners();
  }
}
