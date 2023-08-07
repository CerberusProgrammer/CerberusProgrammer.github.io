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
              'I’m a programmer passionate about constant learning and innovation. I specialize in developing mobile and desktop applications that adapt to the needs of users. My goal is to keep improving my skills and knowledge to create innovative technological solutions.',
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
