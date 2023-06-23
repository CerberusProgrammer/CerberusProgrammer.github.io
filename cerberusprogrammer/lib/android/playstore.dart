import 'package:cerberusprogrammer/android/presentation/home/widget/app_bar.dart';
import 'package:cerberusprogrammer/android/presentation/contact/contact_me_apps.dart';
import 'package:cerberusprogrammer/android/presentation/apps/featured_apps.dart';
import 'package:cerberusprogrammer/android/presentation/social/one_social_apps.dart';
import 'package:cerberusprogrammer/android/presentation/home.dart';
import 'package:flutter/material.dart';

class PlayStore extends StatefulWidget {
  const PlayStore({super.key});

  @override
  State<PlayStore> createState() => _PlayStoreState();
}

class _PlayStoreState extends State<PlayStore> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavigationItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'First',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        label: 'Second',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Third',
      ),
    ];
  }

  List<NavigationRailDestination> buildNavigationRailDestinations() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.dashboard_outlined),
        selectedIcon: Icon(Icons.dashboard),
        label: Text('Apps'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.person_2_outlined),
        selectedIcon: Icon(Icons.person_2),
        label: Text('Contact'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.share_outlined),
        selectedIcon: Icon(Icons.share),
        label: Text('Social'),
      ),
    ];
  }

  List<Widget> pages = const [
    AndroidHome(),
    FeaturedApps(),
    ContactMeApps(),
    OneSocialApps(),
  ];

  @override
  Widget build(BuildContext context) {
    bool orientation =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return orientation
        ? Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size(20, 60), child: AppBarCustom()),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavigationRail(
                  groupAlignment: 0,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: buildNavigationRailDestinations(),
                ),
                Expanded(child: pages[_selectedIndex])
              ],
            ),
          )
        : DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: const PreferredSize(
                  preferredSize: Size(20, 60), child: AppBarCustom()),
              body: TabBarView(
                children: pages,
              ),
              bottomNavigationBar: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                    ),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.dashboard),
                    text: 'Apps',
                  ),
                  Tab(
                    icon: Icon(Icons.person_2),
                    text: 'Contact',
                  ),
                  Tab(
                    icon: Icon(Icons.share),
                    text: 'Social',
                  ),
                ],
              ),
            ),
          );
  }
}
