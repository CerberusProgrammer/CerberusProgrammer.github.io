import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeApps extends StatelessWidget {
  const ContactMeApps({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    final List<Map<String, dynamic>> apps = [
      {
        'appName': 'Buy me a coffee',
        'logo': Logos.buymeacoffee,
        'stars': '5.0',
        'url': 'https://www.buymeacoffee.com/sazarcode'
      },
      {
        'appName': 'Gmail',
        'logo': Logos.gmail,
        'stars': '4.9',
        'url': 'mailto:cerberusprogrammer@gmail.com'
      },
      {
        'appName': 'GitHub',
        'logo': Logos.github,
        'stars': '4.8',
        'url': 'https://github.com/CerberusProgrammer'
      },
    ];

    return Scrollbar(
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
