import 'package:cerberusprogrammer/android/playstore.dart';
import 'package:flutter/material.dart';

class MainAndroid extends StatelessWidget {
  const MainAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const PlayStore(),
    );
  }
}
