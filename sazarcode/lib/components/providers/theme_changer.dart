import 'package:flutter/material.dart';
import 'package:sazarcode/config/theme/app_theme.dart';

class ThemeChanger extends ChangeNotifier {
  int indexTheme = 8;

  ThemeData get getThemeData {
    ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppTheme.colors[indexTheme],
      useMaterial3: true,
    );

    return themeData;
  }

  void selectTheme(int index) {
    indexTheme = index;
    notifyListeners();
  }
}
