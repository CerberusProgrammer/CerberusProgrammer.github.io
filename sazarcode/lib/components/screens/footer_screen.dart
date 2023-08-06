import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/components/providers/theme_changer.dart';
import 'package:sazarcode/config/theme/app_theme.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactWidgets = [
      const Text(
        'Contact Me',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
        ),
      ),
      OutlinedButton(
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Send me an email',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      )
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Stack(
        children: [
          Align(
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
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                          size: 46,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
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
                        context.read<ThemeChanger>().selectTheme(index);
                      },
                      icon: const Text(''),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
                  child: MediaQuery.of(context).orientation ==
                          Orientation.landscape
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
                              width: MediaQuery.of(context).size.width / 7,
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
                                  'Send me an email',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Send me an email',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
