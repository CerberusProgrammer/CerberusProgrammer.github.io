import 'package:flutter/material.dart';

import 'big_card.dart';

class FeaturedApps extends StatelessWidget {
  const FeaturedApps({super.key});

  final List<BigCard> cards = const [
    BigCard(
      nameApp: 'NutriPlato',
      author: 'SazarCode',
      advertisement: 'No Ads',
      title: 'Nutricion saludable en tus manos',
      description: 'Haz un cambio para ti.',
      banner: 'lib/assets/nutriplato/main_banner.png',
      color: Colors.purple,
      logo: 'lib/assets/nutriplato/nutriplato.webp',
      url:
          'https://play.google.com/store/apps/details?id=com.sazarcode.nutriplato',
    ),
    BigCard(
      nameApp: 'Enfo',
      author: 'SazarCode',
      advertisement: 'No Ads',
      title: 'Aesthetic Pomodoro Timer',
      description: 'Be simple. Be dynamic. Be aesthetic.',
      banner: 'lib/assets/enfo/banner.png',
      color: Colors.green,
      logo: 'lib/assets/enfo/enfo.webp',
      url: 'https://play.google.com/store/apps/details?id=com.sazarcode.enfo',
    ),
    BigCard(
      nameApp: 'What to Do?',
      author: 'SazarCode',
      advertisement: 'Ads Included',
      title: 'The app that tells you what to do',
      description: 'Discover, filter, share and live!',
      banner: 'lib/assets/wtd/banner.png',
      color: Colors.blueGrey,
      logo: 'lib/assets/wtd/wtd.webp',
      url:
          'https://play.google.com/store/apps/details?id=com.sazarcode.what_to_do',
    ),
    BigCard(
      nameApp: 'Inspire Me',
      author: 'SazarCode',
      advertisement: 'Ads Included',
      title: 'Feeling frusttation?',
      description: 'Time to feel inspired with some famous quotes.',
      banner: 'lib/assets/inspireme/banner.png',
      color: Colors.black,
      logo: 'lib/assets/inspireme/inspireme.webp',
      url:
          'https://play.google.com/store/apps/details?id=com.sazarcode.inspire_me',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Featured Apps',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8),
          child: Text(
            'My most favorite apps',
            style: TextStyle(),
          ),
        ),
        Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(cards.length, (index) {
                  return SizedBox(
                    width: 450,
                    height: 300,
                    child: cards[index],
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
