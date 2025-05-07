import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
