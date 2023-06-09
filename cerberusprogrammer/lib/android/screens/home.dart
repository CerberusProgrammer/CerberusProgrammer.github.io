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
        return MediaQuery.of(context).orientation == Orientation.landscape
            ? ListView(
                shrinkWrap: true,
                children: const [
                  MainCard(),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: ContactMeApps(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: FeaturedApps(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: OneSocialApps(),
                  ),
                ],
              )
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Wrap(
                          children: List.generate(2, (index) {
                        return SizedBox(
                          width: constraints.maxWidth / 1,
                          height: constraints.maxHeight / 1.8,
                        );
                      })),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
