import 'package:flutter/material.dart';
import 'package:sazarcode/components/screens/about_screen.dart';
import 'package:sazarcode/components/screens/footer_screen.dart';
import 'package:sazarcode/components/screens/presentation_screen.dart';
import 'package:sazarcode/components/screens/work_screen.dart';

import '../shared/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarItems = [
      TextButton(
        onPressed: () {},
        child: const Text('About'),
      ),
      TextButton(
        onPressed: () {},
        child: const Text('Experience'),
      ),
      TextButton(
        onPressed: () {},
        child: const Text('Work'),
      ),
      TextButton(
        onPressed: () {},
        child: const Text('Contact'),
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
