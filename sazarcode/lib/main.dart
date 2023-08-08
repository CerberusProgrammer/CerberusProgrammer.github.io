import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/widgets/providers/blog_provider.dart';
import 'package:sazarcode/widgets/providers/scroll_controller_provider.dart';
import 'package:sazarcode/widgets/providers/theme_changer_provider.dart';
import 'package:sazarcode/widgets/screens/blog/blog_list_screen.dart';
import 'package:sazarcode/widgets/screens/blog/blog_screen.dart';
import 'package:sazarcode/widgets/screens/dashboard.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeChangerProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ScrollControllerProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) {
        final blogProvider = BlogProvider();
        blogProvider.syncBlogs();
        return blogProvider;
      },
    )
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeChangerProvider>().getThemeData,
      routes: {
        '/': (context) => const Dashboard(),
        '/blog': (context) => const BlogListScreen(),
        '/blog-content': (context) => const BlogScreen(),
      },
    );
  }
}
