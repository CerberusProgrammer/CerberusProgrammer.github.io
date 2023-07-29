import 'package:flutter/material.dart';

class AppTheme {
  final int indexColor = 8;
  final List<Color> themeColor = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Color(0xFF4CAF50),
    Colors.lightGreen,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.blueGrey
  ];
  final bool isDarkMode = false;

  ThemeData getAppTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: themeColor[indexColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );
}
