import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Card(
          elevation: 0,
          color: color,
          child: const Center(
            child: Text(
              'Welcome, I\'m Omar, a Flutter Developer.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
