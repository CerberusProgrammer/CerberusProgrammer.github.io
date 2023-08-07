import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assetsPath = [
      'assets/png/nutriplato.png',
      'assets/png/inspireme.png',
      'assets/png/enfo.png',
    ];

    final List<String> urlsPath = [
      'https://play.google.com/store/apps/details?id=com.sazarcode.nutriplato',
      'https://play.google.com/store/apps/details?id=com.sazarcode.inspire_me',
      'https://play.google.com/store/apps/details?id=com.sazarcode.enfo',
    ];

    final List<Widget> widgetsWork = List.generate(3, (index) {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse(urlsPath[index]);

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  assetsPath[index],
                ),
              ),
            ),
          ],
        ),
      ));
    });

    return Column(
      children: [
        const Center(
          child: Text('My recent work', style: TextStyle(fontSize: 32)),
        ),
        const Text('Here are the project that I build.',
            style: TextStyle(fontSize: 18)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.height / 2
                        : MediaQuery.of(context).size.height,
                child:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? Row(children: widgetsWork)
                        : Column(children: widgetsWork),
              )
            ],
          ),
        ),
      ],
    );
  }
}
