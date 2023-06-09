import 'package:cerberusprogrammer/android/cards/big_card.dart';
import 'package:flutter/material.dart';

List<BigCard> cards = [
  const BigCard(
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
  const BigCard(
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
  const BigCard(
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
];
