import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cerberusprogrammer/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayStoreDisplay extends StatefulWidget {
  const PlayStoreDisplay({super.key});

  @override
  State<PlayStoreDisplay> createState() => _PlayStoreDisplayState();
}

class _PlayStoreDisplayState extends State<PlayStoreDisplay> {
  late bool theme;

  @override
  void initState() {
    super.initState();
    theme = Themes.darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Dialog(
      child: SizedBox(
        width: isPortrait ? null : x / 2,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  const Spacer(),
                  const Text(
                    'SazarCode',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                maxRadius: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                      'https://avatars.githubusercontent.com/u/66286300?v=4'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Omar Flores',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'cerberusprogrammer@gmail.com',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 130, 130, 130)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                onPressed: () async {
                                  final uri = Uri.parse(
                                      'https://github.com/CerberusProgrammer');

                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(
                                      uri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  } else {
                                    throw 'Could not launch $uri';
                                  }
                                },
                                child: const Text(
                                  'Visit my github profile',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Dark theme'),
                trailing: Switch(
                    value: theme,
                    onChanged: (value) {
                      setState(() {
                        if (value) {
                          AdaptiveTheme.of(context).setDark();
                        } else {
                          AdaptiveTheme.of(context).setLight();
                        }

                        theme = value;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Change Theme'),
                trailing: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const CircleBorder(),
                    side: const BorderSide(
                      color: Color.fromARGB(70, 35, 35, 35),
                      width: 8,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                height: 300,
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 4,
                                  children: List.generate(Themes.colors.length,
                                      (index) {
                                    return OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Themes.colors[index],
                                        side: const BorderSide(
                                          color: Color.fromARGB(70, 35, 35, 35),
                                          width: 8,
                                        ),
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          AdaptiveTheme.of(context).setTheme(
                                            light: Themes.changeTheme(
                                                index, false),
                                            dark:
                                                Themes.changeTheme(index, true),
                                          );
                                        });
                                        Navigator.pop(context);
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        prefs.setInt('defaultIndex', index);
                                      },
                                      child: null,
                                    );
                                  }),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
