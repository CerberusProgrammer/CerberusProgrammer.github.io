import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/components/providers/theme_changer.dart';
import 'package:sazarcode/config/router/app_router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
    )
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: context.watch<ThemeChanger>().getThemeData,
    );
  }
}
