import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class OneSocialApps extends StatelessWidget {
  const OneSocialApps({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    final List<Map<String, dynamic>> apps = [
      {
        'appName': 'LinkedIn',
        'logo': Logos.linkedin,
        'stars': '4.4',
        'url': 'https://www.linkedin.com/in/omar-flores-salazar-1a30a1238/'
      },
      {
        'appName': 'YouTube',
        'logo': Logos.youtube,
        'stars': '4.8',
        'url': 'https://www.youtube.com/channel/UC_cmrlJAvgCmO5MHdcI2FPw'
      },
      {
        'appName': 'Instagram',
        'logo': Logos.instagram,
        'stars': '4.2',
        'url': 'https://www.instagram.com/sazarcode/'
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Social Media',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Text(
                  'Follow me on my social media networks',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Scrollbar(
            controller: scrollController,
            thumbVisibility: false,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: List.generate(apps.length, (index) {
                    return socialAppsIcons(
                      name: apps[index]['appName'],
                      stars: apps[index]['stars'],
                      logo: apps[index]['logo'],
                      url: apps[index]['url'],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget socialAppsIcons({
    required String name,
    required String stars,
    required String logo,
    required String url,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
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
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Logo(
                      logo,
                      size: 100,
                    ),
                  ),
                ),
                Text(name),
                Row(
                  children: [
                    Text(stars),
                    const Icon(
                      Icons.star,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
