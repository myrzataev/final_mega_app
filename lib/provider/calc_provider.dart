import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier {
  bool isMax = false;
  bool isMin = true;
  int number = 0;
  void increment() {
    isMin = false;
    if (number < 10) {
      number++;
    } else if (number == 10) {
      isMax = true;
    }
    notifyListeners();
  }

  void decrement() {
    if (number > 0) {
      number--;
     
    }
    else if(number == 0){
       isMin = true;
    }
    notifyListeners();
  }
}
