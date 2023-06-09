import 'package:cerberusprogrammer/android/screens/home/app_bar.dart';
import 'package:cerberusprogrammer/android/screens/contact/contact_me_apps.dart';
import 'package:cerberusprogrammer/android/screens/apps/featured_apps.dart';
import 'package:cerberusprogrammer/android/screens/social/one_social_apps.dart';
import 'package:cerberusprogrammer/android/screens/home.dart';
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
        : const DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size(20, 60), child: AppBarCustom()),
              body: TabBarView(
                children: [
                  AndroidHome(),
                  AndroidHome(),
                  AndroidHome(),
                ],
              ),
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.directions_car,
                    ),
                    text: 'Games',
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: 'Apps',
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bike),
                    text: 'Favorites',
                  ),
                ],
              ),
            ),
          );
  }
}
