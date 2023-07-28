import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lorempisum'),
        actions: [
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
            child: const Text('Portfolio'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Contact'),
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: const _DashboardScreenView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeIn(
                delay: const Duration(seconds: 3),
                child: const Text('Learn more')),
            BounceInDown(
              delay: const Duration(seconds: 4),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardScreenView extends StatelessWidget {
  const _DashboardScreenView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 128),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PresentationScreen(),
        ],
      ),
    );
  }
}

class _PresentationScreen extends StatelessWidget {
  const _PresentationScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeIn(
          delay: const Duration(seconds: 1),
          child: const Text(
            'Brand Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        FadeIn(
          duration: const Duration(milliseconds: 1500),
          child: const SizedBox(
            width: 200,
            child: Divider(),
          ),
        ),
        FadeIn(
          duration: const Duration(seconds: 2),
          child: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        FadeIn(
            duration: const Duration(milliseconds: 2500),
            child: OutlinedButton(
                onPressed: () {}, child: const Text('Hired me'))),
      ],
    );
  }
}
