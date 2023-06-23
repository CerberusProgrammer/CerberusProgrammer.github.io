import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cerberusprogrammer/firebase_options.dart';
import 'package:cerberusprogrammer/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'android/playstore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  final prefs = await SharedPreferences.getInstance();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  Themes.defaultIndex = prefs.getInt('defaultIndex') ?? 0;

  runApp(
    AdaptiveTheme(
      builder: (ThemeData theme, ThemeData darkTheme) {
        Themes.darkTheme = theme.brightness == Brightness.dark;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SazarCode',
          theme: theme,
          darkTheme: darkTheme,
          home: const PlayStore(),
        );
      },
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      light: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Themes.colors[Themes.defaultIndex],
        useMaterial3: true,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Themes.colors[Themes.defaultIndex],
        useMaterial3: true,
      ),
    ),
  );
}
