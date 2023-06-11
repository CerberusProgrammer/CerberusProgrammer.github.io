import 'package:cerberusprogrammer/android/screens/contact/contact_me_apps.dart';
import 'package:cerberusprogrammer/android/screens/apps/featured_apps.dart';
import 'package:cerberusprogrammer/android/screens/home/main_card.dart';
import 'package:cerberusprogrammer/android/screens/social/one_social_apps.dart';
import 'package:flutter/material.dart';

class AndroidHome extends StatefulWidget {
  const AndroidHome({super.key});

  @override
  State<AndroidHome> createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          shrinkWrap: true,
          children: const [
            MainCard(),
            ContactMeApps(),
            FeaturedApps(),
            OneSocialApps(),
          ],
        );
      },
    );
  }
}
