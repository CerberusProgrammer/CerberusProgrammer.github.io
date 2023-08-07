import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/components/providers/scroll_controller_provider.dart';
import 'package:sazarcode/components/providers/theme_changer_provider.dart';
import 'package:sazarcode/config/router/app_router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeChangerProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ScrollControllerProvider(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: context.watch<ThemeChangerProvider>().getThemeData,
    );
  }
}
