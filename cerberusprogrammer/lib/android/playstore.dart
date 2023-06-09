import 'package:cerberusprogrammer/android/app_bar.dart';
import 'package:cerberusprogrammer/android/home.dart';
import 'package:flutter/material.dart';

class PlayStore extends StatefulWidget {
  const PlayStore({super.key});

  @override
  State<PlayStore> createState() => _PlayStoreState();
}

class _PlayStoreState extends State<PlayStore> {
  final int _selectedIndex = 0;

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
        icon: Icon(Icons.favorite_border),
        selectedIcon: Icon(Icons.favorite),
        label: Text('First'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.bookmark_border),
        selectedIcon: Icon(Icons.book),
        label: Text('Second'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.games),
        selectedIcon: Icon(Icons.star),
        label: Text('Third'),
      ),
    ];
  }

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
                  onDestinationSelected: (int index) {},
                  labelType: NavigationRailLabelType.all,
                  destinations: buildNavigationRailDestinations(),
                ),
                const Expanded(child: AndroidHome())
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
