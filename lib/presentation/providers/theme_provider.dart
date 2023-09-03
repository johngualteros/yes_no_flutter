import 'package:flutter/material.dart';
import 'package:yes_no_flutter/config/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  int selectedTheme = 0;
  setTheme(int theme) {
    selectedTheme = theme;
    notifyListeners();
    AppTheme(selectedColor: selectedTheme).theme();
  }
}