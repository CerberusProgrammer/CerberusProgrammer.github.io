import 'package:flutter/material.dart';

class CardDescription extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitleContent;
  final String triTitle;
  final String triSubtitle;

  const CardDescription({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.subtitleContent,
    required this.triTitle,
    required this.triSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                bottom: 8,
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    icon,
                    size: 64,
                  ),
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              subtitleContent,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              triTitle,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              triSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
