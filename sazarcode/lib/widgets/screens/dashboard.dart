import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/widgets/providers/scroll_controller_provider.dart';
import 'package:sazarcode/widgets/screens/about_screen.dart';
import 'package:sazarcode/widgets/screens/footer_screen.dart';
import 'package:sazarcode/widgets/screens/presentation_screen.dart';
import 'package:sazarcode/widgets/screens/work_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final appBarItems = [
      TextButton(
        onPressed: () {
          context.read<ScrollControllerProvider>().moveToAbout();
        },
        child: const Text('About'),
      ),
      TextButton(
        onPressed: () {
          context.read<ScrollControllerProvider>().moveToWork();
        },
        child: const Text('Work'),
      ),
      TextButton(
        onPressed: () {
          context.read<ScrollControllerProvider>().moveToFooter();
        },
        child: const Text('Contact'),
      ),
      FilledButton(
        onPressed: () {
          context.pushNamed('blog-screen');
        },
        child: const Text('Blog'),
      ),
      const SizedBox(width: 16)
    ];

    return Scaffold(
      appBar: MediaQuery.of(context).size.width > 525
          ? AppBar(
              title: const Text('SazarCode'),
              actions: appBarItems,
            )
          : AppBar(title: const Center(child: Text('SazarCode'))),
      body: const _DashboardScreenView(),
    );
  }
}

class _DashboardScreenView extends StatelessWidget {
  const _DashboardScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: context.watch<ScrollControllerProvider>().scrollController,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const PresentationScreen(),
        ),
        const AboutScreen(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 128),
          child: WorkScreen(),
        ),
        const FooterScreen(),
      ],
    );
  }
}
