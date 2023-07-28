import 'package:go_router/go_router.dart';
import '../../components/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'dashboard',
      builder: (context, state) => const AboutScreen(),
      routes: const [],
    ),
  ],
);
