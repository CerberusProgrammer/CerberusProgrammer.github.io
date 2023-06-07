import 'package:flutter/material.dart';

import 'home.dart';

class MainAndroid extends StatelessWidget {
  const MainAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const AndroidHome(),
    );
  }
}
