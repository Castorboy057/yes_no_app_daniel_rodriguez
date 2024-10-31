import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 212, 17, 17);

const List<Color>_colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.yellow,
  Colors.pink,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
}); 


  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[6]
    );
  }
}