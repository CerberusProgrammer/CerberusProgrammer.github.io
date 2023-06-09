import 'package:cerberusprogrammer/android/screens/apps/display_app.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BigCard extends StatelessWidget {
  final String nameApp;
  final String author;
  final String advertisement;
  final String title;
  final String description;
  final String banner;
  final Color color;
  final String logo;
  final String url;

  const BigCard({
    super.key,
    required this.nameApp,
    required this.author,
    required this.advertisement,
    required this.title,
    required this.description,
    required this.banner,
    required this.color,
    required this.logo,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
            return const DisplayApp();
          }));
        },
        child: Card(
          elevation: 2,
          color: color.withAlpha(220),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: constraints.maxHeight / 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    banner,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (constraints.maxWidth / 22) > 22
                          ? 24
                          : constraints.maxWidth / 22,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: const Color.fromARGB(180, 255, 255, 255),
                      fontSize: (constraints.maxWidth / 30) > 18
                          ? 18
                          : constraints.maxWidth / 30,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(17),
                        elevation: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            logo,
                            width: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameApp,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            author,
                            style:
                                TextStyle(color: Colors.white.withAlpha(200)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white.withAlpha(60)),
                            onPressed: () async {
                              final uri = Uri.parse(url);

                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $uri';
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Install',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          Text(
                            advertisement,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
