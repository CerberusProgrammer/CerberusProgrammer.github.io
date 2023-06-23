import 'package:cerberusprogrammer/android/presentation/blog/blog_section.dart';
import 'package:cerberusprogrammer/android/presentation/contact/contact_me_apps.dart';
import 'package:cerberusprogrammer/android/presentation/apps/featured_apps.dart';
import 'package:cerberusprogrammer/android/presentation/home/main_card.dart';
import 'package:cerberusprogrammer/android/presentation/social/one_social_apps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/blog/blog_provider.dart';

class AndroidHome extends StatefulWidget {
  const AndroidHome({super.key});

  @override
  State<AndroidHome> createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) {
              final blogPrivder = BlogProvider();
              blogPrivder.syncBlogs();
              return blogPrivder;
            })
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            shrinkWrap: true,
            children: const [
              MainCard(),
              ContactMeApps(),
              FeaturedApps(),
              OneSocialApps(),
              BlogSection(),
            ],
          );
        },
      ),
    );
  }
}
