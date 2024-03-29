import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 128),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/undraw_programming_re_kg9v.svg',
            height: MediaQuery.of(context).size.width / 8,
          ),
          const Text('Full Stack Developer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(width: 250, child: Divider()),
          const Text(
              "I design beautiful applications in Adnroid & iOS. And intuitve apps for Desktop and Web platforms.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center),
          const SizedBox(height: 150),
          OutlinedButton(
              onPressed: () async {
                final Uri url =
                    Uri.parse('https://es.fiverr.com/salazarprograms');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text('Hired me')),
        ],
      ),
    );
  }
}
