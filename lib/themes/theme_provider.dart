import 'package:flutter/material.dart';
import 'package:hymn/themes/dark_mode.dart';
import 'package:hymn/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Initially light mode
  ThemeData _themeData = lightMode;

  // Get theme
  ThemeData get themeData => _themeData;

  // Is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // Update UI
    notifyListeners();
  }

  // Toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    // Update UI
    notifyListeners();
  }
}
