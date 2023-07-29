import 'package:flutter/material.dart';

import '../shared/card_description.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final widgetContent = const [
    CardDescription(
      icon: Icons.palette,
      subtitle: 'I design beautiful interfaces with:',
      title: 'Frontend Dev',
      subtitleContent: 'Flutter, Angular, CSS',
      triTitle: 'My DevTools:',
      triSubtitle:
          'Android Studio\nBootstrap\nFigma\nFluent\nGitHub\nIntelliJ\nMaterial\nTerminal\nVS Code',
    ),
    CardDescription(
      icon: Icons.computer,
      subtitle: 'Languages I use for secure apps:',
      title: 'Backend Dev',
      subtitleContent: 'Django, Java Spring, Firebase, PostgreSQL, Git',
      triTitle: 'My DevTools:',
      triSubtitle: 'Docker\nGitHub\nPostman\nTableplus\nTerminal\nVS Code',
    ),
    CardDescription(
      icon: Icons.phone_android,
      subtitle: 'For multiplatform apps I use:',
      title: 'Apps Dev',
      subtitleContent: 'Flutter, Java, Electron.js, SQLite',
      triTitle: 'My DevTools:',
      triSubtitle:
          'Figma\nFluent\nIntelliJ\nJavaFX\nMaterial\nScene Builder\nTerminal\nVS Code',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _PresentationText(),
        if (MediaQuery.of(context).size.width < 900)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: widgetContent,
            ),
          ),
        if (MediaQuery.of(context).size.width > 900)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widgetContent.length, (index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  height: MediaQuery.of(context).size.width < 1200 ? 700 : 650,
                  child: widgetContent[index],
                );
              }),
            ),
          ),
      ],
    );
  }
}

class _PresentationText extends StatelessWidget {
  const _PresentationText();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding:
            EdgeInsets.all(64.0 * (MediaQuery.of(context).size.width) / 400),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Hi I\'m Omar. Greatings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Since beginning my journey as a freelance designer over 11 years ago, Ive done remote work for agencies, consulted for startups, and collaborated with talented people to create digital products for both business and consumer use. Im quietly confident, naturally curious, and perpetually working on improving my chops one design problem at a time.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
