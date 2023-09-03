import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 242, 135, 158);

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1);

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]
    // brightness: Brightness.dark
    );
  }
}
