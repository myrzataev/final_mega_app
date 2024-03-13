import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  Color currentColor() {
    return isDarkMode ? const Color(0xff5A3F3F) : Colors.white;
  }

  void changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
