import 'package:cerberusprogrammer/android/cards/contact_me_apps.dart';
import 'package:cerberusprogrammer/android/cards/main_card.dart';
import 'package:cerberusprogrammer/android/cards/one_social_apps.dart';
import 'package:flutter/material.dart';
import 'cards/cards.dart';

class AndroidHome extends StatefulWidget {
  const AndroidHome({super.key});

  @override
  State<AndroidHome> createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        return MediaQuery.of(context).orientation == Orientation.landscape
            ? ListView(
                shrinkWrap: true,
                children: [
                  const MainCard(),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        Text(
                          'Need an app?',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: ContactMeApps(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured Apps',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        Text(
                          'My most favorite apps',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Scrollbar(
                      controller: scrollController,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                              children: List.generate(cards.length, (index) {
                            return SizedBox(
                              width: constraints.maxWidth / 2.5,
                              height: constraints.maxHeight / 2.05,
                              child: cards[index],
                            );
                          })),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Social Media',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        Text(
                          'Follow me on my social media networks',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
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
                          child: cards[index],
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

/*
class _AndroidHomeState extends State<AndroidHome> {
  Widget iconApp(String logo, String url) {
    return IconButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 234, 231, 231),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(6)),
      onPressed: () async {
        if (url == "playstore") {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
            return const PlayStore();
          }));
        } else {
          final uri = Uri.parse(url);

          if (await canLaunchUrl(uri)) {
            await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
          } else {
            throw 'Could not launch $url';
          }
        }
      },
      icon: Logo(
        logo,
        size: 45,
      ),
    );
  }

  Widget imageIconApp(String logo, String url) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          logo,
          width: 56,
        ),
      ),
    );
  }

  Widget iconDashboard(String logo, String url, String nameApp) {
    return SizedBox(
      width: 56,
      child: Column(
        children: [
          iconApp(logo, url),
          Text(
            nameApp,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/background_2k.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Card(
                      color: Colors.white.withOpacity(0.4),
                      child: const Row(
                        children: [],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        spacing: 10,
                        children: [
                          iconDashboard(
                              Logos.buymeacoffee,
                              'https://www.buymeacoffee.com/sazarcode',
                              'Buy me a coffee'),
                          iconDashboard(
                              Logos.adobe_acrobatreader, '', 'Curriculum'),
                          iconDashboard(
                              Logos.linkedin,
                              'https://www.linkedin.com/in/omar-flores-salazar-1a30a1238/',
                              'LinkedIn'),
                          iconDashboard(
                              Logos.google_play, 'playstore', 'My Projects'),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white.withOpacity(0.4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                spacing: 5,
                                children: [
                                  iconApp(Logos.chrome, ''),
                                  iconApp(Logos.gmail, ''),
                                  iconApp(Logos.youtube,
                                      'https://www.youtube.com/channel/UC_cmrlJAvgCmO5MHdcI2FPw'),
                                  iconApp(Logos.instagram,
                                      'https://www.instagram.com/sazarcode/'),
                                  imageIconApp('lib/assets/enfo/enfo.webp', '')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/