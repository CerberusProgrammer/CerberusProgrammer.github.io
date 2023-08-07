import 'package:go_router/go_router.dart';
import 'package:sazarcode/widgets/screens/blog/blog_screen.dart';

import '../../widgets/screens/dashboard.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'dashboard',
      builder: (context, state) => const Dashboard(),
      routes: [
        GoRoute(
          path: 'blog',
          name: 'blog-screen',
          builder: (context, state) => const BlogScreen(),
        )
      ],
    ),
  ],
);
