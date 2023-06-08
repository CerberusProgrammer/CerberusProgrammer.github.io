import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayStoreDisplay extends StatelessWidget {
  const PlayStoreDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                Text(
                  'SazarCode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    color: Colors.black.withAlpha(
                      180,
                    ),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Omar Flores',
                                  style: TextStyle(fontWeight: FontWeight.w500),
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
                                    fontSize: 14, color: Colors.black),
                              )),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
