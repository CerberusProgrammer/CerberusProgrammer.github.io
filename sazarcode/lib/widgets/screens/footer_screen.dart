import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/widgets/providers/theme_changer_provider.dart';
import 'package:sazarcode/config/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: const Stack(
        children: [
          _SocialMedia(),
          _IconsChangeTheme(),
          _ContactInformation(),
        ],
      ),
    );
  }
}

class _SocialMedia extends StatelessWidget {
  const _SocialMedia();

  @override
  Widget build(BuildContext context) {
    final List<IconData> iconsData = [
      FontAwesomeIcons.facebook,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.youtube,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.github,
    ];

    final List<String> urlsData = [
      'https://www.facebook.com/HangingEmperor/',
      'https://www.instagram.com/sazarcode/',
      'https://www.youtube.com/channel/UC_cmrlJAvgCmO5MHdcI2FPw',
      'https://www.linkedin.com/in/omar-flores-salazar-1a30a1238/',
      'https://github.com/CerberusProgrammer',
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        color: Theme.of(context).colorScheme.primary.withAlpha(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Follow me in my social media',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(iconsData.length, (index) {
                return IconButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(urlsData[index]);

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  icon: Icon(
                    iconsData[index],
                    size: 46,
                    color: Colors.white,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInformation extends StatelessWidget {
  const _ContactInformation();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 64),
              child: MediaQuery.of(context).orientation == Orientation.landscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Want to work together?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                        FilledButton(
                          onPressed: () async {
                            final Uri params = Uri(
                              scheme: 'mailto',
                              path: 'cerberusprogrammer@gmail.com',
                              query:
                                  'subject=[Write me your request]&body=[Tell me about your request]',
                            );

                            if (await canLaunchUrl(params)) {
                              await launchUrl(params);
                            }
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Contact me',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Want to work together?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 15,
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Contact me',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconsChangeTheme extends StatelessWidget {
  const _IconsChangeTheme();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32, left: 64, right: 64),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(AppTheme.colors.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppTheme.colors[index],
                  side: const BorderSide(
                      color: Color.fromARGB(70, 35, 35, 35), width: 8),
                ),
                onPressed: () {
                  context.read<ThemeChangerProvider>().selectTheme(index);
                },
                icon: const Text(''),
              ),
            );
          }),
        ),
      ),
    );
  }
}
