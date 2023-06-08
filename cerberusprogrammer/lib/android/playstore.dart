import 'package:cerberusprogrammer/android/playstore_display.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayStore extends StatelessWidget {
  const PlayStore({super.key});

  Widget cardApp({
    required String nameApp,
    required String author,
    required String advertisement,
    required String title,
    required String description,
    required String banner,
    required Color color,
    required String logo,
    required String url,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Card(
          elevation: 2,
          color: Colors.purple.withAlpha(50),
          child: Column(children: [
            SizedBox(
              height: 250,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color.fromARGB(180, 255, 255, 255),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
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
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.purple.withAlpha(100)),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          focusNode: focusNode,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(40),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(40),
              ),
              filled: true,
              hintText: 'Search my apps in the Play Store'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 1.0, right: 15),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return const PlayStoreDisplay();
                    });
              },
              child: CircleAvatar(
                maxRadius: 23,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                      'https://avatars.githubusercontent.com/u/66286300?v=4'),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(children: [
        cardApp(
          nameApp: 'NutriPlato',
          author: 'SazarCode',
          advertisement: 'No Ads',
          title: 'Nutricion saludable en tus manos',
          description:
              'Mejora tu alimentacion con una aplicacion que te ayuda a tener un plato saludable.',
          banner: 'lib/assets/nutriplato/main_banner.png',
          color: Colors.purple,
          logo: 'lib/assets/nutriplato/nutriplato.webp',
          url:
              'https://play.google.com/store/apps/details?id=com.sazarcode.nutriplato',
        ),
      ]),
    );
  }
}
