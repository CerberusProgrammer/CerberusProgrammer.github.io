import 'package:cerberusprogrammer/android/main.dart';
import 'package:cerberusprogrammer/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final prefs = await SharedPreferences.getInstance();

  Themes.defaultIndex = prefs.getInt('defaultIndex') ?? 10;
  //bool presentation = prefs.getBool('presentation') ?? true;

  runApp(const MainAndroid());
}
